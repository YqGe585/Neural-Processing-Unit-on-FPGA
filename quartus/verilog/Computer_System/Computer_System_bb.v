
module Computer_System (
	done_sram_s1_address,
	done_sram_s1_clken,
	done_sram_s1_chipselect,
	done_sram_s1_write,
	done_sram_s1_readdata,
	done_sram_s1_writedata,
	hps_io_hps_io_emac1_inst_TX_CLK,
	hps_io_hps_io_emac1_inst_TXD0,
	hps_io_hps_io_emac1_inst_TXD1,
	hps_io_hps_io_emac1_inst_TXD2,
	hps_io_hps_io_emac1_inst_TXD3,
	hps_io_hps_io_emac1_inst_RXD0,
	hps_io_hps_io_emac1_inst_MDIO,
	hps_io_hps_io_emac1_inst_MDC,
	hps_io_hps_io_emac1_inst_RX_CTL,
	hps_io_hps_io_emac1_inst_TX_CTL,
	hps_io_hps_io_emac1_inst_RX_CLK,
	hps_io_hps_io_emac1_inst_RXD1,
	hps_io_hps_io_emac1_inst_RXD2,
	hps_io_hps_io_emac1_inst_RXD3,
	hps_io_hps_io_qspi_inst_IO0,
	hps_io_hps_io_qspi_inst_IO1,
	hps_io_hps_io_qspi_inst_IO2,
	hps_io_hps_io_qspi_inst_IO3,
	hps_io_hps_io_qspi_inst_SS0,
	hps_io_hps_io_qspi_inst_CLK,
	hps_io_hps_io_sdio_inst_CMD,
	hps_io_hps_io_sdio_inst_D0,
	hps_io_hps_io_sdio_inst_D1,
	hps_io_hps_io_sdio_inst_CLK,
	hps_io_hps_io_sdio_inst_D2,
	hps_io_hps_io_sdio_inst_D3,
	hps_io_hps_io_usb1_inst_D0,
	hps_io_hps_io_usb1_inst_D1,
	hps_io_hps_io_usb1_inst_D2,
	hps_io_hps_io_usb1_inst_D3,
	hps_io_hps_io_usb1_inst_D4,
	hps_io_hps_io_usb1_inst_D5,
	hps_io_hps_io_usb1_inst_D6,
	hps_io_hps_io_usb1_inst_D7,
	hps_io_hps_io_usb1_inst_CLK,
	hps_io_hps_io_usb1_inst_STP,
	hps_io_hps_io_usb1_inst_DIR,
	hps_io_hps_io_usb1_inst_NXT,
	hps_io_hps_io_spim1_inst_CLK,
	hps_io_hps_io_spim1_inst_MOSI,
	hps_io_hps_io_spim1_inst_MISO,
	hps_io_hps_io_spim1_inst_SS0,
	hps_io_hps_io_uart0_inst_RX,
	hps_io_hps_io_uart0_inst_TX,
	hps_io_hps_io_i2c0_inst_SDA,
	hps_io_hps_io_i2c0_inst_SCL,
	hps_io_hps_io_i2c1_inst_SDA,
	hps_io_hps_io_i2c1_inst_SCL,
	hps_io_hps_io_gpio_inst_GPIO09,
	hps_io_hps_io_gpio_inst_GPIO35,
	hps_io_hps_io_gpio_inst_GPIO40,
	hps_io_hps_io_gpio_inst_GPIO41,
	hps_io_hps_io_gpio_inst_GPIO48,
	hps_io_hps_io_gpio_inst_GPIO53,
	hps_io_hps_io_gpio_inst_GPIO54,
	hps_io_hps_io_gpio_inst_GPIO61,
	inst_sram_s1_address,
	inst_sram_s1_clken,
	inst_sram_s1_chipselect,
	inst_sram_s1_write,
	inst_sram_s1_readdata,
	inst_sram_s1_writedata,
	inst_sram_s1_byteenable,
	memory_mem_a,
	memory_mem_ba,
	memory_mem_ck,
	memory_mem_ck_n,
	memory_mem_cke,
	memory_mem_cs_n,
	memory_mem_ras_n,
	memory_mem_cas_n,
	memory_mem_we_n,
	memory_mem_reset_n,
	memory_mem_dq,
	memory_mem_dqs,
	memory_mem_dqs_n,
	memory_mem_odt,
	memory_mem_dm,
	memory_oct_rzqin,
	pll_0_refclk_clk,
	pll_0_reset_reset,
	sdram_clk_clk,
	sram_0_s1_address,
	sram_0_s1_clken,
	sram_0_s1_chipselect,
	sram_0_s1_write,
	sram_0_s1_readdata,
	sram_0_s1_writedata,
	sram_0_s1_byteenable,
	sram_1_s1_address,
	sram_1_s1_clken,
	sram_1_s1_chipselect,
	sram_1_s1_write,
	sram_1_s1_readdata,
	sram_1_s1_writedata,
	sram_1_s1_byteenable,
	sram_2_s1_address,
	sram_2_s1_clken,
	sram_2_s1_chipselect,
	sram_2_s1_write,
	sram_2_s1_readdata,
	sram_2_s1_writedata,
	sram_2_s1_byteenable,
	sram_3_s1_address,
	sram_3_s1_clken,
	sram_3_s1_chipselect,
	sram_3_s1_write,
	sram_3_s1_readdata,
	sram_3_s1_writedata,
	sram_3_s1_byteenable,
	sram_4_s1_address,
	sram_4_s1_clken,
	sram_4_s1_chipselect,
	sram_4_s1_write,
	sram_4_s1_readdata,
	sram_4_s1_writedata,
	sram_4_s1_byteenable,
	sram_5_s1_address,
	sram_5_s1_clken,
	sram_5_s1_chipselect,
	sram_5_s1_write,
	sram_5_s1_readdata,
	sram_5_s1_writedata,
	sram_5_s1_byteenable,
	sram_6_s1_address,
	sram_6_s1_clken,
	sram_6_s1_chipselect,
	sram_6_s1_write,
	sram_6_s1_readdata,
	sram_6_s1_writedata,
	sram_6_s1_byteenable,
	sram_7_s1_address,
	sram_7_s1_clken,
	sram_7_s1_chipselect,
	sram_7_s1_write,
	sram_7_s1_readdata,
	sram_7_s1_writedata,
	sram_7_s1_byteenable,
	sram_8_s1_address,
	sram_8_s1_clken,
	sram_8_s1_chipselect,
	sram_8_s1_write,
	sram_8_s1_readdata,
	sram_8_s1_writedata,
	sram_8_s1_byteenable,
	system_pll_ref_clk_clk,
	system_pll_ref_reset_reset);	

	input	[8:0]	done_sram_s1_address;
	input		done_sram_s1_clken;
	input		done_sram_s1_chipselect;
	input		done_sram_s1_write;
	output	[7:0]	done_sram_s1_readdata;
	input	[7:0]	done_sram_s1_writedata;
	output		hps_io_hps_io_emac1_inst_TX_CLK;
	output		hps_io_hps_io_emac1_inst_TXD0;
	output		hps_io_hps_io_emac1_inst_TXD1;
	output		hps_io_hps_io_emac1_inst_TXD2;
	output		hps_io_hps_io_emac1_inst_TXD3;
	input		hps_io_hps_io_emac1_inst_RXD0;
	inout		hps_io_hps_io_emac1_inst_MDIO;
	output		hps_io_hps_io_emac1_inst_MDC;
	input		hps_io_hps_io_emac1_inst_RX_CTL;
	output		hps_io_hps_io_emac1_inst_TX_CTL;
	input		hps_io_hps_io_emac1_inst_RX_CLK;
	input		hps_io_hps_io_emac1_inst_RXD1;
	input		hps_io_hps_io_emac1_inst_RXD2;
	input		hps_io_hps_io_emac1_inst_RXD3;
	inout		hps_io_hps_io_qspi_inst_IO0;
	inout		hps_io_hps_io_qspi_inst_IO1;
	inout		hps_io_hps_io_qspi_inst_IO2;
	inout		hps_io_hps_io_qspi_inst_IO3;
	output		hps_io_hps_io_qspi_inst_SS0;
	output		hps_io_hps_io_qspi_inst_CLK;
	inout		hps_io_hps_io_sdio_inst_CMD;
	inout		hps_io_hps_io_sdio_inst_D0;
	inout		hps_io_hps_io_sdio_inst_D1;
	output		hps_io_hps_io_sdio_inst_CLK;
	inout		hps_io_hps_io_sdio_inst_D2;
	inout		hps_io_hps_io_sdio_inst_D3;
	inout		hps_io_hps_io_usb1_inst_D0;
	inout		hps_io_hps_io_usb1_inst_D1;
	inout		hps_io_hps_io_usb1_inst_D2;
	inout		hps_io_hps_io_usb1_inst_D3;
	inout		hps_io_hps_io_usb1_inst_D4;
	inout		hps_io_hps_io_usb1_inst_D5;
	inout		hps_io_hps_io_usb1_inst_D6;
	inout		hps_io_hps_io_usb1_inst_D7;
	input		hps_io_hps_io_usb1_inst_CLK;
	output		hps_io_hps_io_usb1_inst_STP;
	input		hps_io_hps_io_usb1_inst_DIR;
	input		hps_io_hps_io_usb1_inst_NXT;
	output		hps_io_hps_io_spim1_inst_CLK;
	output		hps_io_hps_io_spim1_inst_MOSI;
	input		hps_io_hps_io_spim1_inst_MISO;
	output		hps_io_hps_io_spim1_inst_SS0;
	input		hps_io_hps_io_uart0_inst_RX;
	output		hps_io_hps_io_uart0_inst_TX;
	inout		hps_io_hps_io_i2c0_inst_SDA;
	inout		hps_io_hps_io_i2c0_inst_SCL;
	inout		hps_io_hps_io_i2c1_inst_SDA;
	inout		hps_io_hps_io_i2c1_inst_SCL;
	inout		hps_io_hps_io_gpio_inst_GPIO09;
	inout		hps_io_hps_io_gpio_inst_GPIO35;
	inout		hps_io_hps_io_gpio_inst_GPIO40;
	inout		hps_io_hps_io_gpio_inst_GPIO41;
	inout		hps_io_hps_io_gpio_inst_GPIO48;
	inout		hps_io_hps_io_gpio_inst_GPIO53;
	inout		hps_io_hps_io_gpio_inst_GPIO54;
	inout		hps_io_hps_io_gpio_inst_GPIO61;
	input	[8:0]	inst_sram_s1_address;
	input		inst_sram_s1_clken;
	input		inst_sram_s1_chipselect;
	input		inst_sram_s1_write;
	output	[127:0]	inst_sram_s1_readdata;
	input	[127:0]	inst_sram_s1_writedata;
	input	[15:0]	inst_sram_s1_byteenable;
	output	[14:0]	memory_mem_a;
	output	[2:0]	memory_mem_ba;
	output		memory_mem_ck;
	output		memory_mem_ck_n;
	output		memory_mem_cke;
	output		memory_mem_cs_n;
	output		memory_mem_ras_n;
	output		memory_mem_cas_n;
	output		memory_mem_we_n;
	output		memory_mem_reset_n;
	inout	[31:0]	memory_mem_dq;
	inout	[3:0]	memory_mem_dqs;
	inout	[3:0]	memory_mem_dqs_n;
	output		memory_mem_odt;
	output	[3:0]	memory_mem_dm;
	input		memory_oct_rzqin;
	input		pll_0_refclk_clk;
	input		pll_0_reset_reset;
	output		sdram_clk_clk;
	input	[13:0]	sram_0_s1_address;
	input		sram_0_s1_clken;
	input		sram_0_s1_chipselect;
	input		sram_0_s1_write;
	output	[15:0]	sram_0_s1_readdata;
	input	[15:0]	sram_0_s1_writedata;
	input	[1:0]	sram_0_s1_byteenable;
	input	[13:0]	sram_1_s1_address;
	input		sram_1_s1_clken;
	input		sram_1_s1_chipselect;
	input		sram_1_s1_write;
	output	[15:0]	sram_1_s1_readdata;
	input	[15:0]	sram_1_s1_writedata;
	input	[1:0]	sram_1_s1_byteenable;
	input	[13:0]	sram_2_s1_address;
	input		sram_2_s1_clken;
	input		sram_2_s1_chipselect;
	input		sram_2_s1_write;
	output	[15:0]	sram_2_s1_readdata;
	input	[15:0]	sram_2_s1_writedata;
	input	[1:0]	sram_2_s1_byteenable;
	input	[13:0]	sram_3_s1_address;
	input		sram_3_s1_clken;
	input		sram_3_s1_chipselect;
	input		sram_3_s1_write;
	output	[15:0]	sram_3_s1_readdata;
	input	[15:0]	sram_3_s1_writedata;
	input	[1:0]	sram_3_s1_byteenable;
	input	[13:0]	sram_4_s1_address;
	input		sram_4_s1_clken;
	input		sram_4_s1_chipselect;
	input		sram_4_s1_write;
	output	[15:0]	sram_4_s1_readdata;
	input	[15:0]	sram_4_s1_writedata;
	input	[1:0]	sram_4_s1_byteenable;
	input	[13:0]	sram_5_s1_address;
	input		sram_5_s1_clken;
	input		sram_5_s1_chipselect;
	input		sram_5_s1_write;
	output	[15:0]	sram_5_s1_readdata;
	input	[15:0]	sram_5_s1_writedata;
	input	[1:0]	sram_5_s1_byteenable;
	input	[13:0]	sram_6_s1_address;
	input		sram_6_s1_clken;
	input		sram_6_s1_chipselect;
	input		sram_6_s1_write;
	output	[15:0]	sram_6_s1_readdata;
	input	[15:0]	sram_6_s1_writedata;
	input	[1:0]	sram_6_s1_byteenable;
	input	[13:0]	sram_7_s1_address;
	input		sram_7_s1_clken;
	input		sram_7_s1_chipselect;
	input		sram_7_s1_write;
	output	[15:0]	sram_7_s1_readdata;
	input	[15:0]	sram_7_s1_writedata;
	input	[1:0]	sram_7_s1_byteenable;
	input	[13:0]	sram_8_s1_address;
	input		sram_8_s1_clken;
	input		sram_8_s1_chipselect;
	input		sram_8_s1_write;
	output	[15:0]	sram_8_s1_readdata;
	input	[15:0]	sram_8_s1_writedata;
	input	[1:0]	sram_8_s1_byteenable;
	input		system_pll_ref_clk_clk;
	input		system_pll_ref_reset_reset;
endmodule
