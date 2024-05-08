module matrix_conv(
    input clk,
    input reset,
    input start,
    output reg done,
    input wire [13:0] src1_start_address,
    input wire [13:0] src2_start_address,
    output reg [13:0] src1_address,
    input wire [15:0] src1_readdata,
    output wire [15:0] src1_writedata,
    output wire src1_write_en,
    output reg [13:0] src2_address,
    input wire [15:0] src2_readdata,
    output wire [15:0] src2_writedata,
    output wire src2_write_en,
    input wire [9:0] src1_row_size, // input matrix
    input wire [9:0] src1_col_size,
    input wire [5:0] src2_row_size, // kernel
    input wire [5:0] src2_col_size,
    input wire [13:0] dest_start_address,
    output reg [13:0] dest_address,
    input wire [15:0] dest_readdata,
    output wire [15:0] dest_writedata,
    output reg dest_write_en
);
    // states
    localparam IDLE = 3'd0,
               READ_KERNEL = 3'd1,
               CALC = 3'd2,
               SLIDE = 3'd3,
               WRITE = 3'd4,
               DONE = 3'd5;

    reg [9:0] i,j,m,n;

    reg [3:0] i_k, j_k;

    reg [15:0] kernel [3:0][3:0];
    reg [13:0] kernel_address;

    reg [2:0] state, next_state;

    reg [15:0] sum;
    wire [15:0] product;
    wire [15:0] sum_plus_product;

    assign src1_write_en = 0;
    assign src2_write_en = 0;
    assign src1_writedata = 0;
    assign src2_writedata = 0;

    assign dest_writedata = sum;

    always @(posedge clk, posedge reset) begin
        if (reset) begin
            state <= IDLE;
        end else begin
            state <= next_state;
        end
    end

    always @(*) begin
        case(state)
            IDLE: begin
                done = 1;
                if (start) begin
                    next_state = READ_KERNEL;
                end
                else begin
                    next_state = IDLE;
                end
            end

            READ_KERNEL: begin
                done = 0;
                if ( (i_k == src2_col_size-1) && (j_k == src2_row_size-1) ) begin
                    next_state = CALC;
                    
                end
                else begin
                    next_state = READ_KERNEL;
                end
            end

            CALC: begin
                done = 0;
                if  (( j == src2_row_size-1) && ( i == src2_col_size-1)) begin
                    next_state = WRITE;
                end
                else begin
                    next_state = CALC;
                end
            end

            SLIDE: begin
                done = 0;
                next_state = CALC;
            end

            WRITE: begin
                done = 0;
                if  ((m == (src1_col_size - src2_col_size - 1 + (src2_col_size >> 1))) && (n == (src1_row_size - src2_row_size - 1 + (src2_row_size >> 1)))) begin
                    next_state = DONE;
                end
                else begin
                    next_state = SLIDE;
                end
            end
            DONE: begin
                next_state = IDLE;
                done = 1;
            end
            default: begin
                next_state = IDLE;
                done = 1;
            end

        endcase
    end

    always @(posedge clk) begin
        case(state)
            IDLE: begin
                dest_write_en <= 0;
                i <= 0;
                j <= 0;
                m <= 0;
                n <= 0;
                i_k <= 0;
                j_k <= 0;
                sum <= 0;
                src1_address <= src1_start_address;
                src2_address <= src2_start_address;
                dest_address <= dest_start_address;
                kernel_address <= src1_start_address;
            end

            READ_KERNEL: begin
                src2_address <= src2_address+1;
                kernel[i_k][j_k] <= src2_readdata;
                if(j_k == src2_row_size - 1) begin
                    j_k <= 0;
                    i_k <= i_k + 1;
                end
                else begin
                    j_k <= j_k + 1;
                end
            end

            CALC: begin
               sum <= sum + src1_readdata * kernel[i][j]; // sum
                // sum <= sum_plus_product;
                if(j == src2_row_size - 1 ) begin
                    j<=0;
                    if(i == src2_row_size - 1) begin
                        dest_write_en<=1;
                        i<=0;
                    end
                    else begin
                        dest_write_en<=0;
                        src1_address <= src1_address + src1_row_size - j; 
                        i<=i+1;
                    end
                end
                else begin
                    src1_address <= src1_address + 1;
                    j<=j+1;
                end
            end

            SLIDE: begin // slide kernel

                
                if(n == (src1_row_size - src2_row_size - 1 + (src2_row_size >> 1))) begin
                    n <= 0;
                    m <= m+1;
                    kernel_address <= kernel_address + src1_row_size - n;
                    src1_address <= kernel_address + src1_row_size - n;
                end
                else begin
                    n <= n+1;
                    kernel_address <= kernel_address + 1;
                    src1_address <= kernel_address + 1;
                end
            end
            
            WRITE: begin
                dest_write_en <= 0;
                dest_address <= dest_address + 1;
                sum <= 0;
            end
            DONE: begin
                i <= 0;
                j <= 0;
                i <= 0;
                j <= 0;
                m <= 0;
                n <= 0;
                dest_address <= dest_start_address;
                src1_address <= src1_start_address;
                src2_address <= src2_start_address;
                dest_write_en <= 0;
            end
        endcase
    end
    
    floatMult mul(
        .floatA(src1_readdata),
        .floatB(kernel[i][j]),
        .product(product)
    );
	 
	floatAdd floatadd (
        .floatA(sum),
        .floatB(product),
        .sum(sum_plus_product)
	);

endmodule