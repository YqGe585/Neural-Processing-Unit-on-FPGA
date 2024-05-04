

module DE1_SoC_Computer (
	////////////////////////////////////
	// FPGA Pins
	////////////////////////////////////

	// Clock pins
	CLOCK_50,
	CLOCK2_50,
	CLOCK3_50,
	CLOCK4_50,

	// ADC
	ADC_CS_N,
	ADC_DIN,
	ADC_DOUT,
	ADC_SCLK,

	// Audio
	AUD_ADCDAT,
	AUD_ADCLRCK,
	AUD_BCLK,
	AUD_DACDAT,
	AUD_DACLRCK,
	AUD_XCK,

	// SDRAM
	DRAM_ADDR,
	DRAM_BA,
	DRAM_CAS_N,
	DRAM_CKE,
	DRAM_CLK,
	DRAM_CS_N,
	DRAM_DQ,
	DRAM_LDQM,
	DRAM_RAS_N,
	DRAM_UDQM,
	DRAM_WE_N,

	// I2C Bus for Configuration of the Audio and Video-In Chips
	FPGA_I2C_SCLK,
	FPGA_I2C_SDAT,

	// 40-Pin Headers
	GPIO_0,
	GPIO_1,
	
	// Seven Segment Displays
	HEX0,
	HEX1,
	HEX2,
	HEX3,
	HEX4,
	HEX5,

	// IR
	IRDA_RXD,
	IRDA_TXD,

	// Pushbuttons
	KEY,

	// LEDs
	LEDR,

	// PS2 Ports
	PS2_CLK,
	PS2_DAT,
	
	PS2_CLK2,
	PS2_DAT2,

	// Slider Switches
	SW,

	// Video-In
	TD_CLK27,
	TD_DATA,
	TD_HS,
	TD_RESET_N,
	TD_VS,

	// VGA
	VGA_B,
	VGA_BLANK_N,
	VGA_CLK,
	VGA_G,
	VGA_HS,
	VGA_R,
	VGA_SYNC_N,
	VGA_VS,

	////////////////////////////////////
	// HPS Pins
	////////////////////////////////////
	
	// DDR3 SDRAM
	HPS_DDR3_ADDR,
	HPS_DDR3_BA,
	HPS_DDR3_CAS_N,
	HPS_DDR3_CKE,
	HPS_DDR3_CK_N,
	HPS_DDR3_CK_P,
	HPS_DDR3_CS_N,
	HPS_DDR3_DM,
	HPS_DDR3_DQ,
	HPS_DDR3_DQS_N,
	HPS_DDR3_DQS_P,
	HPS_DDR3_ODT,
	HPS_DDR3_RAS_N,
	HPS_DDR3_RESET_N,
	HPS_DDR3_RZQ,
	HPS_DDR3_WE_N,

	// Ethernet
	HPS_ENET_GTX_CLK,
	HPS_ENET_INT_N,
	HPS_ENET_MDC,
	HPS_ENET_MDIO,
	HPS_ENET_RX_CLK,
	HPS_ENET_RX_DATA,
	HPS_ENET_RX_DV,
	HPS_ENET_TX_DATA,
	HPS_ENET_TX_EN,

	// Flash
	HPS_FLASH_DATA,
	HPS_FLASH_DCLK,
	HPS_FLASH_NCSO,

	// Accelerometer
	HPS_GSENSOR_INT,
		
	// General Purpose I/O
	HPS_GPIO,
		
	// I2C
	HPS_I2C_CONTROL,
	HPS_I2C1_SCLK,
	HPS_I2C1_SDAT,
	HPS_I2C2_SCLK,
	HPS_I2C2_SDAT,

	// Pushbutton
	HPS_KEY,

	// LED
	HPS_LED,
		
	// SD Card
	HPS_SD_CLK,
	HPS_SD_CMD,
	HPS_SD_DATA,

	// SPI
	HPS_SPIM_CLK,
	HPS_SPIM_MISO,
	HPS_SPIM_MOSI,
	HPS_SPIM_SS,

	// UART
	HPS_UART_RX,
	HPS_UART_TX,

	// USB
	HPS_CONV_USB_N,
	HPS_USB_CLKOUT,
	HPS_USB_DATA,
	HPS_USB_DIR,
	HPS_USB_NXT,
	HPS_USB_STP
);

//=======================================================
//  PARAMETER declarations
//=======================================================


//=======================================================
//  PORT declarations
//=======================================================

////////////////////////////////////
// FPGA Pins
////////////////////////////////////

// Clock pins
input						CLOCK_50;
input						CLOCK2_50;
input						CLOCK3_50;
input						CLOCK4_50;

// ADC
inout						ADC_CS_N;
output					ADC_DIN;
input						ADC_DOUT;
output					ADC_SCLK;

// Audio
input						AUD_ADCDAT;
inout						AUD_ADCLRCK;
inout						AUD_BCLK;
output					AUD_DACDAT;
inout						AUD_DACLRCK;
output					AUD_XCK;

// SDRAM
output 		[12: 0]	DRAM_ADDR;
output		[ 1: 0]	DRAM_BA;
output					DRAM_CAS_N;
output					DRAM_CKE;
output					DRAM_CLK;
output					DRAM_CS_N;
inout			[15: 0]	DRAM_DQ;
output					DRAM_LDQM;
output					DRAM_RAS_N;
output					DRAM_UDQM;
output					DRAM_WE_N;

// I2C Bus for Configuration of the Audio and Video-In Chips
output					FPGA_I2C_SCLK;
inout						FPGA_I2C_SDAT;

// 40-pin headers
inout			[35: 0]	GPIO_0;
inout			[35: 0]	GPIO_1;

// Seven Segment Displays
output		[ 6: 0]	HEX0;
output		[ 6: 0]	HEX1;
output		[ 6: 0]	HEX2;
output		[ 6: 0]	HEX3;
output		[ 6: 0]	HEX4;
output		[ 6: 0]	HEX5;

// IR
input						IRDA_RXD;
output					IRDA_TXD;

// Pushbuttons
input			[ 3: 0]	KEY;

// LEDs
output		[ 9: 0]	LEDR;

// PS2 Ports
inout						PS2_CLK;
inout						PS2_DAT;

inout						PS2_CLK2;
inout						PS2_DAT2;

// Slider Switches
input			[ 9: 0]	SW;

// Video-In
input						TD_CLK27;
input			[ 7: 0]	TD_DATA;
input						TD_HS;
output					TD_RESET_N;
input						TD_VS;

// VGA
output		[ 7: 0]	VGA_B;
output					VGA_BLANK_N;
output					VGA_CLK;
output		[ 7: 0]	VGA_G;
output					VGA_HS;
output		[ 7: 0]	VGA_R;
output					VGA_SYNC_N;
output					VGA_VS;



////////////////////////////////////
// HPS Pins
////////////////////////////////////
	
// DDR3 SDRAM
output		[14: 0]	HPS_DDR3_ADDR;
output		[ 2: 0]  HPS_DDR3_BA;
output					HPS_DDR3_CAS_N;
output					HPS_DDR3_CKE;
output					HPS_DDR3_CK_N;
output					HPS_DDR3_CK_P;
output					HPS_DDR3_CS_N;
output		[ 3: 0]	HPS_DDR3_DM;
inout			[31: 0]	HPS_DDR3_DQ;
inout			[ 3: 0]	HPS_DDR3_DQS_N;
inout			[ 3: 0]	HPS_DDR3_DQS_P;
output					HPS_DDR3_ODT;
output					HPS_DDR3_RAS_N;
output					HPS_DDR3_RESET_N;
input						HPS_DDR3_RZQ;
output					HPS_DDR3_WE_N;

// Ethernet
output					HPS_ENET_GTX_CLK;
inout						HPS_ENET_INT_N;
output					HPS_ENET_MDC;
inout						HPS_ENET_MDIO;
input						HPS_ENET_RX_CLK;
input			[ 3: 0]	HPS_ENET_RX_DATA;
input						HPS_ENET_RX_DV;
output		[ 3: 0]	HPS_ENET_TX_DATA;
output					HPS_ENET_TX_EN;

// Flash
inout			[ 3: 0]	HPS_FLASH_DATA;
output					HPS_FLASH_DCLK;
output					HPS_FLASH_NCSO;

// Accelerometer
inout						HPS_GSENSOR_INT;

// General Purpose I/O
inout			[ 1: 0]	HPS_GPIO;

// I2C
inout						HPS_I2C_CONTROL;
inout						HPS_I2C1_SCLK;
inout						HPS_I2C1_SDAT;
inout						HPS_I2C2_SCLK;
inout						HPS_I2C2_SDAT;

// Pushbutton
inout						HPS_KEY;

// LED
inout						HPS_LED;

// SD Card
output					HPS_SD_CLK;
inout						HPS_SD_CMD;
inout			[ 3: 0]	HPS_SD_DATA;

// SPI
output					HPS_SPIM_CLK;
input						HPS_SPIM_MISO;
output					HPS_SPIM_MOSI;
inout						HPS_SPIM_SS;

// UART
input						HPS_UART_RX;
output					HPS_UART_TX;

// USB
inout						HPS_CONV_USB_N;
input						HPS_USB_CLKOUT;
inout			[ 7: 0]	HPS_USB_DATA;
input						HPS_USB_DIR;
input						HPS_USB_NXT;
output					HPS_USB_STP;

//=======================================================
//  REG/WIRE declarations
//=======================================================

reg			[15: 0]	hex3_hex0;
//wire			[15: 0]	hex5_hex4;

//assign HEX0 = ~hex3_hex0[ 6: 0]; // hex3_hex0[ 6: 0]; 
//assign HEX1 = ~hex3_hex0[14: 8];
//assign HEX2 = ~hex3_hex0[22:16];
//assign HEX3 = ~hex3_hex0[30:24];
assign HEX4 = 7'b1111111;
assign HEX5 = 7'b1111111;

HexDigit Digit0(HEX0, hex3_hex0[3:0]);
HexDigit Digit1(HEX1, hex3_hex0[7:4]);
HexDigit Digit2(HEX2, hex3_hex0[11:8]);
HexDigit Digit3(HEX3, hex3_hex0[15:12]);

wire [127:0] inst_sram_readdata ;
reg [127:0] inst_sram_writedata;
reg [8:0] inst_sram_address; 
reg inst_sram_write = 0;
wire inst_sram_clken = 1'b1;
wire inst_sram_chipselect = 1'b1;

wire [15:0] sram_readdata [19:0] /*synthesis keep*/;
wire [15:0] sram_writedata [19:0] /*synthesis keep*/;
wire [11:0] sram_address [19:0] /*synthesis keep*/; 
wire [19:0] sram_write /*synthesis keep*/; 
wire [19:0] sram_clken = 20'hFFFFF;
wire [19:0] sram_chipselect = 20'hFFFFF;

wire [8:0] inst_done_sram_readdata ;
reg [8:0] inst_done_sram_writedata ;
reg [8:0] inst_done_sram_address = 9'd0; 
reg inst_done_sram_write = 0;
wire inst_done_sram_clken = 1'b1;
wire inst_done_sram_chipselect = 1'b1;

wire reset;

assign reset = ~KEY[0];

//assign hex3_hex0[11:0] =sram_address[SW[4:0]];

always @(*) begin
	if(~KEY[1]) begin
		hex3_hex0[11:0] =sram_address[SW[4:0]];
	end
	else begin
		hex3_hex0[11:0] =sram_readdata[SW[4:0]];
	end
end



//=======================================================
// Processor
//=======================================================
    parameter SRAM_NUM = 5'd19;
    // all modules are instantiated here

    // add module
    wire [11:0] add_src1_address, add_src2_address, add_dest_address;
    reg [11:0] add_src1_start_address, add_src2_start_address, add_dest_start_address;
    wire [15:0] add_dest_readdata; 
    wire [15:0] add_src1_readdata;
    wire [15:0] add_src2_readdata ;
    wire [15:0] add_dest_writedata, add_src1_writedata, add_src2_writedata ;
    reg [5:0] add_src1_row_size;
    reg [5:0] add_src1_col_size;
    reg [5:0] add_src2_row_size;
    reg [5:0] add_src2_col_size;
    wire add_src1_write_en, add_src2_write_en, add_dest_write_en;
    wire add_start,add_done;

    matrix_addition matrix_add_instance (
        .clk(CLOCK_50),
        .reset(reset),
        .start(add_start),
        .done(add_done),
        .src1_start_address(add_src1_start_address),
        .src2_start_address(add_src2_start_address),
        .src1_address(add_src1_address),
        .src1_readdata(add_src1_readdata),
        .src1_writedata(add_src1_writedata),
        .src1_write_en(add_src1_write_en),
        .src2_address(add_src2_address),
        .src2_readdata(add_src2_readdata),
        .src2_writedata(add_src2_writedata),
        .src2_write_en(add_src2_write_en),
        .src1_row_size(add_src1_row_size),
        .src1_col_size(add_src1_col_size),
        .src2_row_size(add_src2_row_size),
        .src2_col_size(add_src2_col_size),
        .dest_start_address(add_dest_start_address),
        .dest_address(add_dest_address),
        .dest_readdata(add_dest_readdata),
        .dest_writedata(add_dest_writedata),
        .dest_write_en(add_dest_write_en)
    );

    // pooling module
    wire [11:0] pool_src1_address, pool_src2_address, pool_dest_address;
    reg [11:0] pool_src1_start_address, pool_src2_start_address, pool_dest_start_address;
    wire [15:0] pool_dest_readdata; 
    wire [15:0] pool_src1_readdata;
    wire [15:0] pool_src2_readdata ;
    wire [15:0] pool_dest_writedata, pool_src1_writedata, pool_src2_writedata ;
    reg [5:0] pool_src1_row_size;
    reg [5:0] pool_src1_col_size;
    reg [5:0] pool_src2_row_size;
    reg [5:0] pool_src2_col_size;
    wire pool_src1_write_en, pool_src2_write_en, pool_dest_write_en;
    wire pool_start,pool_done;

    matrix_maxpool matrix_pooling_instance (
        .clk(CLOCK_50),
        .reset(reset),
        .start(pool_start),
        .done(pool_done),
        .src1_start_address(pool_src1_start_address),
        .src1_address(pool_src1_address),
        .src1_readdata(pool_src1_readdata),
        .src1_write_en(pool_src1_write_en),
        .src1_row_size(pool_src1_row_size),
        .src1_col_size(pool_src1_col_size),
        .src2_row_size(pool_src2_row_size),
        .src2_col_size(pool_src2_col_size),
        .dest_start_address(pool_dest_start_address),
        .dest_address(pool_dest_address),
        .dest_writedata(pool_dest_writedata),
        .dest_write_en(pool_dest_write_en)
    );

    // relu module
    wire [11:0] relu_src1_address, relu_src2_address, relu_dest_address;
    reg [11:0] relu_src1_start_address, relu_src2_start_address, relu_dest_start_address;
    wire [15:0] relu_dest_readdata; 
    wire [15:0] relu_src1_readdata;
    wire [15:0] relu_src2_readdata ;
    wire [15:0] relu_dest_writedata, relu_src1_writedata, relu_src2_writedata ;
    reg [5:0] relu_src1_row_size;
    reg [5:0] relu_src1_col_size;
    reg [5:0] relu_src2_row_size;
    reg [5:0] relu_src2_col_size;
    wire relu_src1_write_en, relu_src2_write_en, relu_dest_write_en;
    wire relu_start,relu_done;
    matrix_relu matrix_relu_instance (
        .clk(CLOCK_50),
        .reset(reset),
        .start(relu_start),
        .done(relu_done),
        .src1_start_address(relu_src1_start_address),
        .src1_address(relu_src1_address),
        .src1_readdata(relu_src1_readdata),
        .src1_write_en(relu_src1_write_en),
        .src1_row_size(relu_src1_row_size),
        .src1_col_size(relu_src1_col_size),
        .src2_row_size(relu_src2_row_size),
        .src2_col_size(relu_src2_col_size),
        .dest_start_address(relu_dest_start_address),
        .dest_address(relu_dest_address),
        .dest_writedata(relu_dest_writedata),
        .dest_write_en(relu_dest_write_en)
    );

    // Single Fetch Signle Issue Superscalar Out of Order Processor starts here

    //---------------------------------------------------
    // Fetch
    //---------------------------------------------------
    reg [127:0] inst_D ;

    always @(posedge CLOCK_50) begin
        if(reset) begin
            inst_D <= 128'd0;
            inst_sram_address <= 9'b0;
        end
        else begin
            if(inst_sram_readdata[127:124] == 4'd0) begin
                inst_sram_address <= inst_sram_address;
                inst_D <= 128'd0;
            end
            else begin
                inst_sram_address <= inst_sram_address + 1;
                inst_D <= inst_sram_readdata;
            end
        end
    end


    //---------------------------------------------------
    // Decode
    //---------------------------------------------------
    reg [11:0] src1_address_D; //sram offset
    reg [11:0] src2_address_D;
    reg [11:0] dest_address_D;
    reg [4:0] src1_sram_num_D; // sram number(use for select)
    reg [4:0] src2_sram_num_D;
    reg [4:0] dest_sram_num_D;
    reg [9:0] src1_row_D;
    reg [9:0] src1_col_D;
    reg [4:0] src2_row_D;
    reg [4:0] src2_col_D;
    reg [3:0] sel_D;
    reg [4:0] sel_address_mux_D[19:0];
    reg [4:0] sel_writedata_mux_D[19:0];
    reg [4:0] sel_write_en_mux_D[19:0];
    reg [4:0] sel_readdata_mux_D[19:0];
    // reg [4:0] sel_add_src1_readdata_mux_D;
    // reg [4:0] sel_add_src2_readdata_mux_D;

    reg [11:0] src1_sram_num;
    reg [11:0] src2_sram_num;
    reg [11:0] dest_sram_num;

    // always @(posedge CLOCK_50) begin
    //     if(reset) begin
    //         inst_D <= 128'd0;
    //     end
    //     else begin
    //         inst_D <= inst_sram_writedata;
    //     end
    // end

    // assign inst_D = inst_sram_readdata;
//    integer i0;

    always @(*) begin
        src1_sram_num = SRAM_NUM - (inst_D[111:104]>>1);
        src2_sram_num = SRAM_NUM - (inst_D[79:72]>>1);
        dest_sram_num = SRAM_NUM - (inst_D[47:40]>>1);
    end

    always @(posedge CLOCK_50) begin
        if(reset) begin
            src1_address_D <= 12'd0;
            src2_address_D <= 12'd0;
            dest_address_D <= 12'd0;
            src1_sram_num_D <= 5'd0;
            src2_sram_num_D <= 5'd0;
            dest_sram_num_D <= 5'd0;
            src1_row_D <= 10'd0;
            src1_col_D <= 10'd0;
            src2_row_D <= 5'd0;
            src2_col_D <= 5'd0;
            sel_D <= 4'b0000;
            sel_address_mux_D[0] <= 5'd31;
            sel_address_mux_D[1] <= 5'd31;
            sel_address_mux_D[2] <= 5'd31;
				sel_address_mux_D[3] <= 5'd31;
            sel_address_mux_D[4] <= 5'd31;
            sel_address_mux_D[5] <= 5'd31;
				sel_address_mux_D[6] <= 5'd31;
            sel_address_mux_D[7] <= 5'd31;
            sel_address_mux_D[8] <= 5'd31;
				sel_address_mux_D[9] <= 5'd31;
            sel_address_mux_D[10] <= 5'd31;
            sel_address_mux_D[11] <= 5'd31;
				sel_address_mux_D[12] <= 5'd31;
            sel_address_mux_D[13] <= 5'd31;
            sel_address_mux_D[14] <= 5'd31;
				sel_address_mux_D[15] <= 5'd31;
            sel_address_mux_D[16] <= 5'd31;
            sel_address_mux_D[17] <= 5'd31;
				sel_address_mux_D[18] <= 5'd31;
            sel_address_mux_D[19] <= 5'd31;
            sel_writedata_mux_D[0] <= 5'd31;
            sel_writedata_mux_D[1] <= 5'd31;
            sel_writedata_mux_D[2] <= 5'd31;
				sel_writedata_mux_D[3] <= 5'd31;
            sel_writedata_mux_D[4] <= 5'd31;
            sel_writedata_mux_D[5] <= 5'd31;
				sel_writedata_mux_D[6] <= 5'd31;
            sel_writedata_mux_D[7] <= 5'd31;
            sel_writedata_mux_D[8] <= 5'd31;
				sel_writedata_mux_D[9] <= 5'd31;
            sel_writedata_mux_D[10] <= 5'd31;
            sel_writedata_mux_D[11] <= 5'd31;
				sel_writedata_mux_D[12] <= 5'd31;
            sel_writedata_mux_D[13] <= 5'd31;
            sel_writedata_mux_D[14] <= 5'd31;
				sel_writedata_mux_D[15] <= 5'd31;
            sel_writedata_mux_D[16] <= 5'd31;
            sel_writedata_mux_D[17] <= 5'd31;
				sel_writedata_mux_D[18] <= 5'd31;
            sel_writedata_mux_D[19] <= 5'd31;
            sel_write_en_mux_D[0] <= 5'd31;
            sel_write_en_mux_D[1] <= 5'd31;
            sel_write_en_mux_D[2] <= 5'd31;
				sel_write_en_mux_D[3] <= 5'd31;
            sel_write_en_mux_D[4] <= 5'd31;
            sel_write_en_mux_D[5] <= 5'd31;
				sel_write_en_mux_D[6] <= 5'd31;
            sel_write_en_mux_D[7] <= 5'd31;
            sel_write_en_mux_D[8] <= 5'd31;
				sel_write_en_mux_D[9] <= 5'd31;
            sel_write_en_mux_D[10] <= 5'd31;
            sel_write_en_mux_D[11] <= 5'd31;
				sel_write_en_mux_D[12] <= 5'd31;
            sel_write_en_mux_D[13] <= 5'd31;
            sel_write_en_mux_D[14] <= 5'd31;
				sel_write_en_mux_D[15] <= 5'd31;
            sel_write_en_mux_D[16] <= 5'd31;
            sel_write_en_mux_D[17] <= 5'd31;
				sel_write_en_mux_D[18] <= 5'd31;
            sel_write_en_mux_D[19] <= 5'd31;
				sel_readdata_mux_D[0] <= 5'd31;
            sel_readdata_mux_D[1] <= 5'd31;
				sel_readdata_mux_D[2] <= 5'd31;
            sel_readdata_mux_D[3] <= 5'd31;
				sel_readdata_mux_D[4] <= 5'd31;
            sel_readdata_mux_D[5] <= 5'd31;
				sel_readdata_mux_D[6] <= 5'd31;
            sel_readdata_mux_D[7] <= 5'd31;
				sel_readdata_mux_D[8] <= 5'd31;
            sel_readdata_mux_D[9] <= 5'd31;
				sel_readdata_mux_D[10] <= 5'd31;
            sel_readdata_mux_D[11] <= 5'd31;
				sel_readdata_mux_D[12] <= 5'd31;
            sel_readdata_mux_D[13] <= 5'd31;
				sel_readdata_mux_D[14] <= 5'd31;
            sel_readdata_mux_D[15] <= 5'd31;
				sel_readdata_mux_D[16] <= 5'd31;
            sel_readdata_mux_D[17] <= 5'd31;
				sel_readdata_mux_D[18] <= 5'd31;
            sel_readdata_mux_D[19] <= 5'd31;
        end
        else begin
            case(inst_D[127:124])
                4'b0001: begin // add
                    src1_address_D <= inst_D[103:92];
                    src2_address_D <= inst_D[71:60];
                    dest_address_D <= inst_D[37:28];
                    src1_sram_num_D <= src1_sram_num;
                    src2_sram_num_D <= src2_sram_num;
                    dest_sram_num_D <= dest_sram_num;
                    src1_row_D <= inst_D[27:19];
                    src1_col_D <= inst_D[18:10];
                    src2_row_D <= 5'd0;
                    src2_col_D <= 5'd0;
                    sel_D <= 4'b0001;
                    sel_address_mux_D[src1_sram_num] <= 5'd0;
                    sel_address_mux_D[src2_sram_num] <= 5'd1;
                    sel_address_mux_D[dest_sram_num] <= 5'd2;
                    sel_writedata_mux_D[src1_sram_num] <= 5'd0;
                    sel_writedata_mux_D[src2_sram_num] <= 5'd1;
                    sel_writedata_mux_D[dest_sram_num] <= 5'd2;
                    sel_write_en_mux_D[src1_sram_num] <= 5'd0;
                    sel_write_en_mux_D[src2_sram_num] <= 5'd1;
                    sel_write_en_mux_D[dest_sram_num] <= 5'd2;
                    sel_readdata_mux_D[0] <= src1_sram_num;
                    sel_readdata_mux_D[1] <= src2_sram_num;
                end
                4'b0111: begin // conv
                    // src1_address_D <= inst_D[123:92];
                    // src2_address_D <= inst_D[91:60];
                    // dest_address_D <= inst_D[59:28];
                    src1_address_D <= inst_D[103:92];
                    src2_address_D <= inst_D[71:60];
                    dest_address_D <= inst_D[37:28];
                    src1_sram_num_D <= src1_sram_num;
                    src2_sram_num_D <= src2_sram_num;
                    dest_sram_num_D <= dest_sram_num;
                    src1_row_D <= inst_D[27:19];
                    src1_col_D <= inst_D[18:10];
                    src2_row_D <= inst_D[9:5];
                    src2_col_D <= inst_D[4:0];
                    sel_address_mux_D[src1_sram_num] <= 5'd0;
                    sel_address_mux_D[2] <= src1_sram_num;
                    sel_address_mux_D[3] <= src2_sram_num;
                end
                4'b1000: begin // pool
                    // src1_address_D <= inst_D[123:92];
                    // src2_address_D <= inst_D[91:60];
                    // dest_address_D <= inst_D[59:28];
                    src1_address_D <= inst_D[103:92];
                    src2_address_D <= inst_D[71:60];
                    dest_address_D <= inst_D[37:28];
                    src1_sram_num_D <= src1_sram_num;
                    src2_sram_num_D <= src2_sram_num;
                    dest_sram_num_D <= dest_sram_num;
                    src1_row_D <= inst_D[27:19];
                    src1_col_D <= inst_D[18:10];
                    src2_row_D <= inst_D[9:5];
                    src2_col_D <= inst_D[4:0];
                    sel_D <= 4'b1000;
                    sel_address_mux_D[src1_sram_num] <= 5'd6;
                    // sel_address_mux_D[src2_sram_num] <= 5'd7;
                    sel_address_mux_D[dest_sram_num] <= 5'd7;
                    sel_writedata_mux_D[src1_sram_num] <= 5'd6;
                    // sel_writedata_mux_D[src2_sram_num] <= 5'd7;
                    sel_writedata_mux_D[dest_sram_num] <= 5'd7;
                    sel_write_en_mux_D[src1_sram_num] <= 5'd6;
                    // sel_write_en_mux_D[src2_sram_num] <= 5'd7;
                    sel_write_en_mux_D[dest_sram_num] <= 5'd7;
                    sel_readdata_mux_D[4] <= src1_sram_num;
                    // sel_readdata_mux_D[5] <= src2_sram_num;
                end
                4'b1010: begin // Relu
                    // src1_address_D <= inst_D[123:92];
                    // src2_address_D <= inst_D[91:60];
                    // dest_address_D <= inst_D[59:28];
                    src1_address_D <= inst_D[103:92];
                    src2_address_D <= inst_D[71:60];
                    dest_address_D <= inst_D[37:28];
                    src1_sram_num_D <= src1_sram_num;
                    src2_sram_num_D <= src2_sram_num;
                    dest_sram_num_D <= dest_sram_num;
                    src1_row_D <= inst_D[27:19];
                    src1_col_D <= inst_D[18:10];
                    src2_row_D <= inst_D[9:5];
                    src2_col_D <= inst_D[4:0];
                    sel_D <= 4'b1010;
                    sel_address_mux_D[src1_sram_num] <= 5'd8;
                    // sel_address_mux_D[src2_sram_num] <= 5'd7;
                    sel_address_mux_D[dest_sram_num] <= 5'd9;
                    sel_writedata_mux_D[src1_sram_num] <= 5'd8;
                    // sel_writedata_mux_D[src2_sram_num] <= 5'd7;
                    sel_writedata_mux_D[dest_sram_num] <= 5'd9;
                    sel_write_en_mux_D[src1_sram_num] <= 5'd8;
                    // sel_write_en_mux_D[src2_sram_num] <= 5'd7;
                    sel_write_en_mux_D[dest_sram_num] <= 5'd9;
                    sel_readdata_mux_D[5] <= src1_sram_num;
                end
                default: begin 
                    src1_address_D <= 12'd0;
                    src2_address_D <= 12'd0;
                    dest_address_D <= 12'd0;
                    src1_sram_num_D <= 5'd0;
                    src2_sram_num_D <= 5'd0;
                    dest_sram_num_D <= 5'd0;
                    src1_row_D <= 10'd0;
                    src1_col_D <= 10'd0;
                    src2_row_D <= 5'd0;
                    src2_col_D <= 5'd0;
                    sel_D <= 4'b0000;
                    sel_address_mux_D[src1_sram_num_D] <= sel_address_mux_D[src1_sram_num_D];
                    sel_address_mux_D[src2_sram_num_D] <= sel_address_mux_D[src2_sram_num_D];
                    sel_address_mux_D[dest_sram_num_D] <= sel_address_mux_D[dest_sram_num_D];
                end
            endcase
        end
    end

    //---------------------------------------------------
    // Issue
    //---------------------------------------------------
    reg [11:0] src1_address_I;
    reg [11:0] src2_address_I;
    reg [11:0] dest_address_I;
    reg [4:0] src1_sram_num_I; // sram number(use for select)
    reg [4:0] src2_sram_num_I;
    reg [4:0] dest_sram_num_I;
    reg [9:0] src1_row_I;
    reg [9:0] src1_col_I;
    reg [4:0] src2_row_I;
    reg [4:0] src2_col_I;
    reg [3:0] sel_I;
    reg add_start_I;
    reg pool_start_I;
    reg relu_start_I;
    reg [4:0] sel_address_mux_I[19:0];
    reg [4:0] sel_writedata_mux_I[19:0];
    reg [4:0] sel_write_en_mux_I[19:0];
    reg [4:0] sel_readdata_mux_I[19:0];


    genvar j;
    generate
        for (j = 0; j < 20; j = j + 1) begin : pipeline_register_I
            always @(posedge CLOCK_50) begin
					if(reset)begin
						 sel_address_mux_I[j]<= 5'd0;
						 sel_writedata_mux_I[j]<= 5'd0;
						 sel_write_en_mux_I[j]<= 5'd0;
						 sel_readdata_mux_I[j]<= 5'd0;
					end
					else begin
						 sel_address_mux_I[j]<= sel_address_mux_D[j];
						 sel_writedata_mux_I[j]<= sel_writedata_mux_D[j];
						 sel_write_en_mux_I[j]<= sel_write_en_mux_D[j];
						 sel_readdata_mux_I[j]<= sel_readdata_mux_D[j];
					end
            end
        end
    endgenerate

    //pipeline register
    always @(posedge CLOCK_50) begin
        if(reset) begin
            sel_I <= 4'd0;
            src1_address_I <= 12'd0;
            src2_address_I <= 12'd0;
            dest_address_I <= 12'd0;
            src1_sram_num_I <= 5'd0;
            src2_sram_num_I <= 5'd0;
            dest_sram_num_I <= 5'd0;
            src1_row_I <= 5'd0;
            src1_col_I <= 5'd0;
            src2_row_I <= 5'd0;
            src2_col_I <= 5'd0;
        end
        else begin
            sel_I <= sel_D;
            src1_address_I <= src1_address_D;
            src2_address_I <= src2_address_D;
            dest_address_I <= dest_address_D;
            src1_sram_num_I <= src1_sram_num_D;
            src2_sram_num_I <= src2_sram_num_D;
            dest_sram_num_I <= dest_sram_num_D;
            src1_row_I <= src1_row_D;
            src1_col_I <= src1_col_D;
            src2_row_I <= src2_row_D;
            src2_col_I <= src2_col_D;
        end
    end

    always @(posedge CLOCK_50) begin
	 if (reset) begin
		   add_start_I <= 0;
			add_src1_start_address <= 0;
			add_src2_start_address <= 0;
			add_dest_start_address <= 0;
			add_src1_row_size <= 0;
         add_src1_col_size <= 0;
         add_src2_row_size <= 0;
         add_src2_col_size <= 0;

         pool_start_I <= 0;
         pool_src1_start_address <= 0;
         pool_dest_start_address <= 0;
         pool_src1_row_size <= 0;
         pool_src1_col_size <= 0;
         pool_src2_row_size <= 0;
         pool_src2_col_size <= 0;

         relu_start_I <= 0;
         relu_src1_start_address <= 0;
         relu_dest_start_address <= 0;
         relu_src1_row_size <= 0;
         relu_src1_col_size <= 0;
         relu_src2_row_size <= 0;
         relu_src2_col_size <= 0;
	 end
	 else begin
        case(sel_D)
            4'b0001:begin // issue add
                add_start_I <= 1;
                pool_start_I <= 0;
                relu_start_I <= 0;
                add_src1_start_address <= src1_address_D;
                add_src2_start_address <= src2_address_D;
                add_dest_start_address <= dest_address_D;

                // sram_address[src1_sram_num_D] <= add_src1_address;
                // add_src1_readdata <= sram_readdata[src1_sram_num_D];
                // sram_writedata[src1_sram_num_D] <= add_src1_writedata;
                // sram_write[src1_sram_num_D] <= add_src1_write_en;

                // add_src2_address <= sram_address[src2_sram_num_D];
                // add_src2_readdata <= sram_readdata[src2_sram_num_D];
                // add_src2_writedata <= sram_writedata[src2_sram_num_D];
                // add_src2_write_en <= sram_write[src2_sram_num_D];

                add_src1_row_size <= src1_row_D;
                add_src1_col_size <= src1_col_D;
                add_src2_row_size <= src2_row_D;
                add_src2_col_size <= src2_col_D;

                // add_dest_address <= sram_address[dest_sram_num_D];
                // add_dest_readdata <= sram_readdata[dest_sram_num_D];
                // add_dest_writedata <= sram_writedata[dest_sram_num_D];
                // add_dest_write_en <= sram_write[dest_sram_num_D];
            
            end 
            4'b1000: begin
                add_start_I <= 0;
                pool_start_I <= 1;
                relu_start_I <= 0;
                pool_src1_start_address <= src1_address_D;
                // pool_src2_start_address <= src2_address_D;
                pool_dest_start_address <= dest_address_D;

                pool_src1_row_size <= src1_row_D;
                pool_src1_col_size <= src1_col_D;
                pool_src2_row_size <= src2_row_D;
                pool_src2_col_size <= src2_col_D;
            end

            4'b1010: begin
                add_start_I <= 0;
                pool_start_I <= 0;
                relu_start_I <= 1;
                relu_src1_start_address <= src1_address_D;
                relu_dest_start_address <= dest_address_D;

                relu_src1_row_size <= src1_row_D;
                relu_src1_col_size <= src1_col_D;
                relu_src2_row_size <= src2_row_D;
                relu_src2_col_size <= src2_col_D;
            end

            default: begin
                add_start_I <= 0;
                pool_start_I <= 0;
                relu_start_I <= 0;
            end
        endcase
	 end
    end

    //---------------------------------------------------
    // execute
    //---------------------------------------------------
    reg add_start_E;
    reg pool_start_E;
    reg relu_start_E;
    reg [4:0] sel_address_mux_E[19:0];
    reg [4:0] sel_writedata_mux_E[19:0];
    reg [4:0] sel_write_en_mux_E[19:0];
    reg [4:0] sel_readdata_mux_E[19:0];

    assign add_start = add_start_E;
    assign pool_start = pool_start_E;
    assign relu_start = relu_start_E;
    
    always @(posedge CLOCK_50) begin
        if(reset)begin
            add_start_E <=0;
            pool_start_E <=0;
            relu_start_E <=0;
        end
        else begin
            add_start_E<=add_start_I;
            pool_start_E<=pool_start_I;
            relu_start_E<=relu_start_I;
        end
    end

    genvar m;
    generate
        for (m = 0; m < 20; m = m + 1) begin : pipeline_register_E
            always @(posedge CLOCK_50) begin
					if(reset) begin
						 sel_address_mux_E[m]<= 0;
						 sel_writedata_mux_E[m]<= 0;
						 sel_write_en_mux_E[m]<= 0;
						 sel_readdata_mux_E[m]<= 0;
					end
					else begin
						 sel_address_mux_E[m]<= sel_address_mux_I[m];
						 sel_writedata_mux_E[m]<= sel_writedata_mux_I[m];
						 sel_write_en_mux_E[m]<= sel_write_en_mux_I[m];
						 sel_readdata_mux_E[m]<= sel_readdata_mux_I[m];
					end
            end
        end
    endgenerate

    genvar i;
    generate
        for (i = 0; i < 20; i = i + 1) begin : mux_gen
            mux24to1 #(.DATA_WIDTH(12)) address_mux (
                .in0(add_src1_address),
                .in1(add_src2_address),
                .in2(add_dest_address),
                .in3(),
                .in4(),
                .in5(),
                .in6(pool_src1_address),
                .in7(pool_dest_address),
                .in8(relu_src1_address),
                .in9(relu_dest_address),
                .in10(),
                .in11(),
                .in12(),
                .in13(),
                .in14(),
                .in15(),
                .in16(),
                .in17(),
                .in18(),
                .in19(),
                .in20(),
                .in21(),
                .in22(),
                .in23(),
                .sel(sel_address_mux_I[i]),
                .out(sram_address[i]),
				.reset(reset)
            );

            mux24to1 #(.DATA_WIDTH(16)) writedata_mux(
                .in0(add_src1_writedata),
                .in1(add_src2_writedata),
                .in2(add_dest_writedata),
                .in3(),
                .in4(),
                .in5(),
                .in6(pool_src1_writedata),
                .in7(pool_dest_writedata),
                .in8(relu_src1_writedata),
                .in9(relu_dest_writedata),
                .in10(),
                .in11(),
                .in12(),
                .in13(),
                .in14(),
                .in15(),
                .in16(),
                .in17(),
                .in18(),
                .in19(),
                .in20(),
                .in21(),
                .in22(),
                .in23(),
                .sel(sel_writedata_mux_I[i]),
                .out(sram_writedata[i]),
				.reset(reset)
            );

            mux24to1 #(.DATA_WIDTH(1)) write_en_mux(
                .in0(add_src1_write_en),
                .in1(add_src2_write_en),
                .in2(add_dest_write_en),
                .in3(),
                .in4(),
                .in5(),
                .in6(pool_src1_write_en),
                .in7(pool_dest_write_en),
                .in8(relu_src1_write_en),
                .in9(relu_dest_write_en),
                .in10(),
                .in11(),
                .in12(),
                .in13(),
                .in14(),
                .in15(),
                .in16(),
                .in17(),
                .in18(),
                .in19(),
                .in20(),
                .in21(),
                .in22(),
                .in23(),
                .sel(sel_write_en_mux_I[i]),
                .out(sram_write[i]),
				.reset(reset)
            );

        end
    endgenerate

    mux24to1 #(.DATA_WIDTH(16)) add_src1_mux(
        .in0(sram_readdata[0]),
        .in1(sram_readdata[1]),
        .in2(sram_readdata[2]),
        .in3(sram_readdata[3]),
        .in4(sram_readdata[4]),
        .in5(sram_readdata[5]),
        .in6(sram_readdata[6]),
        .in7(sram_readdata[7]),
        .in8(sram_readdata[8]),
        .in9(sram_readdata[9]),
        .in10(sram_readdata[10]),
        .in11(sram_readdata[11]),
        .in12(sram_readdata[12]),
        .in13(sram_readdata[13]),
        .in14(sram_readdata[14]),
        .in15(sram_readdata[15]),
        .in16(sram_readdata[16]),
        .in17(sram_readdata[17]),
        .in18(sram_readdata[18]),
        .in19(sram_readdata[19]),
        .in20(),
        .in21(),
        .in22(),
        .in23(),
        .sel(sel_readdata_mux_I[0]),
        .out(add_src1_readdata),
		  .reset(reset)
    );

    mux24to1 #(.DATA_WIDTH(16)) add_src2_mux(
        .in0(sram_readdata[0]),
        .in1(sram_readdata[1]),
        .in2(sram_readdata[2]),
        .in3(sram_readdata[3]),
        .in4(sram_readdata[4]),
        .in5(sram_readdata[5]),
        .in6(sram_readdata[6]),
        .in7(sram_readdata[7]),
        .in8(sram_readdata[8]),
        .in9(sram_readdata[9]),
        .in10(sram_readdata[10]),
        .in11(sram_readdata[11]),
        .in12(sram_readdata[12]),
        .in13(sram_readdata[13]),
        .in14(sram_readdata[14]),
        .in15(sram_readdata[15]),
        .in16(sram_readdata[16]),
        .in17(sram_readdata[17]),
        .in18(sram_readdata[18]),
        .in19(sram_readdata[19]),
        .in20(),
        .in21(),
        .in22(),
        .in23(),
        .sel(sel_readdata_mux_I[1]),
        .out(add_src2_readdata),
		  .reset(reset)
    );

    mux24to1 #(.DATA_WIDTH(16)) pool_src1_mux(
        .in0(sram_readdata[0]),
        .in1(sram_readdata[1]),
        .in2(sram_readdata[2]),
        .in3(sram_readdata[3]),
        .in4(sram_readdata[4]),
        .in5(sram_readdata[5]),
        .in6(sram_readdata[6]),
        .in7(sram_readdata[7]),
        .in8(sram_readdata[8]),
        .in9(sram_readdata[9]),
        .in10(sram_readdata[10]),
        .in11(sram_readdata[11]),
        .in12(sram_readdata[12]),
        .in13(sram_readdata[13]),
        .in14(sram_readdata[14]),
        .in15(sram_readdata[15]),
        .in16(sram_readdata[16]),
        .in17(sram_readdata[17]),
        .in18(sram_readdata[18]),
        .in19(sram_readdata[19]),
        .in20(),
        .in21(),
        .in22(),
        .in23(),
        .sel(sel_readdata_mux_I[4]),
        .out(pool_src1_readdata),
		  .reset(reset)
    );

    mux24to1 #(.DATA_WIDTH(16)) relu_src1_mux(
        .in0(sram_readdata[0]),
        .in1(sram_readdata[1]),
        .in2(sram_readdata[2]),
        .in3(sram_readdata[3]),
        .in4(sram_readdata[4]),
        .in5(sram_readdata[5]),
        .in6(sram_readdata[6]),
        .in7(sram_readdata[7]),
        .in8(sram_readdata[8]),
        .in9(sram_readdata[9]),
        .in10(sram_readdata[10]),
        .in11(sram_readdata[11]),
        .in12(sram_readdata[12]),
        .in13(sram_readdata[13]),
        .in14(sram_readdata[14]),
        .in15(sram_readdata[15]),
        .in16(sram_readdata[16]),
        .in17(sram_readdata[17]),
        .in18(sram_readdata[18]),
        .in19(sram_readdata[19]),
        .in20(),
        .in21(),
        .in22(),
        .in23(),
        .sel(sel_readdata_mux_I[5]),
        .out(relu_src1_readdata),
		.reset(reset)
    );

	 //---------------------------------------------------
    // Commit
    //---------------------------------------------------
	 
	reg add_done_prev;
    reg pool_done_prev;
    reg relu_done_prev;

    always @ (posedge CLOCK_50) begin
        if(reset) begin
            add_done_prev <= 0;
            pool_done_prev <= 0;
            relu_done_prev <= 0;
        end
        else begin
            add_done_prev <= add_done;
            pool_done_prev <= pool_done;
            relu_done_prev <= relu_done;
        end
    end

    always @(posedge CLOCK_50) begin
        if(reset) begin
            inst_done_sram_address <= 9'd0;
            inst_done_sram_writedata <= 8'b00000000;
            inst_done_sram_write <=0;
        end
        else begin
            if(~add_done_prev && add_done) begin
                inst_done_sram_address <= 9'd0;
                inst_done_sram_writedata <= 8'b11111111;
                inst_done_sram_write <=1;
            end
            else if(~pool_done_prev && pool_done)begin
                inst_done_sram_address <= 9'd2;
                inst_done_sram_writedata <= 8'b11111111;
                inst_done_sram_write <=1;
            end
            else if(~relu_done_prev && relu_done)begin
                inst_done_sram_address <= 9'd3;
                inst_done_sram_writedata <= 8'b11111111;
                inst_done_sram_write <=1;
            end
            else begin
                inst_done_sram_write <=0;
            end
            
        end
    end
//	 always @ (posedge CLOCK_50) begin
//		 if(reset)begin
//			sram_address[3] <= 0;
//			sram_write[3] <= 0;
//			sram_writedata[3] <= 0;
//			sram_address[2] <= 0;
//			sram_write[2] <= 0;
//		 end
//		 else begin
//				if(sram_address[3] < 12'd100 ) begin
//					sram_address[3] <= sram_address[3]+1;
//					sram_write[3] <= 1;
//					sram_writedata[3] <= sram_readdata[2];
//					sram_address[2] <= sram_address[2]+1;
//				end 
//				else begin
//					sram_address[3]<=sram_address[3];
//					sram_write[3] <= 0;
//					sram_writedata[3] <= sram_readdata[2] ;
//					sram_address[2] <= sram_address[2];
//				end
//		 end
//	 end
	 

	

//=======================================================
//  Structural coding
//=======================================================
// From Qsys

Computer_System The_System (
	////////////////////////////////////
	// FPGA Side
	////////////////////////////////////

	// Global signals
	.system_pll_ref_clk_clk					(CLOCK_50),
	.system_pll_ref_reset_reset			(1'b0),
	.pll_0_refclk_clk                   (CLOCK_50),
	.pll_0_reset_reset                  (1'b0),
	
	// SRAM shared with HPS
	.inst_sram_s1_address             (inst_sram_address),//       address
	.inst_sram_s1_clken               (inst_sram_clken),//                     .clken
	.inst_sram_s1_chipselect          (inst_sram_chipselect),//                     .chipselect
	.inst_sram_s1_write               (inst_sram_write),//                     .write
	.inst_sram_s1_readdata            (inst_sram_readdata),//                     .readdata
	.inst_sram_s1_writedata           (inst_sram_writedata),//                     .writedata
	.inst_sram_s1_byteenable          (16'b1111_1111_1111_1111),//                     .byteenable
	
   .sram_0_s1_address     (sram_address[0]), // address
   .sram_0_s1_clken       (sram_clken[0]), // clken
   .sram_0_s1_chipselect  (sram_chipselect[0]), // chipselect
   .sram_0_s1_write       (sram_write[0]), // write
   .sram_0_s1_readdata    (sram_readdata[0]), // readdata
   .sram_0_s1_writedata   (sram_writedata[0]), // writedata
   .sram_0_s1_byteenable  (2'b11), // byteenable
   
   .sram_1_s1_address     (sram_address[1]), // address
   .sram_1_s1_clken       (sram_clken[1]), // clken
   .sram_1_s1_chipselect  (sram_chipselect[1]), // chipselect
   .sram_1_s1_write       (sram_write[1]), // write
   .sram_1_s1_readdata    (sram_readdata[1]), // readdata
   .sram_1_s1_writedata   (sram_writedata[1]), // writedata
   .sram_1_s1_byteenable  (2'b11), // byteenable
   
   .sram_2_s1_address     (sram_address[2]), // address
   .sram_2_s1_clken       (sram_clken[2]), // clken
   .sram_2_s1_chipselect  (sram_chipselect[2]), // chipselect
   .sram_2_s1_write       (sram_write[2]), // write
   .sram_2_s1_readdata    (sram_readdata[2]), // readdata
   .sram_2_s1_writedata   (sram_writedata[2]), // writedata
   .sram_2_s1_byteenable  (2'b11), // byteenable
   
   .sram_3_s1_address     (sram_address[3]), // address
   .sram_3_s1_clken       (sram_clken[3]), // clken
   .sram_3_s1_chipselect  (sram_chipselect[3]), // chipselect
   .sram_3_s1_write       (sram_write[3]), // write
   .sram_3_s1_readdata    (sram_readdata[3]), // readdata
   .sram_3_s1_writedata   (sram_writedata[3]), // writedata
   .sram_3_s1_byteenable  (2'b11), // byteenable
   
   .sram_4_s1_address     (sram_address[4]), // address
   .sram_4_s1_clken       (sram_clken[4]), // clken
   .sram_4_s1_chipselect  (sram_chipselect[4]), // chipselect
   .sram_4_s1_write       (sram_write[4]), // write
   .sram_4_s1_readdata    (sram_readdata[4]), // readdata
   .sram_4_s1_writedata   (sram_writedata[4]), // writedata
   .sram_4_s1_byteenable  (2'b11), // byteenable
   
   .sram_5_s1_address     (sram_address[5]), // address
   .sram_5_s1_clken       (sram_clken[5]), // clken
   .sram_5_s1_chipselect  (sram_chipselect[5]), // chipselect
   .sram_5_s1_write       (sram_write[5]), // write
   .sram_5_s1_readdata    (sram_readdata[5]), // readdata
   .sram_5_s1_writedata   (sram_writedata[5]), // writedata
   .sram_5_s1_byteenable  (2'b11), // byteenable
   
   .sram_6_s1_address     (sram_address[6]), // address
   .sram_6_s1_clken       (sram_clken[6]), // clken
   .sram_6_s1_chipselect  (sram_chipselect[6]), // chipselect
   .sram_6_s1_write       (sram_write[6]), // write
   .sram_6_s1_readdata    (sram_readdata[6]), // readdata
   .sram_6_s1_writedata   (sram_writedata[6]), // writedata
   .sram_6_s1_byteenable  (2'b11), // byteenable
   
   .sram_7_s1_address     (sram_address[7]), // address
   .sram_7_s1_clken       (sram_clken[7]), // clken
   .sram_7_s1_chipselect  (sram_chipselect[7]), // chipselect
   .sram_7_s1_write       (sram_write[7]), // write
   .sram_7_s1_readdata    (sram_readdata[7]), // readdata
   .sram_7_s1_writedata   (sram_writedata[7]), // writedata
   .sram_7_s1_byteenable  (2'b11), // byteenable
   
   .sram_8_s1_address     (sram_address[8]), // address
   .sram_8_s1_clken       (sram_clken[8]), // clken
   .sram_8_s1_chipselect  (sram_chipselect[8]), // chipselect
   .sram_8_s1_write       (sram_write[8]), // write
   .sram_8_s1_readdata    (sram_readdata[8]), // readdata
   .sram_8_s1_writedata   (sram_writedata[8]), // writedata
   .sram_8_s1_byteenable  (2'b11), // byteenable
   
   .sram_9_s1_address     (sram_address[9]), // address
   .sram_9_s1_clken       (sram_clken[9]), // clken
   .sram_9_s1_chipselect  (sram_chipselect[9]), // chipselect
   .sram_9_s1_write       (sram_write[9]), // write
   .sram_9_s1_readdata    (sram_readdata[9]), // readdata
   .sram_9_s1_writedata   (sram_writedata[9]), // writedata
   .sram_9_s1_byteenable  (2'b11), // byteenable
   
   .sram_10_s1_address    (sram_address[10]), // address
   .sram_10_s1_clken      (sram_clken[10]), // clken
   .sram_10_s1_chipselect (sram_chipselect[10]), // chipselect
   .sram_10_s1_write      (sram_write[10]), // write
   .sram_10_s1_readdata   (sram_readdata[10]), // readdata
   .sram_10_s1_writedata  (sram_writedata[10]), // writedata
   .sram_10_s1_byteenable (2'b11), // byteenable
   
   .sram_11_s1_address    (sram_address[11]), // address
   .sram_11_s1_clken      (sram_clken[11]), // clken
   .sram_11_s1_chipselect (sram_chipselect[11]), // chipselect
   .sram_11_s1_write      (sram_write[11]), // write
   .sram_11_s1_readdata   (sram_readdata[11]), // readdata
   .sram_11_s1_writedata  (sram_writedata[11]), // writedata
   .sram_11_s1_byteenable (2'b11), // byteenable
   
   .sram_12_s1_address    (sram_address[12]), // address
   .sram_12_s1_clken      (sram_clken[12]), // clken
   .sram_12_s1_chipselect (sram_chipselect[12]), // chipselect
   .sram_12_s1_write      (sram_write[12]), // write
   .sram_12_s1_readdata   (sram_readdata[12]), // readdata
   .sram_12_s1_writedata  (sram_writedata[12]), // writedata
   .sram_12_s1_byteenable (2'b11), // byteenable
   
   .sram_13_s1_address    (sram_address[13]), // address
   .sram_13_s1_clken      (sram_clken[13]), // clken
   .sram_13_s1_chipselect (sram_chipselect[13]), // chipselect
   .sram_13_s1_write      (sram_write[13]), // write
   .sram_13_s1_readdata   (sram_readdata[13]), // readdata
   .sram_13_s1_writedata  (sram_writedata[13]), // writedata
   .sram_13_s1_byteenable (2'b11), // byteenable
   
   .sram_14_s1_address    (sram_address[14]), // address
   .sram_14_s1_clken      (sram_clken[14]), // clken
   .sram_14_s1_chipselect (sram_chipselect[14]), // chipselect
   .sram_14_s1_write      (sram_write[14]), // write
   .sram_14_s1_readdata   (sram_readdata[14]), // readdata
   .sram_14_s1_writedata  (sram_writedata[14]), // writedata
   .sram_14_s1_byteenable (2'b11), // byteenable
   
   .sram_15_s1_address    (sram_address[15]), // address
   .sram_15_s1_clken      (sram_clken[15]), // clken
   .sram_15_s1_chipselect (sram_chipselect[15]), // chipselect
   .sram_15_s1_write      (sram_write[15]), // write
   .sram_15_s1_readdata   (sram_readdata[15]), // readdata
   .sram_15_s1_writedata  (sram_writedata[15]), // writedata
   .sram_15_s1_byteenable (2'b11), // byteenable
   
   .sram_16_s1_address    (sram_address[16]), // address
   .sram_16_s1_clken      (sram_clken[16]), // clken
   .sram_16_s1_chipselect (sram_chipselect[16]), // chipselect
   .sram_16_s1_write      (sram_write[16]), // write
   .sram_16_s1_readdata   (sram_readdata[16]), // readdata
   .sram_16_s1_writedata  (sram_writedata[16]), // writedata
   .sram_16_s1_byteenable (2'b11), // byteenable
   
   .sram_17_s1_address    (sram_address[17]), // address
   .sram_17_s1_clken      (sram_clken[17]), // clken
   .sram_17_s1_chipselect (sram_chipselect[17]), // chipselect
   .sram_17_s1_write      (sram_write[17]), // write
   .sram_17_s1_readdata   (sram_readdata[17]), // readdata
   .sram_17_s1_writedata  (sram_writedata[17]), // writedata
   .sram_17_s1_byteenable (2'b11), // byteenable
   
   .sram_18_s1_address    (sram_address[18]), // address
   .sram_18_s1_clken      (sram_clken[18]), // clken
   .sram_18_s1_chipselect (sram_chipselect[18]), // chipselect
   .sram_18_s1_write      (sram_write[18]), // write
   .sram_18_s1_readdata   (sram_readdata[18]), // readdata
   .sram_18_s1_writedata  (sram_writedata[18]), // writedata
   .sram_18_s1_byteenable (2'b11), // byteenable
   
   .sram_19_s1_address    (sram_address[19]), // address
   .sram_19_s1_clken      (sram_clken[19]), // clken
   .sram_19_s1_chipselect (sram_chipselect[19]), // chipselect
   .sram_19_s1_write      (sram_write[19]), // write
   .sram_19_s1_readdata   (sram_readdata[19]), // readdata
   .sram_19_s1_writedata  (sram_writedata[19]), // writedata
   .sram_19_s1_byteenable (2'b11), // byteenable
	
	.done_sram_s1_address    (inst_done_sram_address), // address
   .done_sram_s1_clken      (inst_done_sram_clken), // clken
   .done_sram_s1_chipselect (inst_done_sram_chipselect), // chipselect
   .done_sram_s1_write      (inst_done_sram_write), // write
   .done_sram_s1_readdata   (inst_done_sram_readdata), // readdata
   .done_sram_s1_writedata  (inst_done_sram_writedata), // writedata
   
	////////////////////////////////////
	// HPS Side
	////////////////////////////////////
	// DDR3 SDRAM
	.memory_mem_a			(HPS_DDR3_ADDR),
	.memory_mem_ba			(HPS_DDR3_BA),
	.memory_mem_ck			(HPS_DDR3_CK_P),
	.memory_mem_ck_n		(HPS_DDR3_CK_N),
	.memory_mem_cke		(HPS_DDR3_CKE),
	.memory_mem_cs_n		(HPS_DDR3_CS_N),
	.memory_mem_ras_n		(HPS_DDR3_RAS_N),
	.memory_mem_cas_n		(HPS_DDR3_CAS_N),
	.memory_mem_we_n		(HPS_DDR3_WE_N),
	.memory_mem_reset_n	(HPS_DDR3_RESET_N),
	.memory_mem_dq			(HPS_DDR3_DQ),
	.memory_mem_dqs		(HPS_DDR3_DQS_P),
	.memory_mem_dqs_n		(HPS_DDR3_DQS_N),
	.memory_mem_odt		(HPS_DDR3_ODT),
	.memory_mem_dm			(HPS_DDR3_DM),
	.memory_oct_rzqin		(HPS_DDR3_RZQ),
		  
	// Ethernet
	.hps_io_hps_io_gpio_inst_GPIO35	(HPS_ENET_INT_N),
	.hps_io_hps_io_emac1_inst_TX_CLK	(HPS_ENET_GTX_CLK),
	.hps_io_hps_io_emac1_inst_TXD0	(HPS_ENET_TX_DATA[0]),
	.hps_io_hps_io_emac1_inst_TXD1	(HPS_ENET_TX_DATA[1]),
	.hps_io_hps_io_emac1_inst_TXD2	(HPS_ENET_TX_DATA[2]),
	.hps_io_hps_io_emac1_inst_TXD3	(HPS_ENET_TX_DATA[3]),
	.hps_io_hps_io_emac1_inst_RXD0	(HPS_ENET_RX_DATA[0]),
	.hps_io_hps_io_emac1_inst_MDIO	(HPS_ENET_MDIO),
	.hps_io_hps_io_emac1_inst_MDC		(HPS_ENET_MDC),
	.hps_io_hps_io_emac1_inst_RX_CTL	(HPS_ENET_RX_DV),
	.hps_io_hps_io_emac1_inst_TX_CTL	(HPS_ENET_TX_EN),
	.hps_io_hps_io_emac1_inst_RX_CLK	(HPS_ENET_RX_CLK),
	.hps_io_hps_io_emac1_inst_RXD1	(HPS_ENET_RX_DATA[1]),
	.hps_io_hps_io_emac1_inst_RXD2	(HPS_ENET_RX_DATA[2]),
	.hps_io_hps_io_emac1_inst_RXD3	(HPS_ENET_RX_DATA[3]),

	// Flash
	.hps_io_hps_io_qspi_inst_IO0	(HPS_FLASH_DATA[0]),
	.hps_io_hps_io_qspi_inst_IO1	(HPS_FLASH_DATA[1]),
	.hps_io_hps_io_qspi_inst_IO2	(HPS_FLASH_DATA[2]),
	.hps_io_hps_io_qspi_inst_IO3	(HPS_FLASH_DATA[3]),
	.hps_io_hps_io_qspi_inst_SS0	(HPS_FLASH_NCSO),
	.hps_io_hps_io_qspi_inst_CLK	(HPS_FLASH_DCLK),

	// Accelerometer
	.hps_io_hps_io_gpio_inst_GPIO61	(HPS_GSENSOR_INT),

	//.adc_sclk                        (ADC_SCLK),
	//.adc_cs_n                        (ADC_CS_N),
	//.adc_dout                        (ADC_DOUT),
	//.adc_din                         (ADC_DIN),

	// General Purpose I/O
	.hps_io_hps_io_gpio_inst_GPIO40	(HPS_GPIO[0]),
	.hps_io_hps_io_gpio_inst_GPIO41	(HPS_GPIO[1]),

	// I2C
	.hps_io_hps_io_gpio_inst_GPIO48	(HPS_I2C_CONTROL),
	.hps_io_hps_io_i2c0_inst_SDA		(HPS_I2C1_SDAT),
	.hps_io_hps_io_i2c0_inst_SCL		(HPS_I2C1_SCLK),
	.hps_io_hps_io_i2c1_inst_SDA		(HPS_I2C2_SDAT),
	.hps_io_hps_io_i2c1_inst_SCL		(HPS_I2C2_SCLK),

	// Pushbutton
	.hps_io_hps_io_gpio_inst_GPIO54	(HPS_KEY),

	// LED
	.hps_io_hps_io_gpio_inst_GPIO53	(HPS_LED),

	// SD Card
	.hps_io_hps_io_sdio_inst_CMD	(HPS_SD_CMD),
	.hps_io_hps_io_sdio_inst_D0	(HPS_SD_DATA[0]),
	.hps_io_hps_io_sdio_inst_D1	(HPS_SD_DATA[1]),
	.hps_io_hps_io_sdio_inst_CLK	(HPS_SD_CLK),
	.hps_io_hps_io_sdio_inst_D2	(HPS_SD_DATA[2]),
	.hps_io_hps_io_sdio_inst_D3	(HPS_SD_DATA[3]),

	// SPI
	.hps_io_hps_io_spim1_inst_CLK		(HPS_SPIM_CLK),
	.hps_io_hps_io_spim1_inst_MOSI	(HPS_SPIM_MOSI),
	.hps_io_hps_io_spim1_inst_MISO	(HPS_SPIM_MISO),
	.hps_io_hps_io_spim1_inst_SS0		(HPS_SPIM_SS),

	// UART
	.hps_io_hps_io_uart0_inst_RX	(HPS_UART_RX),
	.hps_io_hps_io_uart0_inst_TX	(HPS_UART_TX),

	// USB
	.hps_io_hps_io_gpio_inst_GPIO09	(HPS_CONV_USB_N),
	.hps_io_hps_io_usb1_inst_D0		(HPS_USB_DATA[0]),
	.hps_io_hps_io_usb1_inst_D1		(HPS_USB_DATA[1]),
	.hps_io_hps_io_usb1_inst_D2		(HPS_USB_DATA[2]),
	.hps_io_hps_io_usb1_inst_D3		(HPS_USB_DATA[3]),
	.hps_io_hps_io_usb1_inst_D4		(HPS_USB_DATA[4]),
	.hps_io_hps_io_usb1_inst_D5		(HPS_USB_DATA[5]),
	.hps_io_hps_io_usb1_inst_D6		(HPS_USB_DATA[6]),
	.hps_io_hps_io_usb1_inst_D7		(HPS_USB_DATA[7]),
	.hps_io_hps_io_usb1_inst_CLK		(HPS_USB_CLKOUT),
	.hps_io_hps_io_usb1_inst_STP		(HPS_USB_STP),
	.hps_io_hps_io_usb1_inst_DIR		(HPS_USB_DIR),
	.hps_io_hps_io_usb1_inst_NXT		(HPS_USB_NXT)
);
endmodule // end top level



// module mux24to1
module mux24to1 #(
    parameter DATA_WIDTH = 12
)(
    input wire [DATA_WIDTH-1:0] in0,
    input wire [DATA_WIDTH-1:0] in1,
    input wire [DATA_WIDTH-1:0] in2,
    input wire [DATA_WIDTH-1:0] in3,
    input wire [DATA_WIDTH-1:0] in4,
    input wire [DATA_WIDTH-1:0] in5,
    input wire [DATA_WIDTH-1:0] in6,
    input wire [DATA_WIDTH-1:0] in7,
    input wire [DATA_WIDTH-1:0] in8,
    input wire [DATA_WIDTH-1:0] in9,
    input wire [DATA_WIDTH-1:0] in10,
    input wire [DATA_WIDTH-1:0] in11,
    input wire [DATA_WIDTH-1:0] in12,
    input wire [DATA_WIDTH-1:0] in13,
    input wire [DATA_WIDTH-1:0] in14,
    input wire [DATA_WIDTH-1:0] in15,
    input wire [DATA_WIDTH-1:0] in16,
    input wire [DATA_WIDTH-1:0] in17,
    input wire [DATA_WIDTH-1:0] in18,
    input wire [DATA_WIDTH-1:0] in19,
    input wire [DATA_WIDTH-1:0] in20,
    input wire [DATA_WIDTH-1:0] in21,
    input wire [DATA_WIDTH-1:0] in22,
    input wire [DATA_WIDTH-1:0] in23,
    input wire [4:0] sel,
    output reg [DATA_WIDTH-1:0] out,
	 input wire reset
);

always @(*) begin
if(reset) begin
	out = {DATA_WIDTH{1'b0}};
end
else begin
    case (sel)
        5'd0:  out = in0;
        5'd1:  out = in1;
        5'd2:  out = in2;
        5'd3:  out = in3;
        5'd4:  out = in4;
        5'd5:  out = in5;
        5'd6:  out = in6;
        5'd7:  out = in7;
        5'd8:  out = in8;
        5'd9:  out = in9;
        5'd10: out = in10;
        5'd11: out = in11;
        5'd12: out = in12;
        5'd13: out = in13;
        5'd14: out = in14;
        5'd15: out = in15;
        5'd16: out = in16;
        5'd17: out = in17;
        5'd18: out = in18;
        5'd19: out = in19;
        5'd20: out = in20;
        5'd21: out = in21;
        5'd22: out = in22;
        5'd23: out = in23;
        default: out = {DATA_WIDTH{1'b0}};
    endcase
end
end

endmodule




// module matrix_addition
module matrix_addition(
    input clk,
    input reset,
    input start,
    output reg done,
    input wire [11:0] src1_start_address,
    input wire [11:0] src2_start_address,
    output reg [11:0] src1_address,
    input wire [15:0] src1_readdata,
    output reg [15:0] src1_writedata,
    output wire src1_write_en,
    output reg [11:0] src2_address,
    input wire [15:0] src2_readdata,
    output reg [15:0] src2_writedata,
    output wire src2_write_en,
    input wire [5:0] src1_row_size,
    input wire [5:0] src1_col_size,
    input wire [5:0] src2_row_size,
    input wire [5:0] src2_col_size,
    input wire [11:0] dest_start_address,
    output reg [11:0] dest_address,
    input wire [15:0] dest_readdata,
    output reg [15:0] dest_writedata,
    output reg dest_write_en
);
    reg [5:0] row_count;
    reg [5:0] col_count;
    
    assign src1_write_en = 0;
    assign src2_write_en = 0;
    reg [1:0] state = 2'd2;

    always @(posedge clk) begin
    if(reset) begin
        state <= 2'd2;
        row_count<=0;
        col_count<=0;
        src1_address<=src1_start_address;
        src2_address<=src2_start_address;
        dest_address<=dest_start_address;
        done<=1;
    end
    else begin
        case (state)
            2'd0: begin
                src1_address<=src1_start_address;
                src2_address<=src2_start_address;
                dest_address<=dest_start_address-1;
                state<=2'd1;
            end 
            2'd1: begin
                if(row_count < src1_row_size-1) begin
                    src1_address <= src1_address + 1;
                    src2_address <= src2_address + 1;
                    row_count <= row_count+1;
                    dest_address <= dest_address + 1;
                    dest_writedata <= src1_readdata + src2_readdata;
                    dest_write_en <= 1;
                end
                else if (col_count < src1_col_size-1) begin
                    src1_address <= src1_address + 1;
                    src2_address <= src2_address + 1;
                    col_count <= col_count+1;
                    row_count <= 0;
                    dest_address <= dest_address + 1;
                    dest_writedata <= src1_readdata + src2_readdata;
                end
                else begin
                    dest_address<=dest_address + 1;
                    dest_writedata <= src1_readdata + src2_readdata;
                    state <= 2'd2;
                end
            end
            2'd2: begin
                if(start == 1) begin
                    state <= 2'd0;
                    done <= 0;
                end
                else begin
                    dest_write_en <= 0;
                    row_count<=0;
                    col_count<=0;
                    src1_address<=src1_start_address;
                    src2_address<=src2_start_address;
                    dest_address<=dest_start_address;
                    done<=1;
                end
            end
            default: begin
                row_count<=0;
                col_count<=0;
                src1_address<=src1_start_address;
                src2_address<=src2_start_address;
                dest_address<=dest_start_address;
                done<=1;
            end
        endcase
    end
    end
endmodule



// module matrix_maxpool
module matrix_maxpool(
    input clk,
    input reset,
    input start,
    output reg done,
    input wire [11:0] src1_start_address,
    output reg [11:0] src1_address,
    input wire signed [15:0] src1_readdata,
    output wire src1_write_en,
    input wire [5:0] src1_row_size,
    input wire [5:0] src1_col_size,
    input wire [5:0] src2_row_size,
    input wire [5:0] src2_col_size,
    input wire [11:0] dest_start_address,
    output reg [11:0] dest_address,
    output reg signed [15:0] dest_writedata,
    output reg dest_write_en
);
    reg [5:0] row_count;
    reg [5:0] col_count;
    reg [5:0] row_index;
    reg [5:0] col_index;
    reg signed [15:0] max_pool=0;
   
    assign src1_write_en = 0;
    reg [1:0] state = 2'd2;
    reg [5:0] val = 1;

    always @(posedge clk) begin
    if(reset) begin
        state <= 2'd2;
        row_count<=0;
        col_count<=0;
        row_index <=0;
        col_index <= 0;
        src1_address<=src1_start_address;
        dest_address<=dest_start_address;
        done<=1;
    end
    else begin
        case (state)
            2'd0: begin
                src1_address<=src1_start_address;
                dest_address<=dest_start_address-1;
                max_pool <= 0;
                state<=2'd1;
            end
            2'd1: begin
                if(row_count < src2_row_size-1) begin
                    src1_address <= src1_address + 1;
                    row_count <= row_count+1;
                    if (src1_readdata > max_pool)
                      max_pool <= src1_readdata;
                    dest_write_en <= 0;
                end
                else if (col_count < src2_col_size-1) begin
                    src1_address <= src1_address + 1;
                    col_count <= col_count+1;
                    row_count <= 0;
                    if (src1_readdata > max_pool)
                      max_pool <= src1_readdata;
                    dest_write_en <= 0;
                end
                else begin
                    dest_write_en <= 0;
                    if (src1_readdata > max_pool)
                      max_pool <= src1_readdata;              
                    state <= 2'd3;
                end
            end
            2'd3: begin
                      src1_address <= src1_address + 1;
                      dest_writedata <= max_pool;
                      dest_write_en <= 1;
                      dest_address <= dest_address + 1;
                      val <= val + 1;
                      row_count <= 0;
                      col_count <= 0;
                      max_pool <=0;
                   
 
                    if(val == ((src1_col_size/src2_col_size)*(src1_col_size/src2_col_size)))
                        state <= 2'd2; // Processing complete
                    else
                        state <= 2'd1; // Continue processing next block
                   
                end            
           
           
            2'd2: begin
                if(start == 1) begin
                    state <= 2'd0;
                    dest_write_en <= 0;
                    done <= 0;
                end
                else begin
                    dest_write_en <= 0;
                    row_count<=0;
                    col_count<=0;
                    row_index <= 0;
                    col_index <=0;
                    src1_address<=src1_start_address;
                    dest_address<=dest_start_address;
                    done<=1;
                end
            end
            default: begin
                row_count<=0;
                col_count<=0;
                row_index <= 0;
                col_index <=0;                
                src1_address<=src1_start_address;
                dest_address<=dest_start_address;
                done<=1;
            end
        endcase
    end
    end
endmodule

// Relu module
module matrix_relu(
    input clk,
    input reset,
    input start,
    output reg done,
    input wire [11:0] src1_start_address,
    input wire [11:0] src2_start_address,
    output reg [11:0] src1_address,
    input wire signed [15:0] src1_readdata,
    output wire src1_write_en,
   // output reg [14:0] src2_address,
   // input reg [15:0] src2_data,
   // output wire src2_write_en,
    input wire [5:0] src1_row_size,
    input wire [5:0] src1_col_size,
    input wire [5:0] src2_row_size,
    input wire [5:0] src2_col_size,
    input wire [11:0] dest_start_address,
    output reg [11:0] dest_address,
    output reg signed [15:0] dest_writedata,
    output reg dest_write_en
);
    reg [5:0] row_count;
    reg [5:0] col_count;
   
    assign src1_write_en = 0;
   // assign src2_write_en = 0;
    reg [1:0] state = 2'd2;

    always @(posedge clk) begin
    if(reset) begin
        state <= 2'd2;
        row_count<=0;
        col_count<=0;
        src1_address<=src1_start_address;
      //  src2_address<=src2_start_address;
        dest_address<=dest_start_address;
        done<=1;
    end
    else begin
        case (state)
            2'd0: begin
                src1_address<=src1_start_address;
            //    src2_address<=src2_start_address;
                dest_address<=dest_start_address-1;
                state<=2'd1;
            end
            2'd1: begin
                if(row_count < src1_row_size-1) begin
                    src1_address <= src1_address + 1;
                //    src2_address <= src2_address + 1;
                    row_count <= row_count+1;
                    dest_address <= dest_address + 1;
                //  dest_data <= src1_data + src2_data;
                    dest_writedata <= ( $signed(src1_readdata) < 0 ) ? 0 : src1_readdata;
                    dest_write_en <= 1;
                end
                else if (col_count < src1_col_size-1) begin
                    src1_address <= src1_address + 1;
                //    src2_address <= src2_address + 1;
                    col_count <= col_count+1;
                    row_count <= 0;
                    dest_address <= dest_address + 1;
                //  dest_data <= src1_data + src2_data;
                    dest_writedata <= ( $signed(src1_readdata) < 0 ) ? 0 : src1_readdata;
                end
                else begin
                    dest_address<=dest_address + 1;
                //  dest_data <= src1_data + src2_data;
                    dest_writedata <= ( $signed(src1_readdata) < 0 ) ? 0 : src1_readdata;
                    state <= 2'd2;
                end
            end
            2'd2: begin
                if(start == 1) begin
                    state <= 2'd0;
                    done <= 0;
                end
                else begin
                    dest_write_en <= 0;
                    row_count<=0;
                    col_count<=0;
                    src1_address<=src1_start_address;
                //  src2_address<=src2_start_address;
                    dest_address<=dest_start_address;
                    done<=1;
                end
            end
            default: begin
                row_count<=0;
                col_count<=0;
                src1_address<=src1_start_address;
            //    src2_address<=src2_start_address;
                dest_address<=dest_start_address;
                done<=1;
            end
        endcase
    end
    end
endmodule



/// end /////////////////////////////////////////////////////////////////////