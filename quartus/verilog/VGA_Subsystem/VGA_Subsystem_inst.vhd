	component VGA_Subsystem is
		port (
			char_buffer_control_slave_address    : in  std_logic                     := 'X';             -- address
			char_buffer_control_slave_byteenable : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- byteenable
			char_buffer_control_slave_chipselect : in  std_logic                     := 'X';             -- chipselect
			char_buffer_control_slave_read       : in  std_logic                     := 'X';             -- read
			char_buffer_control_slave_write      : in  std_logic                     := 'X';             -- write
			char_buffer_control_slave_writedata  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			char_buffer_control_slave_readdata   : out std_logic_vector(31 downto 0);                    -- readdata
			char_buffer_slave_byteenable         : in  std_logic                     := 'X';             -- byteenable
			char_buffer_slave_chipselect         : in  std_logic                     := 'X';             -- chipselect
			char_buffer_slave_read               : in  std_logic                     := 'X';             -- read
			char_buffer_slave_write              : in  std_logic                     := 'X';             -- write
			char_buffer_slave_writedata          : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- writedata
			char_buffer_slave_readdata           : out std_logic_vector(7 downto 0);                     -- readdata
			char_buffer_slave_waitrequest        : out std_logic;                                        -- waitrequest
			char_buffer_slave_address            : in  std_logic_vector(12 downto 0) := (others => 'X'); -- address
			pixel_dma_control_slave_address      : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- address
			pixel_dma_control_slave_byteenable   : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- byteenable
			pixel_dma_control_slave_read         : in  std_logic                     := 'X';             -- read
			pixel_dma_control_slave_write        : in  std_logic                     := 'X';             -- write
			pixel_dma_control_slave_writedata    : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			pixel_dma_control_slave_readdata     : out std_logic_vector(31 downto 0);                    -- readdata
			pixel_dma_master_readdatavalid       : in  std_logic                     := 'X';             -- readdatavalid
			pixel_dma_master_waitrequest         : in  std_logic                     := 'X';             -- waitrequest
			pixel_dma_master_address             : out std_logic_vector(31 downto 0);                    -- address
			pixel_dma_master_lock                : out std_logic;                                        -- lock
			pixel_dma_master_read                : out std_logic;                                        -- read
			pixel_dma_master_readdata            : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- readdata
			sys_clk_clk                          : in  std_logic                     := 'X';             -- clk
			sys_reset_reset_n                    : in  std_logic                     := 'X';             -- reset_n
			vga_CLK                              : out std_logic;                                        -- CLK
			vga_HS                               : out std_logic;                                        -- HS
			vga_VS                               : out std_logic;                                        -- VS
			vga_BLANK                            : out std_logic;                                        -- BLANK
			vga_SYNC                             : out std_logic;                                        -- SYNC
			vga_R                                : out std_logic_vector(7 downto 0);                     -- R
			vga_G                                : out std_logic_vector(7 downto 0);                     -- G
			vga_B                                : out std_logic_vector(7 downto 0);                     -- B
			vga_pll_ref_clk_clk                  : in  std_logic                     := 'X';             -- clk
			vga_pll_ref_reset_reset              : in  std_logic                     := 'X'              -- reset
		);
	end component VGA_Subsystem;

	u0 : component VGA_Subsystem
		port map (
			char_buffer_control_slave_address    => CONNECTED_TO_char_buffer_control_slave_address,    -- char_buffer_control_slave.address
			char_buffer_control_slave_byteenable => CONNECTED_TO_char_buffer_control_slave_byteenable, --                          .byteenable
			char_buffer_control_slave_chipselect => CONNECTED_TO_char_buffer_control_slave_chipselect, --                          .chipselect
			char_buffer_control_slave_read       => CONNECTED_TO_char_buffer_control_slave_read,       --                          .read
			char_buffer_control_slave_write      => CONNECTED_TO_char_buffer_control_slave_write,      --                          .write
			char_buffer_control_slave_writedata  => CONNECTED_TO_char_buffer_control_slave_writedata,  --                          .writedata
			char_buffer_control_slave_readdata   => CONNECTED_TO_char_buffer_control_slave_readdata,   --                          .readdata
			char_buffer_slave_byteenable         => CONNECTED_TO_char_buffer_slave_byteenable,         --         char_buffer_slave.byteenable
			char_buffer_slave_chipselect         => CONNECTED_TO_char_buffer_slave_chipselect,         --                          .chipselect
			char_buffer_slave_read               => CONNECTED_TO_char_buffer_slave_read,               --                          .read
			char_buffer_slave_write              => CONNECTED_TO_char_buffer_slave_write,              --                          .write
			char_buffer_slave_writedata          => CONNECTED_TO_char_buffer_slave_writedata,          --                          .writedata
			char_buffer_slave_readdata           => CONNECTED_TO_char_buffer_slave_readdata,           --                          .readdata
			char_buffer_slave_waitrequest        => CONNECTED_TO_char_buffer_slave_waitrequest,        --                          .waitrequest
			char_buffer_slave_address            => CONNECTED_TO_char_buffer_slave_address,            --                          .address
			pixel_dma_control_slave_address      => CONNECTED_TO_pixel_dma_control_slave_address,      --   pixel_dma_control_slave.address
			pixel_dma_control_slave_byteenable   => CONNECTED_TO_pixel_dma_control_slave_byteenable,   --                          .byteenable
			pixel_dma_control_slave_read         => CONNECTED_TO_pixel_dma_control_slave_read,         --                          .read
			pixel_dma_control_slave_write        => CONNECTED_TO_pixel_dma_control_slave_write,        --                          .write
			pixel_dma_control_slave_writedata    => CONNECTED_TO_pixel_dma_control_slave_writedata,    --                          .writedata
			pixel_dma_control_slave_readdata     => CONNECTED_TO_pixel_dma_control_slave_readdata,     --                          .readdata
			pixel_dma_master_readdatavalid       => CONNECTED_TO_pixel_dma_master_readdatavalid,       --          pixel_dma_master.readdatavalid
			pixel_dma_master_waitrequest         => CONNECTED_TO_pixel_dma_master_waitrequest,         --                          .waitrequest
			pixel_dma_master_address             => CONNECTED_TO_pixel_dma_master_address,             --                          .address
			pixel_dma_master_lock                => CONNECTED_TO_pixel_dma_master_lock,                --                          .lock
			pixel_dma_master_read                => CONNECTED_TO_pixel_dma_master_read,                --                          .read
			pixel_dma_master_readdata            => CONNECTED_TO_pixel_dma_master_readdata,            --                          .readdata
			sys_clk_clk                          => CONNECTED_TO_sys_clk_clk,                          --                   sys_clk.clk
			sys_reset_reset_n                    => CONNECTED_TO_sys_reset_reset_n,                    --                 sys_reset.reset_n
			vga_CLK                              => CONNECTED_TO_vga_CLK,                              --                       vga.CLK
			vga_HS                               => CONNECTED_TO_vga_HS,                               --                          .HS
			vga_VS                               => CONNECTED_TO_vga_VS,                               --                          .VS
			vga_BLANK                            => CONNECTED_TO_vga_BLANK,                            --                          .BLANK
			vga_SYNC                             => CONNECTED_TO_vga_SYNC,                             --                          .SYNC
			vga_R                                => CONNECTED_TO_vga_R,                                --                          .R
			vga_G                                => CONNECTED_TO_vga_G,                                --                          .G
			vga_B                                => CONNECTED_TO_vga_B,                                --                          .B
			vga_pll_ref_clk_clk                  => CONNECTED_TO_vga_pll_ref_clk_clk,                  --           vga_pll_ref_clk.clk
			vga_pll_ref_reset_reset              => CONNECTED_TO_vga_pll_ref_reset_reset               --         vga_pll_ref_reset.reset
		);

