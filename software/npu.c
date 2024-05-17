///////////////////////////////////////
// compile with
// gcc npu.c -o npu -lm
///////////////////////////////////////
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/ipc.h> 
#include <sys/shm.h> 
#include <sys/mman.h>
#include <sys/time.h> 
#include <math.h>
//#include "address_map_arm_brl4.h"

#define INST_SRAM_BASE     0xC0060000
#define INST_SRAM_SPAN     0x00001FFF
#define INST_DONE_SRAM_BASE     0xC0070000
#define INST_DONE_SRAM_SPAN     0x000001FF
// #define INST_VALID_SRAM_BASE     0xC0029200
// #define INST_VALID_SRAM_SPAN     0x000001FF
#define SRAM_BASE     0xC0000000
#define SRAM_SPAN     0x0005FFFF

#define SRAM0_BASE  0x00058000
#define SRAM1_BASE  0x00050000
#define SRAM2_BASE  0x00048000
#define SRAM3_BASE  0x00040000
#define SRAM4_BASE  0x00038000
#define SRAM5_BASE  0x00030000
#define SRAM6_BASE  0x00028000
#define SRAM7_BASE  0x00020000
#define SRAM8_BASE  0x00018000
#define SRAM9_BASE  0x00010000
#define SRAM10_BASE 0x00008000
#define SRAM11_BASE 0x00000000

#define HW_REGS_BASE          0xff200000
#define HW_REGS_SPAN          0x00005000

#define FIXED_POINT_SHIFT 14
#define FIXED_POINT_MASK ((1 << FIXED_POINT_SHIFT) - 1)



#define fix2int(a) (int)(a>>14)
#define int2fix(a) (int)(a<<14)
#define fix2float(a) ((float)(a) / 16384.0)
#define float2fix(a) (int)(a * 16384.0)



#define ROWS_A 10
#define COLS_A 507
#define COLS_B 1

#define IMAGE_SIZE 28
#define POOLED_SIZE 13
#define FILTER_SIZE 3
#define NUM_CLASSES 10
#define NUM_FILTERS 3


typedef struct {
    unsigned long long low;
    unsigned long long high;
} uint128_t;


void set_value(volatile uint128_t *ptr, unsigned long long high, unsigned long long low) {
    ptr->high = high;
    ptr->low = low;
}

void print_value(volatile uint128_t *ptr) {
    printf("High: %llu, Low: %llu\n", ptr->high, ptr->low);
}


// the light weight buss base
void *h2p_lw_virtual_base;

// RAM FPGA command buffer
volatile uint128_t * inst_ptr = NULL ;
void *inst_virtual_base;

volatile char * inst_done_ptr = NULL ;
void *inst_done_virtual_base;

volatile short * sram_ptr = NULL ;
void *sram_virtual_base;

volatile short * sram1_ptr = NULL ;
void *sram1_virtual_base;
// volatile unsigned short * source1_ptr = NULL ;
// void *source1_virtual_base;
// volatile unsigned short * source2_ptr = NULL ;
// void *source2_virtual_base;
// volatile unsigned short * dest_ptr = NULL ;
// void *dest_virtual_base;

// /dev/mem file id
int fd;
	
// measure time
struct timeval t1, t2;
double elapsedTime;
struct timespec delay_time ;


typedef unsigned short ushort;
typedef unsigned int uint;

uint as_uint(const float x);
float as_float(const uint x);

float half_to_float(const ushort x);
ushort float_to_half(const float x);
 
uint as_uint(const float x) {
    return *(uint*)&x;
}
float as_float(const uint x) {
    return *(float*)&x;
}

float half_to_float(const ushort x) {
    const uint e = (x&0x7C00)>>10; // exponent
    const uint m = (x&0x03FF)<<13; // mantissa
    const uint v = as_uint((float)m)>>23; // evil log2 bit hack to count leading zeros in denormalized format
    return as_float((x&0x8000)<<16 | (e!=0)*((e+112)<<23|m) | ((e==0)&(m!=0))*((v-37)<<23|((m<<(150-v))&0x007FE000))); // sign : normalized : denormalized
}
ushort float_to_half(const float x) { 
    const uint b = as_uint(x)+0x00001000; // round-to-nearest-even: add last bit after truncated mantissa
    const uint e = (b&0x7F800000)>>23; // exponent
    const uint m = b&0x007FFFFF; // mantissa; in line below: 0x007FF000 = 0x00800000-0x00001000 = decimal indicator flag - initial rounding
    return (b&0x80000000)>>16 | (e>112)*((((e-112)<<10)&0x7C00)|m>>13) | ((e<113)&(e>101))*((((0x007FF000+m)>>(125-e))+1)>>1) | (e>143)*0x7FFF; // sign : normalized : denormalized : saturate
}

// FP16 add
ushort fp16_add(ushort a, ushort b) {
    float fa = half_to_float(a);
    float fb = half_to_float(b);
    float result = fa + fb;
    return float_to_half(result);
}

// FP16 mult
ushort fp16_mul(ushort a, ushort b) {
    float fa = half_to_float(a);
    float fb = half_to_float(b);
    float result = fa * fb;
    return float_to_half(result);
}

ushort fp16_compare(ushort a, ushort b) {
    float fa = half_to_float(a);
    float fb = half_to_float(b);
    return (fa > fb) ? 1 : 0;
}

uint128_t gen_inst(const char* op, unsigned int src1, unsigned int src2, unsigned int dest, unsigned int src1_row, unsigned int src1_col, unsigned int src2_row, unsigned int src2_col) {
    uint128_t result = {0, 0};
	int func = 0;

    if (strcmp(op, "ADD") == 0) 
	{
        result.high |= (0x1ULL << 60); // 0001
		func = 0;
    } 
	else if (strcmp(op, "CONV") == 0) 
	{
        result.high |= (0x7ULL << 60); // 0111
		func = 1;
    } 
	else if (strcmp(op, "CONV2") == 0) 
	{
        result.high |= (0x9ULL << 60); // 1001
		func = 7;
    } 
	else if (strcmp(op, "CONV3") == 0) 
	{
        result.high |= (0xBULL << 60); // 1011
		func = 8;
    } 
	else if (strcmp(op, "POOL") == 0) 
	{
        result.high |= (0x8ULL << 60); // 1000
		func = 2;
    }
	else if (strcmp(op, "RELU") == 0) 
	{
        result.high |= (0xAULL << 60); // 1010
		func = 3;
    }
	else if (strcmp(op, "DOT") == 0) 
	{
        result.high |= (0x6ULL << 60); // 0110
		func = 4;
    }
	else if (strcmp(op, "SUB") == 0)
	{
		result.high |= (0x2ULL << 60); // 0010
		func = 5;
	}
	else if (strcmp(op, "MULT") == 0)
	{
		result.high |= (0x3ULL << 60); // 0011
		func = 6;
	}

	*(inst_done_ptr+func) = 0x00;

	if(strcmp(op, "DOT") == 0){
		result.high |= ((unsigned long long)src1 << 28); // src1
		result.high |= ((unsigned long long)src2 >> 4);  // src2
		result.low |= ((unsigned long long)dest << 60);  // src3
		result.low |= ((unsigned long long)dest << 28);  // dest

		result.low |= ((unsigned long long)src1_row << 16); // src1_row
		result.low |= ((unsigned long long)src1_col << 8); // src1_col

		result.low |= ((unsigned long long)src2_row);  // src2_row
		// result.low |= (unsigned long long)src2_col;         // src2_col
	}
	else {
		result.high |= ((unsigned long long)src1 << 28); // src1
		result.high |= ((unsigned long long)src2 >> 4);  // src2
		result.low |= ((unsigned long long)dest << 60);  // src3
		result.low |= ((unsigned long long)dest << 28);  // dest

		result.low |= ((unsigned long long)src1_row << 19); // src1_row
		result.low |= ((unsigned long long)src1_col << 10); // src1_col

		result.low |= ((unsigned long long)src2_row << 5);  // src2_row
		result.low |= (unsigned long long)src2_col;         // src2_col
	}


	printf("%016llx%016llx\n", result.high, result.low);

	*inst_ptr = result;
	inst_ptr = inst_ptr+1;

	while(*(inst_done_ptr+func) == 0x00);
	// inst_done_ptr = inst_done_ptr + 1;
	

    return result;
}

short fixed_point_multiply(short a, short b) {
    int temp = (int)a * (int)b; 
    temp >>= FIXED_POINT_SHIFT;
    return (short)temp;
}


void matrix_multiply(short *A, short *B, short *C, int rows_a, int cols_a, int cols_b) {
    int i = 0;
    int j = 0;
    int k = 0;
    short sum = 0;
	short temp = 0;
    for (i = 0; i < rows_a; i++) {
        for (j = 0; j < cols_b; j++) {
            sum = 0;
            for (k = 0; k < cols_a; k++) {
                // sum += *(A + i * cols_a + k) * *(B + k * cols_b + j);
				temp = fp16_mul(*(A + i * cols_a + k), *(B + k * cols_b + j));
				sum = fp16_add(temp, sum );
            }
            *(C + i * cols_b + j) = sum;
        }
    }
}

void matrix_add(short *A, short *B, short *C, int rows_a, int cols_a) {
    int i = 0;
    int j = 0;
    int k = 0;
    short sum = 0;
	short temp = 0;
    for (i = 0; i < rows_a; i++) {
        for (j = 0; j < cols_a; j++) {
            *(C + i * cols_a + j) = fp16_add(*(A + i * cols_a + j), *(B + i * cols_a + j));
        }
    }
}


void matrix_convolution(short *A, short *B, short *C, int rows_a, int cols_a, int rows_b, int cols_b) {
    int output_rows = rows_a - rows_b + 1;
    int output_cols = cols_a - cols_b + 1;
    int i, j, k, l;
    short sum, temp;
	int index_a;
	int index_b;

    for (i = 0; i < output_rows; i++) {
        for (j = 0; j < output_cols; j++) {
            sum = 0;
            for (k = 0; k < rows_b; k++) {
                for (l = 0; l < cols_b; l++) {
                    index_a = (i + k) * cols_a + (j + l);
                    index_b = k * cols_b + l;
    
                    temp = fp16_mul(*(A + index_a), *(B + index_b));
                    sum = fp16_add(sum, temp);
                }
            }

            *(C + i * output_cols + j) = sum;
        }
    }
}

void max_pooling(short *A, short *C, int rows_a, int cols_a, int pool_size) {
    int output_rows = rows_a / pool_size;
    int output_cols = cols_a / pool_size;
    int i, j, k, l;
	short max_val;
	short current_val;

    for (i = 0; i < output_rows; i++) {
        for (j = 0; j < output_cols; j++) {
            max_val = A[(i * pool_size) * cols_a + (j * pool_size)];
            for (k = 0; k < pool_size; k++) {
                for (l = 0; l < pool_size; l++) {
                    current_val = A[(i * pool_size + k) * cols_a + (j * pool_size + l)];
                    if (fp16_compare(current_val, max_val)) {
                        max_val = current_val;
                    }
                }
            }
            C[i * output_cols + j] = max_val;
        }
    }
}

void relu(short *input, short *output, int rows, int cols) {
	int index;
	short value;
	int i,j;

    for (i = 0; i < rows; i++) {
        for (j = 0; j < cols; j++) {
            index = i * cols + j;
            value = input[index];
            if (value < 0) 
			{
                output[index] = 0;
            } 
			else
			{
                output[index] = value;
            }
        }
    }
}

void padding(const short *input, short *output, int rows, int cols, int padding) {
    int padded_rows = rows + padding;
    int padded_cols = cols + padding;
	int i;

    memset(output, 0, padded_rows * padded_cols * sizeof(short));

    for (i = 0; i < rows; i++) {
        memcpy(output + (i + padding) * padded_cols + padding, input + i * cols, cols * sizeof(short));
    }
}

void matrix_multiply_fp(float *A, float *B, float *C, int rows_a, int cols_a, int cols_b) {
    int i = 0;
    int j = 0;
    int k = 0;
    float sum = 0;
	float temp = 0;
    for (i = 0; i < rows_a; i++) {
        for (j = 0; j < cols_b; j++) {
            sum = 0;
            for (k = 0; k < cols_a; k++) {
				temp = (*(A + i * cols_a + k) * *(B + k * cols_b + j));
				sum = temp + sum ;
            }
            *(C + i * cols_b + j) = sum;
        }
    }
}


void matrix_convolution_fp(float *A, float *B, float *C, int rows_a, int cols_a, int rows_b, int cols_b) {
    int output_rows = rows_a - rows_b + 1;
    int output_cols = cols_a - cols_b + 1;
    int i, j, k, l;
    float sum, temp;
	int index_a;
	int index_b;

    for (i = 0; i < output_rows; i++) {
        for (j = 0; j < output_cols; j++) {
            sum = 0;
            for (k = 0; k < rows_b; k++) {
                for (l = 0; l < cols_b; l++) {
                    index_a = (i + k) * cols_a + (j + l);
                    index_b = k * cols_b + l;
    
                    temp = (*(A + index_a)) * (*(B + index_b));
                    sum += temp;
                }
            }

            *(C + i * output_cols + j) = sum;
        }
    }
}

void max_pooling_fp(float *A, float *C, int rows_a, int cols_a, int pool_size) {
    int output_rows = rows_a / pool_size;
    int output_cols = cols_a / pool_size;
    int i, j, k, l;
	float max_val;
	float current_val;

    for (i = 0; i < output_rows; i++) {
        for (j = 0; j < output_cols; j++) {
            max_val = A[(i * pool_size) * cols_a + (j * pool_size)];
            for (k = 0; k < pool_size; k++) {
                for (l = 0; l < pool_size; l++) {
                    current_val = A[(i * pool_size + k) * cols_a + (j * pool_size + l)];
                    if (current_val > max_val) {
                        max_val = current_val;
                    }
                }
            }
            C[i * output_cols + j] = max_val;
        }
    }
}

void relu_fp(float *input, float *output, int rows, int cols) {
	int index;
	float value;
    int i,j;

    for (i = 0; i < rows; i++) {
        for (j = 0; j < cols; j++) {
            index = i * cols + j;
            value = input[index];
            if (value < 0) 
			{
                output[index] = 0;
            } 
			else
			{
                output[index] = value;
            }
        }
    }
}

void flatten_fp(float *input, float *output, int channels, int height, int width) {
    int size = height * width;
    int c,i;
    for (c = 0; c < channels; c++) {
        for (i = 0; i < size; i++) {
            output[c * size + i] = input[c * size + i];
        }
    }
}



void normalize_image_fp(unsigned char *input, float *output, int rows, int cols, float mean, float std_dev) {
    int i, j;
    int index;
    float scale = 1.0 / 255.0;  // Scaling factor to convert pixels to [0, 1]

    // Normalize image data
    for (i = 0; i < rows; i++) {
        for (j = 0; j < cols; j++) {
            index = i * cols + j;
            // Scale pixel to [0, 1], then normalize using the given mean and std_dev
            output[index] = (input[index] * scale - mean) / std_dev;
        }
    }

    // Optionally, print the normalized data
    for (i = 0; i < rows; i++) {
        for (j = 0; j < cols; j++) {
            printf("%f ", output[i * cols + j]);
        }
        printf("\n");
    }
    printf("normalized image loaded.\n");
}

int read_data(const char *filename, float * weights, int nrow, int ncol) {
      FILE *fp;
      float data[nrow][ncol]; 

      // open file
      fp = fopen(filename, "r");
      if (fp == NULL) {
            printf("Error: Unable to open file.\n");
            return 1;
      }

      // read and store
      int i,j;
      for ( i = 0; i < nrow; i++) {
            for ( j = 0; j < ncol; j++) {
                  if (fscanf(fp, "%f,", &weights[i*ncol+j]) != 1) {
                        printf("Error: Failed to read data from file.\n");
                        return 1;
                  }
            }
      }

      // print
    //   for ( i = 0; i < nrow; i++) {
    //         for ( j = 0; j < ncol; j++) {
    //               printf("%f ", weights[i*ncol+j]);
    //         }
    //         printf("\n\n");
    //   }

      //close
      fclose(fp);

      return 0;
}

void lenet(float *image, float *weights_conv, float *weights_fc, float *output_fc) {
    float feature_maps[NUM_FILTERS][26][26];
    float feature_maps_relu[NUM_FILTERS][26][26];
    float pooled_output[NUM_FILTERS][POOLED_SIZE][POOLED_SIZE];
    float flat_output[NUM_FILTERS * POOLED_SIZE * POOLED_SIZE];
    float fc_output[NUM_CLASSES];

    int i,j,k,f;
    // Apply Convolution for each filter
    for ( f = 0; f < NUM_FILTERS; f++) {
        matrix_convolution_fp(image, weights_conv + f * FILTER_SIZE * FILTER_SIZE, 
                           (float *)feature_maps[f], IMAGE_SIZE, IMAGE_SIZE, FILTER_SIZE, FILTER_SIZE);
        relu_fp((float *)feature_maps[f], (float *)feature_maps_relu[f], 26, 26);
    }

    // Apply Pooling for each feature map
    for (f = 0; f < NUM_FILTERS; f++) {
        max_pooling_fp((float *)feature_maps_relu[f], (float *)pooled_output[f], 26, 26, 2);
    }

    matrix_multiply_fp(weights_fc, (float *)pooled_output, output_fc, 10, 507, 1);

    for (i = 0; i < NUM_CLASSES; i++) {
        printf("%d: %f\n",i, output_fc[i]);
    }

}


void generate_matrix(short *matrix, int rows, int cols) {
    int i, j;
	short random_number;
	float random_float = 1.0f + (float)rand() / (float)(RAND_MAX / 2.0f);
    for (i = 0; i < rows; i++) {
        for (j = 0; j < cols; j++) {
            random_number = rand() % 3;
			random_float = 1.0f + (float)rand() / (float)(RAND_MAX / 2.0f);
            *(matrix + i * cols + j) = float_to_half(random_float);
        }
    }
}

void compare_and_print(short *result, short *answer, int rows_a, int cols_b) {
	int i = 0;
	int j = 0;
	int mismatch=0;
    for (i = 0; i < rows_a; i++) {
        for (j = 0; j < cols_b; j++) {
            int index = i * cols_b + j; 
            if (result[index] != answer[index]) {
                printf("Mismatch at [%d][%d]: Calculated = %f, Answer = %f\n", i, j, half_to_float(result[index]), half_to_float(answer[index]));
				mismatch=mismatch+1;
            }
			else{
				printf("position%d, value:%f\n", index, half_to_float(*(result+index)));
			}
        }
    }
	if(mismatch == 0) {
		printf("All Match\n");
	}
	else{
		printf("Mismatch Num: %d\n", mismatch);
	}
}

void write_matrix(short *matrix, int rows, int cols, volatile short *array) {
    int index = 0;
	int i = 0;
	int j = 0;
    for (i = 0; i < rows; i++) {
        for (j = 0; j < cols; j++) {
            *(array + i * cols + j) = *(matrix + i * cols + j);
			index++;
        }
    }
}

void read_matrix(volatile short *array, int rows, int cols, short *matrix) {
	int i = 0;
	int j = 0;
    for (i = 0; i < rows; i++) {
        for (j = 0; j < cols; j++) {
            *(matrix + i * cols + j) = *(array + i * cols + j);
        }
    }
}


void matrix_op(const char *op, short *A, short *B, short *C, int base_a, int base_b, int base_c, int rows_a, int cols_a, int rows_b, int cols_b, int software_check) {
    
	if(software_check == 1)
	{
		generate_matrix((short *)A, rows_a, cols_a);
		generate_matrix((short *)B, rows_b, cols_b);
	}
	

    write_matrix((short *)A, rows_a, cols_a, sram_ptr + base_a / 2);
    write_matrix((short *)B, rows_b, cols_b, sram_ptr + base_b / 2);

    gen_inst(op, base_a, base_b, base_c, cols_a, rows_a, cols_b, rows_b);

	read_matrix(sram_ptr + base_c / 2 ,rows_a, cols_a, (short *)C);
  
	if(software_check == 1)
	{
		if (strcmp(op, "ADD") == 0) {

			short answer[rows_a][cols_a];

			matrix_add((short *)A, (short *)B, (short *)answer, rows_a, cols_a);

			compare_and_print((short *)C, (short *)answer, rows_a, cols_a);
		} 
		if (strcmp(op, "CONV") == 0) {

			short answer[rows_a-rows_b+1][cols_a-cols_b+1];

			matrix_convolution((short *)A, (short *)B, (short *)answer, rows_a, cols_a, rows_b, cols_b);

			compare_and_print((short *)C, (short *)answer, rows_a-rows_b+1, cols_a-cols_b+1);
			
		} 
		else if (strcmp(op, "POOL") == 0) {

			short answer[rows_a/rows_b][rows_a/rows_b];

			max_pooling((short *)A, (short *)answer, rows_a, cols_a, rows_b);

			compare_and_print((short *)C, (short *)answer, rows_a/rows_b, rows_a/rows_b);
			
		}
		else if (strcmp(op, "RELU") == 0) {

			short answer[rows_a][cols_a];

			relu((short *)A, (short *)answer, rows_a, cols_a);

			compare_and_print((short *)C, (short *)answer, rows_a, cols_a);
			
		}
		else if (strcmp(op, "DOT") == 0) {

			short answer[rows_a][cols_b];

			matrix_multiply((short *)A, (short *)B, (short *)answer, rows_a, cols_a, cols_b);

			compare_and_print((short *)C, (short *)answer, rows_a, cols_b);
			
		}
	}

}
	
int main(void)
{
	delay_time.tv_nsec = 10 ;
	delay_time.tv_sec = 0 ;
	srand(time(NULL));

	// Declare volatile pointers to I/O registers (volatile 	// means that IO load and store instructions will be used 	// to access these pointer locations, 
	// instead of regular memory loads and stores) 
  	
	// === need to mmap: =======================
	// FPGA_CHAR_BASE
	// FPGA_ONCHIP_BASE      
	// HW_REGS_BASE        
  
	// === get FPGA addresses ==================
    // Open /dev/mem
	if( ( fd = open( "/dev/mem", ( O_RDWR | O_SYNC ) ) ) == -1 ) 	{
		printf( "ERROR: could not open \"/dev/mem\"...\n" );
		return( 1 );
	}
    
    // get virtual addr that maps to physical
	// for light weight bus
	h2p_lw_virtual_base = mmap( NULL, HW_REGS_SPAN, ( PROT_READ | PROT_WRITE ), MAP_SHARED, fd, HW_REGS_BASE );	
	if( h2p_lw_virtual_base == MAP_FAILED ) {
		printf( "ERROR: mmap1() failed...\n" );
		close( fd );
		return(1);
	}
	
	// === get INST_SRAM parameter addr =========
	inst_virtual_base = mmap( NULL, INST_SRAM_SPAN, ( PROT_READ | PROT_WRITE ), MAP_SHARED, fd, INST_SRAM_BASE); //fp	
	
	if( inst_virtual_base == MAP_FAILED ) {
		printf( "ERROR: mmap3() failed...\n" );
		close( fd );
		return(1);
	}
    // Get the address that maps to the RAM
	inst_ptr =(uint128_t *)(inst_virtual_base);

	inst_done_virtual_base = mmap( NULL, INST_DONE_SRAM_SPAN, ( PROT_READ | PROT_WRITE ), MAP_SHARED, fd, INST_DONE_SRAM_BASE); //fp	
	
	if( inst_done_virtual_base == MAP_FAILED ) {
		printf( "ERROR: mmap3() failed...\n" );
		close( fd );
		return(1);
	}
    // Get the address that maps to the RAM
	inst_done_ptr =(char *)(inst_done_virtual_base);

    // === get INPUT_SRAM parameter addr =========
	sram_virtual_base = mmap( NULL, SRAM_SPAN, ( PROT_READ | PROT_WRITE ), MAP_SHARED, fd, SRAM_BASE); //fp	
	
	if( sram_virtual_base == MAP_FAILED ) {
		printf( "ERROR: mmap3() failed...\n" );
		close( fd );
		return(1);
	}
    // Get the address that maps to the RAM 
	sram_ptr =(unsigned short *)(sram_virtual_base);

	sram1_virtual_base = mmap( NULL, 0xFFF, ( PROT_READ | PROT_WRITE ), MAP_SHARED, fd, SRAM_BASE+SRAM3_BASE); //fp	
	
	if( sram_virtual_base == MAP_FAILED ) {
		printf( "ERROR: mmap3() failed...\n" );
		close( fd );
		return(1);
	}
    // Get the address that maps to the RAM 
	sram1_ptr =(unsigned short *)(sram1_virtual_base);

    int i,j,k;
	// clear inst_sram
	for (i = 0; i < 100; i++) {
        set_value((inst_ptr + i), 0x0ULL, 0x0ULL); 
    }

	// int rows_a = 5;
	// int cols_a = 5;
	// int rows_b = 5;
	// int cols_b = 5;

	// short A[100][100];
	// short B[100][100];
	// short add_result[rows_a][cols_b];


	// matrix_op("ADD", (short *)A, (short *)B, (short *)add_result, SRAM0_BASE, SRAM1_BASE, SRAM2_BASE,  rows_a, cols_a, rows_b, cols_b, 1);

	// // for (i = 0; i < 25; i++) {
    // //     printf("1Value at position %d: %f\n", i, half_to_float(*(sram_ptr+ SRAM0_BASE/2 + i)));
    // // }
	// // for (i = 0; i < 25; i++) {
    // //     printf("2Value at position %d: %f\n", i, half_to_float(*(sram_ptr+ SRAM1_BASE/2 + i)));
    // // }
	// // for (i = 0; i < 25; i++) {
    // //     printf("3Value at position %d: %f\n", i, half_to_float(*(sram_ptr+ SRAM2_BASE/2 + i)));
    // // }

	
	// rows_a = 28;
	// cols_a = 28;
	// rows_b = 3;
	// cols_b = 3;

	// short conv_result[rows_a-rows_b+1][cols_a-cols_b+1];

	// matrix_op("CONV", (short *)A, (short *)B, (short *)conv_result, SRAM3_BASE, SRAM4_BASE, SRAM5_BASE,  rows_a, cols_a, rows_b, cols_b, 1);

	// rows_a = 5;
	// cols_a = 5;
	// rows_b = 5;
	// cols_b = 5;

	// short dot_result[rows_a][cols_b];

	// matrix_op("DOT", (short *)A, (short *)B, (short *)dot_result, SRAM6_BASE, SRAM7_BASE, SRAM8_BASE,  rows_a, cols_a, rows_b, cols_b, 1);

	// rows_a = 8;
	// cols_a = 8;
	// rows_b = 2;
	// cols_b = 2;

	// short pool_result[4][4];

	// matrix_op("POOL", (short *)A, (short *)B, (short *)pool_result, SRAM0_BASE, SRAM1_BASE, SRAM2_BASE,  rows_a, cols_a, rows_b, cols_b, 1);

	// rows_a = 5;
	// cols_a = 5;
	// rows_b = 5;
	// cols_b = 5;

	// short relu_result[5][5];

	// matrix_op("RELU", (short *)A, (short *)B, (short *)relu_result, SRAM0_BASE, SRAM1_BASE, SRAM2_BASE,  rows_a, cols_a, rows_b, cols_b, 1);
	const int num_conv_weights = 3 * 3 * 3; // Assuming 3 3x3 filters
    const int num_fc_weights = 507 * 10;    // 507 input features, 10 outputs

    float mean = 0.5;
    float std_dev = 0.5;

	short input_image_16[IMAGE_SIZE * IMAGE_SIZE]; 
    float input_image[IMAGE_SIZE * IMAGE_SIZE];  
    float normalized_image[IMAGE_SIZE * IMAGE_SIZE];
    short fp16_image[IMAGE_SIZE * IMAGE_SIZE];
    float feature_maps[NUM_FILTERS][26][26];
    float feature_maps_relu[NUM_FILTERS][26][26];

    short weights_conv[NUM_FILTERS * FILTER_SIZE * FILTER_SIZE];
	float weights_fc[NUM_FILTERS * POOLED_SIZE * POOLED_SIZE * NUM_CLASSES]; // FC weights
    

    float weights_conv_fp[NUM_FILTERS * FILTER_SIZE * FILTER_SIZE]; // Example convolution weights
    float weights_fc_fp[NUM_FILTERS * POOLED_SIZE * POOLED_SIZE * NUM_CLASSES]; // FC weights

    float output_fc[NUM_CLASSES]; // Output array for FC layer

    // loadBMP(filename, input_image);

    // normalize_image(input_image, normalized_image, IMAGE_SIZE, IMAGE_SIZE, mean, std_dev);

    // read_data("1.csv", input_image, 28, 28);
	read_data("1.csv", input_image, 28, 28);
    read_data("fc1_weights.csv", weights_fc_fp, 10, 507);
    read_data("conv1_weight.csv", weights_conv_fp, 9, 3);

    // for ( i = 0; i < 28; i++) {
    //         for ( j = 0; j < 28; j++) {
    //               printf("%3.1f ", input_image[i*28+j]);
    //         }
    //         printf("\n");
    //   }

    // generate instructions
    int rows_a = 5;
	int cols_a = 5;
	int rows_b = 5;
	int cols_b = 5;

    rows_a = 28;
	cols_a = 28;
	rows_b = 3;
	cols_b = 3;

	short conv0_result[rows_a-rows_b+1][cols_a-cols_b+1];
	short conv1_result[rows_a-rows_b+1][cols_a-cols_b+1];
	short conv2_result[rows_a-rows_b+1][cols_a-cols_b+1];
    short relu0_result[26][26];
	short relu1_result[26][26];
	short relu2_result[26][26];
    short pool0_result[13][13];
	short pool1_result[13][13];
	short pool2_result[13][13];
    short fc_in[507];
	short fc_out[10];

    matrix_op("CONV", (short *)input_image, (short *)weights_conv, (short *)conv0_result, SRAM0_BASE, SRAM1_BASE, SRAM2_BASE,  28, 28, 3, 3, 0);

    matrix_op("CONV", (short *)input_image, (short *)weights_conv+9, (short *)conv1_result, SRAM3_BASE, SRAM4_BASE, SRAM5_BASE,  28, 28, 3, 3, 0);

    matrix_op("CONV", (short *)input_image, (short *)weights_conv+18, (short *)conv2_result, SRAM6_BASE, SRAM7_BASE, SRAM8_BASE,  28, 28, 3, 3, 0);

    matrix_op("RELU", (short *)conv0_result, (short *)weights_conv, (short *)relu0_result, SRAM2_BASE, SRAM0_BASE, SRAM9_BASE,  26, 26, 0, 0, 0);

    matrix_op("RELU", (short *)conv1_result, (short *)weights_conv, (short *)relu1_result, SRAM5_BASE, SRAM0_BASE, SRAM10_BASE,  26, 26, 0, 0, 0);

    matrix_op("RELU", (short *)conv2_result, (short *)weights_conv, (short *)relu2_result, SRAM8_BASE, SRAM0_BASE, SRAM11_BASE,  26, 26, 0, 0, 0);

	// for(i = 0; i < 13*13 ;i++) 
    // {   
    //     pool0_result[i] = relu0_result[i];
    // }

	// for(i = 13*13; i < 2*13*13 ;i++) 
    // {   
    //     pool1_result[i] = relu1_result[i];
    // }

	// for(i = 2*13*13; i < 3*13*13 ;i++) 
    // {   
    //     pool2_result[i] = relu2_result[i];
    // }


    matrix_op("POOL", (short *)relu0_result, (short *)weights_conv, (short *)pool0_result, SRAM2_BASE, SRAM0_BASE, SRAM9_BASE,  26, 26, 2, 2, 0);

    matrix_op("POOL", (short *)relu1_result, (short *)weights_conv, (short *)pool1_result, SRAM5_BASE, SRAM0_BASE, SRAM10_BASE,  26, 26, 2, 2, 0);

    matrix_op("POOL", (short *)relu2_result, (short *)weights_conv, (short *)pool2_result, SRAM8_BASE, SRAM1_BASE, SRAM11_BASE,  26, 26, 2, 2, 0);

    for(i = 0; i < 13*13 ; i++) 
    {   
        fc_in[i] = pool0_result[i];
    }

	for(i = 13*13; i < 2*13*13 ;i++) 
    {   
        fc_in[i] = pool1_result[i];
    }

	for(i = 2*13*13; i < 3*13*13 ;i++) 
    {   
        fc_in[i] = pool2_result[i];
    }

    matrix_op("DOT", (short *)weights_fc, (short *)fc_in, (short *)fc_out, SRAM2_BASE, SRAM1_BASE, SRAM9_BASE,  10, 507, 10, 1, 0);




    // lenet(input_image, weights_conv_fp, weights_fc_fp, output_fc);


    
    // return 0;
	
	inst_ptr =(uint128_t *)(inst_virtual_base);
	for (i = 0; i < 10; i++) {
        printf("Position %d -> %016llx%016llx\n", i, (inst_ptr + i)->high, (inst_ptr + i)->low);
    }

	inst_done_ptr =(char *)(inst_done_virtual_base);
	for (i = 0; i < 10; i++) {
        printf("Position %d -> %d\n", i, *(inst_done_ptr + i));
    }



	// sleep(3);
	// }
    return 0;
    
} // end main


/////////////////////////////////////////////