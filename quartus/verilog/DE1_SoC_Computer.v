

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

wire			[15: 0]	hex3_hex0;
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
reg [6:0] inst_sram_address = 7'd0; 
reg inst_sram_write;
wire inst_sram_clken = 1'b1;
wire inst_sram_chipselect = 1'b1;

wire [15:0] sram_readdata [19:0];
reg [15:0] sram_writedata [19:0];
reg [11:0] sram_address [19:0]; 
reg sram_write [19:0]; 
wire [19:0] sram_clken = 20'hFFFFF;
wire [19:0] sram_chipselect = 20'hFFFFF;

reg [15:0] HEX_temp;
assign hex3_hex0 = HEX_temp;

always @(posedge CLOCK_50) begin
	
	if(sram_address[0][9:0] == SW[9:0]) begin
		HEX_temp[3:0] <= sram_readdata[0][3:0];
		HEX_temp[7:4] <= sram_readdata[0][7:4];
		HEX_temp[11:8] <= sram_readdata[0][11:8];
		HEX_temp[15:12] <= sram_readdata[0][15:12];
	end
	if(sram_address[0] < 14'd100) begin
		sram_address[0] <= sram_address[0] + 1;
	end
	else begin
		sram_address[0] <= 14'd0;
	end
end

always @(posedge CLOCK_50) begin
	inst_sram_address <= SW[6:0];
	inst_sram_write <= ~KEY[0];
	inst_sram_writedata <= {64{KEY[2:1]}};
end



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


/// end /////////////////////////////////////////////////////////////////////