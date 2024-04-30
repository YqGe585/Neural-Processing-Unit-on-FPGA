## Generated SDC file "DE1_SoC_Computer.out.sdc"

## Copyright (C) 1991-2015 Altera Corporation. All rights reserved.
## Your use of Altera Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Altera Program License 
## Subscription Agreement, the Altera Quartus II License Agreement,
## the Altera MegaCore Function License Agreement, or other 
## applicable license agreement, including, without limitation, 
## that your use is for the sole purpose of programming logic 
## devices manufactured by Altera and sold by Altera or its 
## authorized distributors.  Please refer to the applicable 
## agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus II"
## VERSION "Version 15.0.0 Build 145 04/22/2015 SJ Full Version"

## DATE    "Mon Mar 06 14:20:30 2017"

##
## DEVICE  "5CSEMA5F31C6"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk} -period 2.500 -waveform { 1.875 3.125 } [get_registers {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk}]
create_clock -name {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk} -period 2.500 -waveform { 0.000 1.250 } [get_registers {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk}]
create_clock -name {HPS_DDR3_DQS_P[0]_IN} -period 2.500 -waveform { 0.000 1.250 } [get_ports {HPS_DDR3_DQS_P[0]}] -add
create_clock -name {HPS_DDR3_DQS_P[1]_IN} -period 2.500 -waveform { 0.000 1.250 } [get_ports {HPS_DDR3_DQS_P[1]}] -add
create_clock -name {HPS_DDR3_DQS_P[2]_IN} -period 2.500 -waveform { 0.000 1.250 } [get_ports {HPS_DDR3_DQS_P[2]}] -add
create_clock -name {HPS_DDR3_DQS_P[3]_IN} -period 2.500 -waveform { 0.000 1.250 } [get_ports {HPS_DDR3_DQS_P[3]}] -add
create_clock -name {CLOCK_50} -period 20.000 -waveform { 0.000 10.000 } [get_ports {CLOCK_50}]
create_clock -name {CLOCK2_50} -period 20.000 -waveform { 0.000 10.000 } [get_ports {CLOCK2_50}]
create_clock -name {CLOCK3_50} -period 20.000 -waveform { 0.000 10.000 } [get_ports {CLOCK3_50}]
create_clock -name {CLOCK4_50} -period 20.000 -waveform { 0.000 10.000 } [get_ports {CLOCK4_50}]
create_clock -name {tv_27m} -period 37.037 -waveform { 0.000 18.518 } [get_ports {TD_CLK27}]
create_clock -name {clk_dram} -period 10.000 -waveform { 0.000 5.000 } [get_ports {DRAM_CLK}]
create_clock -name {clk_vga} -period 39.714 -waveform { 0.000 19.857 } [get_ports {VGA_CLK}]


#**************************************************************
# Create Generated Clock
#**************************************************************

create_generated_clock -name {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock} -source [get_registers {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk}] -master_clock {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk} [get_registers {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|p0|umemphy|uio_pads|dq_ddio[*].ubidir_dq_dqs|altdq_dqs2_inst|dqs_enable_ctrl~DQSENABLEOUT_DFF}] 
create_generated_clock -name {HPS_DDR3_CK_P} -source [get_registers {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk}] -master_clock {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk} [get_ports {HPS_DDR3_CK_P}] 
create_generated_clock -name {HPS_DDR3_CK_N} -source [get_registers {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk}] -master_clock {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk} -invert [get_ports {HPS_DDR3_CK_N}] 
create_generated_clock -name {HPS_DDR3_DQS_P[0]_OUT} -source [get_registers {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk}] -master_clock {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk} [get_ports {HPS_DDR3_DQS_P[0]}] -add
create_generated_clock -name {HPS_DDR3_DQS_P[1]_OUT} -source [get_registers {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk}] -master_clock {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk} [get_ports {HPS_DDR3_DQS_P[1]}] -add
create_generated_clock -name {HPS_DDR3_DQS_P[2]_OUT} -source [get_registers {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk}] -master_clock {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk} [get_ports {HPS_DDR3_DQS_P[2]}] -add
create_generated_clock -name {HPS_DDR3_DQS_P[3]_OUT} -source [get_registers {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk}] -master_clock {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk} [get_ports {HPS_DDR3_DQS_P[3]}] -add
create_generated_clock -name {HPS_DDR3_DQS_N[0]_OUT} -source [get_registers {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk}] -master_clock {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk} [get_ports {HPS_DDR3_DQS_N[0]}] 
create_generated_clock -name {HPS_DDR3_DQS_N[1]_OUT} -source [get_registers {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk}] -master_clock {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk} [get_ports {HPS_DDR3_DQS_N[1]}] 
create_generated_clock -name {HPS_DDR3_DQS_N[2]_OUT} -source [get_registers {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk}] -master_clock {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk} [get_ports {HPS_DDR3_DQS_N[2]}] 
create_generated_clock -name {HPS_DDR3_DQS_N[3]_OUT} -source [get_registers {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk}] -master_clock {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk} [get_ports {HPS_DDR3_DQS_N[3]}] 
create_generated_clock -name {The_System|system_pll|sys_pll|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]} -source [get_pins {The_System|system_pll|sys_pll|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|refclkin}] -duty_cycle 50.000 -multiply_by 20 -divide_by 2 -master_clock {CLOCK_50} [get_pins {The_System|system_pll|sys_pll|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]}] 
create_generated_clock -name {The_System|system_pll|sys_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk} -source [get_pins {The_System|system_pll|sys_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|vco0ph[0]}] -duty_cycle 50.000 -multiply_by 1 -divide_by 5 -master_clock {The_System|system_pll|sys_pll|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]} [get_pins {The_System|system_pll|sys_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] 
create_generated_clock -name {The_System|system_pll|sys_pll|altera_pll_i|general[1].gpll~PLL_OUTPUT_COUNTER|divclk} -source [get_pins {The_System|system_pll|sys_pll|altera_pll_i|general[1].gpll~PLL_OUTPUT_COUNTER|vco0ph[0]}] -duty_cycle 50.000 -multiply_by 1 -divide_by 5 -phase -108.000 -master_clock {The_System|system_pll|sys_pll|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]} [get_pins {The_System|system_pll|sys_pll|altera_pll_i|general[1].gpll~PLL_OUTPUT_COUNTER|divclk}] 
create_generated_clock -name {The_System|vga_subsystem|vga_pll|video_pll|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]} -source [get_pins {The_System|vga_subsystem|vga_pll|video_pll|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|refclkin}] -duty_cycle 50.000 -multiply_by 12 -divide_by 2 -master_clock {CLOCK2_50} [get_pins {The_System|vga_subsystem|vga_pll|video_pll|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]}] 
create_generated_clock -name {The_System|vga_subsystem|vga_pll|video_pll|altera_pll_i|general[1].gpll~PLL_OUTPUT_COUNTER|divclk} -source [get_pins {The_System|vga_subsystem|vga_pll|video_pll|altera_pll_i|general[1].gpll~PLL_OUTPUT_COUNTER|vco0ph[0]}] -duty_cycle 50.000 -multiply_by 1 -divide_by 12 -master_clock {The_System|vga_subsystem|vga_pll|video_pll|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]} [get_pins {The_System|vga_subsystem|vga_pll|video_pll|altera_pll_i|general[1].gpll~PLL_OUTPUT_COUNTER|divclk}] 


#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[3]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[3]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[3]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[3]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[2]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[2]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[2]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[2]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[2]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[2]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[2]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[2]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[1]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[1]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[1]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[1]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[1]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[1]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[1]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[1]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[1]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[1]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[1]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[1]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[0]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[0]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[0]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[0]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[0]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[0]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[0]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[0]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[0]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[0]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[0]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[0]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[0]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[0]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[0]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[0]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {HPS_DDR3_CK_N}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {HPS_DDR3_CK_N}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {HPS_DDR3_CK_P}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {HPS_DDR3_CK_P}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {HPS_DDR3_CK_N}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {HPS_DDR3_CK_N}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {HPS_DDR3_CK_P}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {HPS_DDR3_CK_P}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {HPS_DDR3_CK_N}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {HPS_DDR3_CK_N}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {HPS_DDR3_CK_P}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {HPS_DDR3_CK_P}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {HPS_DDR3_CK_N}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {HPS_DDR3_CK_N}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {HPS_DDR3_CK_P}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {HPS_DDR3_CK_P}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {HPS_DDR3_CK_N}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {HPS_DDR3_CK_N}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {HPS_DDR3_CK_P}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {HPS_DDR3_CK_P}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {HPS_DDR3_CK_N}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {HPS_DDR3_CK_N}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {HPS_DDR3_CK_P}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {HPS_DDR3_CK_P}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_N}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_N}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_N}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_N}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_N}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_N}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_N}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_N}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_N}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_N}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_N}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_N}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_N}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_N}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_N}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_N}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_N}] -rise_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_N}] -fall_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_N}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_N}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_N}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_N}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_N}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_N}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_N}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_N}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_N}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_N}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_N}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_N}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_N}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_N}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_N}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_N}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_N}] -rise_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_N}] -fall_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_P}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_P}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_P}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_P}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_P}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_P}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_P}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_P}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_P}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_P}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_P}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_P}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_P}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_P}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_P}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_P}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_P}] -rise_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_P}] -fall_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_P}] -rise_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_P}] -fall_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_P}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_P}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_P}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_P}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_P}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_P}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_P}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_P}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_P}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_P}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_P}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_P}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_P}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_P}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_P}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_P}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_P}] -rise_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_P}] -fall_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_P}] -rise_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_P}] -fall_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -rise_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -fall_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -rise_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -fall_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -rise_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -fall_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -rise_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -fall_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {HPS_DDR3_CK_N}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {HPS_DDR3_CK_N}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {HPS_DDR3_CK_P}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {HPS_DDR3_CK_P}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {HPS_DDR3_CK_N}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {HPS_DDR3_CK_N}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {HPS_DDR3_CK_P}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {HPS_DDR3_CK_P}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -rise_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -fall_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -rise_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -fall_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -rise_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -fall_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -rise_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -fall_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -rise_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -fall_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -rise_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -fall_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -rise_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -fall_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -rise_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -fall_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {The_System|vga_subsystem|vga_pll|video_pll|altera_pll_i|general[1].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {The_System|vga_subsystem|vga_pll|video_pll|altera_pll_i|general[1].gpll~PLL_OUTPUT_COUNTER|divclk}] -setup 0.080  
set_clock_uncertainty -rise_from [get_clocks {The_System|vga_subsystem|vga_pll|video_pll|altera_pll_i|general[1].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {The_System|vga_subsystem|vga_pll|video_pll|altera_pll_i|general[1].gpll~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {The_System|vga_subsystem|vga_pll|video_pll|altera_pll_i|general[1].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {The_System|vga_subsystem|vga_pll|video_pll|altera_pll_i|general[1].gpll~PLL_OUTPUT_COUNTER|divclk}] -setup 0.080  
set_clock_uncertainty -rise_from [get_clocks {The_System|vga_subsystem|vga_pll|video_pll|altera_pll_i|general[1].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {The_System|vga_subsystem|vga_pll|video_pll|altera_pll_i|general[1].gpll~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {The_System|vga_subsystem|vga_pll|video_pll|altera_pll_i|general[1].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {The_System|system_pll|sys_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]  0.220  
set_clock_uncertainty -rise_from [get_clocks {The_System|vga_subsystem|vga_pll|video_pll|altera_pll_i|general[1].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {The_System|system_pll|sys_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]  0.220  
set_clock_uncertainty -rise_from [get_clocks {The_System|vga_subsystem|vga_pll|video_pll|altera_pll_i|general[1].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {clk_vga}]  0.110  
set_clock_uncertainty -rise_from [get_clocks {The_System|vga_subsystem|vga_pll|video_pll|altera_pll_i|general[1].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {clk_vga}]  0.110  
set_clock_uncertainty -fall_from [get_clocks {The_System|vga_subsystem|vga_pll|video_pll|altera_pll_i|general[1].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {The_System|vga_subsystem|vga_pll|video_pll|altera_pll_i|general[1].gpll~PLL_OUTPUT_COUNTER|divclk}] -setup 0.080  
set_clock_uncertainty -fall_from [get_clocks {The_System|vga_subsystem|vga_pll|video_pll|altera_pll_i|general[1].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {The_System|vga_subsystem|vga_pll|video_pll|altera_pll_i|general[1].gpll~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {The_System|vga_subsystem|vga_pll|video_pll|altera_pll_i|general[1].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {The_System|vga_subsystem|vga_pll|video_pll|altera_pll_i|general[1].gpll~PLL_OUTPUT_COUNTER|divclk}] -setup 0.080  
set_clock_uncertainty -fall_from [get_clocks {The_System|vga_subsystem|vga_pll|video_pll|altera_pll_i|general[1].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {The_System|vga_subsystem|vga_pll|video_pll|altera_pll_i|general[1].gpll~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {The_System|vga_subsystem|vga_pll|video_pll|altera_pll_i|general[1].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {The_System|system_pll|sys_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]  0.220  
set_clock_uncertainty -fall_from [get_clocks {The_System|vga_subsystem|vga_pll|video_pll|altera_pll_i|general[1].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {The_System|system_pll|sys_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]  0.220  
set_clock_uncertainty -fall_from [get_clocks {The_System|vga_subsystem|vga_pll|video_pll|altera_pll_i|general[1].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {clk_vga}]  0.110  
set_clock_uncertainty -fall_from [get_clocks {The_System|vga_subsystem|vga_pll|video_pll|altera_pll_i|general[1].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {clk_vga}]  0.110  
set_clock_uncertainty -rise_from [get_clocks {The_System|system_pll|sys_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {The_System|vga_subsystem|vga_pll|video_pll|altera_pll_i|general[1].gpll~PLL_OUTPUT_COUNTER|divclk}]  0.220  
set_clock_uncertainty -rise_from [get_clocks {The_System|system_pll|sys_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {The_System|vga_subsystem|vga_pll|video_pll|altera_pll_i|general[1].gpll~PLL_OUTPUT_COUNTER|divclk}]  0.220  
set_clock_uncertainty -rise_from [get_clocks {The_System|system_pll|sys_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {The_System|system_pll|sys_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {The_System|system_pll|sys_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {The_System|system_pll|sys_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -hold 0.080  
set_clock_uncertainty -rise_from [get_clocks {The_System|system_pll|sys_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {The_System|system_pll|sys_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {The_System|system_pll|sys_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {The_System|system_pll|sys_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -hold 0.080  
set_clock_uncertainty -rise_from [get_clocks {The_System|system_pll|sys_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {clk_dram}]  0.110  
set_clock_uncertainty -rise_from [get_clocks {The_System|system_pll|sys_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {clk_dram}]  0.110  
set_clock_uncertainty -rise_from [get_clocks {The_System|system_pll|sys_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {CLOCK_50}]  0.200  
set_clock_uncertainty -rise_from [get_clocks {The_System|system_pll|sys_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {CLOCK_50}]  0.200  
set_clock_uncertainty -fall_from [get_clocks {The_System|system_pll|sys_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {The_System|vga_subsystem|vga_pll|video_pll|altera_pll_i|general[1].gpll~PLL_OUTPUT_COUNTER|divclk}]  0.220  
set_clock_uncertainty -fall_from [get_clocks {The_System|system_pll|sys_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {The_System|vga_subsystem|vga_pll|video_pll|altera_pll_i|general[1].gpll~PLL_OUTPUT_COUNTER|divclk}]  0.220  
set_clock_uncertainty -fall_from [get_clocks {The_System|system_pll|sys_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {The_System|system_pll|sys_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {The_System|system_pll|sys_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {The_System|system_pll|sys_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -hold 0.080  
set_clock_uncertainty -fall_from [get_clocks {The_System|system_pll|sys_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {The_System|system_pll|sys_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {The_System|system_pll|sys_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {The_System|system_pll|sys_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -hold 0.080  
set_clock_uncertainty -fall_from [get_clocks {The_System|system_pll|sys_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {clk_dram}]  0.110  
set_clock_uncertainty -fall_from [get_clocks {The_System|system_pll|sys_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {clk_dram}]  0.110  
set_clock_uncertainty -fall_from [get_clocks {The_System|system_pll|sys_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {CLOCK_50}]  0.200  
set_clock_uncertainty -fall_from [get_clocks {The_System|system_pll|sys_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {CLOCK_50}]  0.200  
set_clock_uncertainty -rise_from [get_clocks {clk_dram}] -rise_to [get_clocks {The_System|system_pll|sys_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]  0.110  
set_clock_uncertainty -rise_from [get_clocks {clk_dram}] -fall_to [get_clocks {The_System|system_pll|sys_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]  0.110  
set_clock_uncertainty -fall_from [get_clocks {clk_dram}] -rise_to [get_clocks {The_System|system_pll|sys_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]  0.110  
set_clock_uncertainty -fall_from [get_clocks {clk_dram}] -fall_to [get_clocks {The_System|system_pll|sys_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]  0.110  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50}] -rise_to [get_clocks {The_System|system_pll|sys_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]  0.200  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50}] -fall_to [get_clocks {The_System|system_pll|sys_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]  0.200  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50}] -rise_to [get_clocks {The_System|system_pll|sys_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]  0.200  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50}] -fall_to [get_clocks {The_System|system_pll|sys_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]  0.200  
set_clock_uncertainty -rise_from [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_IN}]  0.260  
set_clock_uncertainty -rise_from [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_IN}]  0.260  
set_clock_uncertainty -rise_from [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  0.260  
set_clock_uncertainty -rise_from [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  0.260  
set_clock_uncertainty -rise_from [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  0.260  
set_clock_uncertainty -rise_from [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  0.260  
set_clock_uncertainty -rise_from [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_IN}]  0.260  
set_clock_uncertainty -rise_from [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_IN}]  0.260  
set_clock_uncertainty -fall_from [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_IN}]  0.260  
set_clock_uncertainty -fall_from [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_IN}]  0.260  
set_clock_uncertainty -fall_from [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  0.260  
set_clock_uncertainty -fall_from [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  0.260  
set_clock_uncertainty -fall_from [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  0.260  
set_clock_uncertainty -fall_from [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  0.260  
set_clock_uncertainty -fall_from [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_IN}]  0.260  
set_clock_uncertainty -fall_from [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_IN}]  0.260  
set_clock_uncertainty -rise_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -rise_to [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}]  0.060  
set_clock_uncertainty -rise_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -fall_to [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}]  0.060  
set_clock_uncertainty -rise_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -rise_to [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}]  0.060  
set_clock_uncertainty -rise_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -fall_to [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}]  0.060  
set_clock_uncertainty -fall_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -rise_to [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}]  0.060  
set_clock_uncertainty -fall_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -fall_to [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}]  0.060  
set_clock_uncertainty -fall_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -rise_to [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}]  0.060  
set_clock_uncertainty -fall_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -fall_to [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}]  0.060  


#**************************************************************
# Set Input Delay
#**************************************************************

set_input_delay -add_delay -max -clock [get_clocks {clk_dram}]  -0.048 [get_ports {DRAM_DQ[0]}]
set_input_delay -add_delay -min -clock [get_clocks {clk_dram}]  -0.057 [get_ports {DRAM_DQ[0]}]
set_input_delay -add_delay -max -clock [get_clocks {clk_dram}]  -0.048 [get_ports {DRAM_DQ[1]}]
set_input_delay -add_delay -min -clock [get_clocks {clk_dram}]  -0.057 [get_ports {DRAM_DQ[1]}]
set_input_delay -add_delay -max -clock [get_clocks {clk_dram}]  -0.048 [get_ports {DRAM_DQ[2]}]
set_input_delay -add_delay -min -clock [get_clocks {clk_dram}]  -0.057 [get_ports {DRAM_DQ[2]}]
set_input_delay -add_delay -max -clock [get_clocks {clk_dram}]  -0.048 [get_ports {DRAM_DQ[3]}]
set_input_delay -add_delay -min -clock [get_clocks {clk_dram}]  -0.057 [get_ports {DRAM_DQ[3]}]
set_input_delay -add_delay -max -clock [get_clocks {clk_dram}]  -0.048 [get_ports {DRAM_DQ[4]}]
set_input_delay -add_delay -min -clock [get_clocks {clk_dram}]  -0.057 [get_ports {DRAM_DQ[4]}]
set_input_delay -add_delay -max -clock [get_clocks {clk_dram}]  -0.048 [get_ports {DRAM_DQ[5]}]
set_input_delay -add_delay -min -clock [get_clocks {clk_dram}]  -0.057 [get_ports {DRAM_DQ[5]}]
set_input_delay -add_delay -max -clock [get_clocks {clk_dram}]  -0.048 [get_ports {DRAM_DQ[6]}]
set_input_delay -add_delay -min -clock [get_clocks {clk_dram}]  -0.057 [get_ports {DRAM_DQ[6]}]
set_input_delay -add_delay -max -clock [get_clocks {clk_dram}]  -0.048 [get_ports {DRAM_DQ[7]}]
set_input_delay -add_delay -min -clock [get_clocks {clk_dram}]  -0.057 [get_ports {DRAM_DQ[7]}]
set_input_delay -add_delay -max -clock [get_clocks {clk_dram}]  -0.048 [get_ports {DRAM_DQ[8]}]
set_input_delay -add_delay -min -clock [get_clocks {clk_dram}]  -0.057 [get_ports {DRAM_DQ[8]}]
set_input_delay -add_delay -max -clock [get_clocks {clk_dram}]  -0.048 [get_ports {DRAM_DQ[9]}]
set_input_delay -add_delay -min -clock [get_clocks {clk_dram}]  -0.057 [get_ports {DRAM_DQ[9]}]
set_input_delay -add_delay -max -clock [get_clocks {clk_dram}]  -0.048 [get_ports {DRAM_DQ[10]}]
set_input_delay -add_delay -min -clock [get_clocks {clk_dram}]  -0.057 [get_ports {DRAM_DQ[10]}]
set_input_delay -add_delay -max -clock [get_clocks {clk_dram}]  -0.048 [get_ports {DRAM_DQ[11]}]
set_input_delay -add_delay -min -clock [get_clocks {clk_dram}]  -0.057 [get_ports {DRAM_DQ[11]}]
set_input_delay -add_delay -max -clock [get_clocks {clk_dram}]  -0.048 [get_ports {DRAM_DQ[12]}]
set_input_delay -add_delay -min -clock [get_clocks {clk_dram}]  -0.057 [get_ports {DRAM_DQ[12]}]
set_input_delay -add_delay -max -clock [get_clocks {clk_dram}]  -0.048 [get_ports {DRAM_DQ[13]}]
set_input_delay -add_delay -min -clock [get_clocks {clk_dram}]  -0.057 [get_ports {DRAM_DQ[13]}]
set_input_delay -add_delay -max -clock [get_clocks {clk_dram}]  -0.048 [get_ports {DRAM_DQ[14]}]
set_input_delay -add_delay -min -clock [get_clocks {clk_dram}]  -0.057 [get_ports {DRAM_DQ[14]}]
set_input_delay -add_delay -max -clock [get_clocks {clk_dram}]  -0.048 [get_ports {DRAM_DQ[15]}]
set_input_delay -add_delay -min -clock [get_clocks {clk_dram}]  -0.057 [get_ports {DRAM_DQ[15]}]
set_input_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  0.148 [get_ports {HPS_DDR3_DQ[0]}]
set_input_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  -0.255 [get_ports {HPS_DDR3_DQ[0]}]
set_input_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  0.148 [get_ports {HPS_DDR3_DQ[1]}]
set_input_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  -0.255 [get_ports {HPS_DDR3_DQ[1]}]
set_input_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  0.148 [get_ports {HPS_DDR3_DQ[2]}]
set_input_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  -0.255 [get_ports {HPS_DDR3_DQ[2]}]
set_input_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  0.148 [get_ports {HPS_DDR3_DQ[3]}]
set_input_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  -0.255 [get_ports {HPS_DDR3_DQ[3]}]
set_input_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  0.148 [get_ports {HPS_DDR3_DQ[4]}]
set_input_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  -0.255 [get_ports {HPS_DDR3_DQ[4]}]
set_input_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  0.148 [get_ports {HPS_DDR3_DQ[5]}]
set_input_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  -0.255 [get_ports {HPS_DDR3_DQ[5]}]
set_input_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  0.148 [get_ports {HPS_DDR3_DQ[6]}]
set_input_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  -0.255 [get_ports {HPS_DDR3_DQ[6]}]
set_input_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  0.148 [get_ports {HPS_DDR3_DQ[7]}]
set_input_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  -0.255 [get_ports {HPS_DDR3_DQ[7]}]
set_input_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  0.148 [get_ports {HPS_DDR3_DQ[8]}]
set_input_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  -0.255 [get_ports {HPS_DDR3_DQ[8]}]
set_input_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  0.148 [get_ports {HPS_DDR3_DQ[9]}]
set_input_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  -0.255 [get_ports {HPS_DDR3_DQ[9]}]
set_input_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  0.148 [get_ports {HPS_DDR3_DQ[10]}]
set_input_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  -0.255 [get_ports {HPS_DDR3_DQ[10]}]
set_input_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  0.148 [get_ports {HPS_DDR3_DQ[11]}]
set_input_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  -0.255 [get_ports {HPS_DDR3_DQ[11]}]
set_input_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  0.148 [get_ports {HPS_DDR3_DQ[12]}]
set_input_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  -0.255 [get_ports {HPS_DDR3_DQ[12]}]
set_input_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  0.148 [get_ports {HPS_DDR3_DQ[13]}]
set_input_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  -0.255 [get_ports {HPS_DDR3_DQ[13]}]
set_input_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  0.148 [get_ports {HPS_DDR3_DQ[14]}]
set_input_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  -0.255 [get_ports {HPS_DDR3_DQ[14]}]
set_input_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  0.148 [get_ports {HPS_DDR3_DQ[15]}]
set_input_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  -0.255 [get_ports {HPS_DDR3_DQ[15]}]
set_input_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[2]_IN}]  0.148 [get_ports {HPS_DDR3_DQ[16]}]
set_input_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[2]_IN}]  -0.255 [get_ports {HPS_DDR3_DQ[16]}]
set_input_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[2]_IN}]  0.148 [get_ports {HPS_DDR3_DQ[17]}]
set_input_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[2]_IN}]  -0.255 [get_ports {HPS_DDR3_DQ[17]}]
set_input_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[2]_IN}]  0.148 [get_ports {HPS_DDR3_DQ[18]}]
set_input_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[2]_IN}]  -0.255 [get_ports {HPS_DDR3_DQ[18]}]
set_input_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[2]_IN}]  0.148 [get_ports {HPS_DDR3_DQ[19]}]
set_input_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[2]_IN}]  -0.255 [get_ports {HPS_DDR3_DQ[19]}]
set_input_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[2]_IN}]  0.148 [get_ports {HPS_DDR3_DQ[20]}]
set_input_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[2]_IN}]  -0.255 [get_ports {HPS_DDR3_DQ[20]}]
set_input_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[2]_IN}]  0.148 [get_ports {HPS_DDR3_DQ[21]}]
set_input_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[2]_IN}]  -0.255 [get_ports {HPS_DDR3_DQ[21]}]
set_input_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[2]_IN}]  0.148 [get_ports {HPS_DDR3_DQ[22]}]
set_input_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[2]_IN}]  -0.255 [get_ports {HPS_DDR3_DQ[22]}]
set_input_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[2]_IN}]  0.148 [get_ports {HPS_DDR3_DQ[23]}]
set_input_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[2]_IN}]  -0.255 [get_ports {HPS_DDR3_DQ[23]}]
set_input_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[3]_IN}]  0.148 [get_ports {HPS_DDR3_DQ[24]}]
set_input_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[3]_IN}]  -0.255 [get_ports {HPS_DDR3_DQ[24]}]
set_input_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[3]_IN}]  0.148 [get_ports {HPS_DDR3_DQ[25]}]
set_input_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[3]_IN}]  -0.255 [get_ports {HPS_DDR3_DQ[25]}]
set_input_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[3]_IN}]  0.148 [get_ports {HPS_DDR3_DQ[26]}]
set_input_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[3]_IN}]  -0.255 [get_ports {HPS_DDR3_DQ[26]}]
set_input_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[3]_IN}]  0.148 [get_ports {HPS_DDR3_DQ[27]}]
set_input_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[3]_IN}]  -0.255 [get_ports {HPS_DDR3_DQ[27]}]
set_input_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[3]_IN}]  0.148 [get_ports {HPS_DDR3_DQ[28]}]
set_input_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[3]_IN}]  -0.255 [get_ports {HPS_DDR3_DQ[28]}]
set_input_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[3]_IN}]  0.148 [get_ports {HPS_DDR3_DQ[29]}]
set_input_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[3]_IN}]  -0.255 [get_ports {HPS_DDR3_DQ[29]}]
set_input_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[3]_IN}]  0.148 [get_ports {HPS_DDR3_DQ[30]}]
set_input_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[3]_IN}]  -0.255 [get_ports {HPS_DDR3_DQ[30]}]
set_input_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[3]_IN}]  0.148 [get_ports {HPS_DDR3_DQ[31]}]
set_input_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[3]_IN}]  -0.255 [get_ports {HPS_DDR3_DQ[31]}]
set_input_delay -add_delay -max -clock [get_clocks {tv_27m}]  3.692 [get_ports {TD_DATA[0]}]
set_input_delay -add_delay -min -clock [get_clocks {tv_27m}]  2.492 [get_ports {TD_DATA[0]}]
set_input_delay -add_delay -max -clock [get_clocks {tv_27m}]  3.692 [get_ports {TD_DATA[1]}]
set_input_delay -add_delay -min -clock [get_clocks {tv_27m}]  2.492 [get_ports {TD_DATA[1]}]
set_input_delay -add_delay -max -clock [get_clocks {tv_27m}]  3.692 [get_ports {TD_DATA[2]}]
set_input_delay -add_delay -min -clock [get_clocks {tv_27m}]  2.492 [get_ports {TD_DATA[2]}]
set_input_delay -add_delay -max -clock [get_clocks {tv_27m}]  3.692 [get_ports {TD_DATA[3]}]
set_input_delay -add_delay -min -clock [get_clocks {tv_27m}]  2.492 [get_ports {TD_DATA[3]}]
set_input_delay -add_delay -max -clock [get_clocks {tv_27m}]  3.692 [get_ports {TD_DATA[4]}]
set_input_delay -add_delay -min -clock [get_clocks {tv_27m}]  2.492 [get_ports {TD_DATA[4]}]
set_input_delay -add_delay -max -clock [get_clocks {tv_27m}]  3.692 [get_ports {TD_DATA[5]}]
set_input_delay -add_delay -min -clock [get_clocks {tv_27m}]  2.492 [get_ports {TD_DATA[5]}]
set_input_delay -add_delay -max -clock [get_clocks {tv_27m}]  3.692 [get_ports {TD_DATA[6]}]
set_input_delay -add_delay -min -clock [get_clocks {tv_27m}]  2.492 [get_ports {TD_DATA[6]}]
set_input_delay -add_delay -max -clock [get_clocks {tv_27m}]  3.692 [get_ports {TD_DATA[7]}]
set_input_delay -add_delay -min -clock [get_clocks {tv_27m}]  2.492 [get_ports {TD_DATA[7]}]
set_input_delay -add_delay -max -clock [get_clocks {tv_27m}]  3.654 [get_ports {TD_HS}]
set_input_delay -add_delay -min -clock [get_clocks {tv_27m}]  2.454 [get_ports {TD_HS}]
set_input_delay -add_delay -max -clock [get_clocks {tv_27m}]  3.656 [get_ports {TD_VS}]
set_input_delay -add_delay -min -clock [get_clocks {tv_27m}]  2.456 [get_ports {TD_VS}]


#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay -add_delay -max -clock [get_clocks {clk_dram}]  1.531 [get_ports {DRAM_ADDR[0]}]
set_output_delay -add_delay -min -clock [get_clocks {clk_dram}]  -0.805 [get_ports {DRAM_ADDR[0]}]
set_output_delay -add_delay -max -clock [get_clocks {clk_dram}]  1.531 [get_ports {DRAM_ADDR[1]}]
set_output_delay -add_delay -min -clock [get_clocks {clk_dram}]  -0.805 [get_ports {DRAM_ADDR[1]}]
set_output_delay -add_delay -max -clock [get_clocks {clk_dram}]  1.531 [get_ports {DRAM_ADDR[2]}]
set_output_delay -add_delay -min -clock [get_clocks {clk_dram}]  -0.805 [get_ports {DRAM_ADDR[2]}]
set_output_delay -add_delay -max -clock [get_clocks {clk_dram}]  1.531 [get_ports {DRAM_ADDR[3]}]
set_output_delay -add_delay -min -clock [get_clocks {clk_dram}]  -0.805 [get_ports {DRAM_ADDR[3]}]
set_output_delay -add_delay -max -clock [get_clocks {clk_dram}]  1.531 [get_ports {DRAM_ADDR[4]}]
set_output_delay -add_delay -min -clock [get_clocks {clk_dram}]  -0.805 [get_ports {DRAM_ADDR[4]}]
set_output_delay -add_delay -max -clock [get_clocks {clk_dram}]  1.531 [get_ports {DRAM_ADDR[5]}]
set_output_delay -add_delay -min -clock [get_clocks {clk_dram}]  -0.805 [get_ports {DRAM_ADDR[5]}]
set_output_delay -add_delay -max -clock [get_clocks {clk_dram}]  1.531 [get_ports {DRAM_ADDR[6]}]
set_output_delay -add_delay -min -clock [get_clocks {clk_dram}]  -0.805 [get_ports {DRAM_ADDR[6]}]
set_output_delay -add_delay -max -clock [get_clocks {clk_dram}]  1.531 [get_ports {DRAM_ADDR[7]}]
set_output_delay -add_delay -min -clock [get_clocks {clk_dram}]  -0.805 [get_ports {DRAM_ADDR[7]}]
set_output_delay -add_delay -max -clock [get_clocks {clk_dram}]  1.531 [get_ports {DRAM_ADDR[8]}]
set_output_delay -add_delay -min -clock [get_clocks {clk_dram}]  -0.805 [get_ports {DRAM_ADDR[8]}]
set_output_delay -add_delay -max -clock [get_clocks {clk_dram}]  1.531 [get_ports {DRAM_ADDR[9]}]
set_output_delay -add_delay -min -clock [get_clocks {clk_dram}]  -0.805 [get_ports {DRAM_ADDR[9]}]
set_output_delay -add_delay -max -clock [get_clocks {clk_dram}]  1.531 [get_ports {DRAM_ADDR[10]}]
set_output_delay -add_delay -min -clock [get_clocks {clk_dram}]  -0.805 [get_ports {DRAM_ADDR[10]}]
set_output_delay -add_delay -max -clock [get_clocks {clk_dram}]  1.531 [get_ports {DRAM_ADDR[11]}]
set_output_delay -add_delay -min -clock [get_clocks {clk_dram}]  -0.805 [get_ports {DRAM_ADDR[11]}]
set_output_delay -add_delay -max -clock [get_clocks {clk_dram}]  1.531 [get_ports {DRAM_ADDR[12]}]
set_output_delay -add_delay -min -clock [get_clocks {clk_dram}]  -0.805 [get_ports {DRAM_ADDR[12]}]
set_output_delay -add_delay -max -clock [get_clocks {clk_dram}]  1.510 [get_ports {DRAM_BA[0]}]
set_output_delay -add_delay -min -clock [get_clocks {clk_dram}]  -0.800 [get_ports {DRAM_BA[0]}]
set_output_delay -add_delay -max -clock [get_clocks {clk_dram}]  1.510 [get_ports {DRAM_BA[1]}]
set_output_delay -add_delay -min -clock [get_clocks {clk_dram}]  -0.800 [get_ports {DRAM_BA[1]}]
set_output_delay -add_delay -max -clock [get_clocks {clk_dram}]  1.500 [get_ports {DRAM_CAS_N}]
set_output_delay -add_delay -min -clock [get_clocks {clk_dram}]  -0.800 [get_ports {DRAM_CAS_N}]
set_output_delay -add_delay -max -clock [get_clocks {clk_dram}]  1.496 [get_ports {DRAM_CKE}]
set_output_delay -add_delay -min -clock [get_clocks {clk_dram}]  -0.804 [get_ports {DRAM_CKE}]
set_output_delay -add_delay -max -clock [get_clocks {clk_dram}]  1.508 [get_ports {DRAM_CS_N}]
set_output_delay -add_delay -min -clock [get_clocks {clk_dram}]  -0.792 [get_ports {DRAM_CS_N}]
set_output_delay -add_delay -max -clock [get_clocks {clk_dram}]  1.452 [get_ports {DRAM_DQ[0]}]
set_output_delay -add_delay -min -clock [get_clocks {clk_dram}]  -0.857 [get_ports {DRAM_DQ[0]}]
set_output_delay -add_delay -max -clock [get_clocks {clk_dram}]  1.452 [get_ports {DRAM_DQ[1]}]
set_output_delay -add_delay -min -clock [get_clocks {clk_dram}]  -0.857 [get_ports {DRAM_DQ[1]}]
set_output_delay -add_delay -max -clock [get_clocks {clk_dram}]  1.452 [get_ports {DRAM_DQ[2]}]
set_output_delay -add_delay -min -clock [get_clocks {clk_dram}]  -0.857 [get_ports {DRAM_DQ[2]}]
set_output_delay -add_delay -max -clock [get_clocks {clk_dram}]  1.452 [get_ports {DRAM_DQ[3]}]
set_output_delay -add_delay -min -clock [get_clocks {clk_dram}]  -0.857 [get_ports {DRAM_DQ[3]}]
set_output_delay -add_delay -max -clock [get_clocks {clk_dram}]  1.452 [get_ports {DRAM_DQ[4]}]
set_output_delay -add_delay -min -clock [get_clocks {clk_dram}]  -0.857 [get_ports {DRAM_DQ[4]}]
set_output_delay -add_delay -max -clock [get_clocks {clk_dram}]  1.452 [get_ports {DRAM_DQ[5]}]
set_output_delay -add_delay -min -clock [get_clocks {clk_dram}]  -0.857 [get_ports {DRAM_DQ[5]}]
set_output_delay -add_delay -max -clock [get_clocks {clk_dram}]  1.452 [get_ports {DRAM_DQ[6]}]
set_output_delay -add_delay -min -clock [get_clocks {clk_dram}]  -0.857 [get_ports {DRAM_DQ[6]}]
set_output_delay -add_delay -max -clock [get_clocks {clk_dram}]  1.452 [get_ports {DRAM_DQ[7]}]
set_output_delay -add_delay -min -clock [get_clocks {clk_dram}]  -0.857 [get_ports {DRAM_DQ[7]}]
set_output_delay -add_delay -max -clock [get_clocks {clk_dram}]  1.452 [get_ports {DRAM_DQ[8]}]
set_output_delay -add_delay -min -clock [get_clocks {clk_dram}]  -0.857 [get_ports {DRAM_DQ[8]}]
set_output_delay -add_delay -max -clock [get_clocks {clk_dram}]  1.452 [get_ports {DRAM_DQ[9]}]
set_output_delay -add_delay -min -clock [get_clocks {clk_dram}]  -0.857 [get_ports {DRAM_DQ[9]}]
set_output_delay -add_delay -max -clock [get_clocks {clk_dram}]  1.452 [get_ports {DRAM_DQ[10]}]
set_output_delay -add_delay -min -clock [get_clocks {clk_dram}]  -0.857 [get_ports {DRAM_DQ[10]}]
set_output_delay -add_delay -max -clock [get_clocks {clk_dram}]  1.452 [get_ports {DRAM_DQ[11]}]
set_output_delay -add_delay -min -clock [get_clocks {clk_dram}]  -0.857 [get_ports {DRAM_DQ[11]}]
set_output_delay -add_delay -max -clock [get_clocks {clk_dram}]  1.452 [get_ports {DRAM_DQ[12]}]
set_output_delay -add_delay -min -clock [get_clocks {clk_dram}]  -0.857 [get_ports {DRAM_DQ[12]}]
set_output_delay -add_delay -max -clock [get_clocks {clk_dram}]  1.452 [get_ports {DRAM_DQ[13]}]
set_output_delay -add_delay -min -clock [get_clocks {clk_dram}]  -0.857 [get_ports {DRAM_DQ[13]}]
set_output_delay -add_delay -max -clock [get_clocks {clk_dram}]  1.452 [get_ports {DRAM_DQ[14]}]
set_output_delay -add_delay -min -clock [get_clocks {clk_dram}]  -0.857 [get_ports {DRAM_DQ[14]}]
set_output_delay -add_delay -max -clock [get_clocks {clk_dram}]  1.452 [get_ports {DRAM_DQ[15]}]
set_output_delay -add_delay -min -clock [get_clocks {clk_dram}]  -0.857 [get_ports {DRAM_DQ[15]}]
set_output_delay -add_delay -max -clock [get_clocks {clk_dram}]  1.533 [get_ports {DRAM_LDQM}]
set_output_delay -add_delay -min -clock [get_clocks {clk_dram}]  -0.805 [get_ports {DRAM_LDQM}]
set_output_delay -add_delay -max -clock [get_clocks {clk_dram}]  1.520 [get_ports {DRAM_RAS_N}]
set_output_delay -add_delay -min -clock [get_clocks {clk_dram}]  -0.780 [get_ports {DRAM_RAS_N}]
set_output_delay -add_delay -max -clock [get_clocks {clk_dram}]  1.533 [get_ports {DRAM_UDQM}]
set_output_delay -add_delay -min -clock [get_clocks {clk_dram}]  -0.805 [get_ports {DRAM_UDQM}]
set_output_delay -add_delay -max -clock [get_clocks {clk_dram}]  1.545 [get_ports {DRAM_WE_N}]
set_output_delay -add_delay -min -clock [get_clocks {clk_dram}]  -0.755 [get_ports {DRAM_WE_N}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_CK_P}]  1.610 [get_ports {HPS_DDR3_ADDR[0]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_CK_P}]  0.980 [get_ports {HPS_DDR3_ADDR[0]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_CK_P}]  1.610 [get_ports {HPS_DDR3_ADDR[1]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_CK_P}]  0.980 [get_ports {HPS_DDR3_ADDR[1]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_CK_P}]  1.610 [get_ports {HPS_DDR3_ADDR[2]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_CK_P}]  0.980 [get_ports {HPS_DDR3_ADDR[2]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_CK_P}]  1.610 [get_ports {HPS_DDR3_ADDR[3]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_CK_P}]  0.980 [get_ports {HPS_DDR3_ADDR[3]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_CK_P}]  1.610 [get_ports {HPS_DDR3_ADDR[4]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_CK_P}]  0.980 [get_ports {HPS_DDR3_ADDR[4]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_CK_P}]  1.610 [get_ports {HPS_DDR3_ADDR[5]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_CK_P}]  0.980 [get_ports {HPS_DDR3_ADDR[5]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_CK_P}]  1.610 [get_ports {HPS_DDR3_ADDR[6]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_CK_P}]  0.980 [get_ports {HPS_DDR3_ADDR[6]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_CK_P}]  1.610 [get_ports {HPS_DDR3_ADDR[7]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_CK_P}]  0.980 [get_ports {HPS_DDR3_ADDR[7]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_CK_P}]  1.610 [get_ports {HPS_DDR3_ADDR[8]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_CK_P}]  0.980 [get_ports {HPS_DDR3_ADDR[8]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_CK_P}]  1.610 [get_ports {HPS_DDR3_ADDR[9]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_CK_P}]  0.980 [get_ports {HPS_DDR3_ADDR[9]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_CK_P}]  1.610 [get_ports {HPS_DDR3_ADDR[10]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_CK_P}]  0.980 [get_ports {HPS_DDR3_ADDR[10]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_CK_P}]  1.610 [get_ports {HPS_DDR3_ADDR[11]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_CK_P}]  0.980 [get_ports {HPS_DDR3_ADDR[11]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_CK_P}]  1.610 [get_ports {HPS_DDR3_ADDR[12]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_CK_P}]  0.980 [get_ports {HPS_DDR3_ADDR[12]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_CK_P}]  1.610 [get_ports {HPS_DDR3_ADDR[13]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_CK_P}]  0.980 [get_ports {HPS_DDR3_ADDR[13]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_CK_P}]  1.610 [get_ports {HPS_DDR3_ADDR[14]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_CK_P}]  0.980 [get_ports {HPS_DDR3_ADDR[14]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_CK_P}]  1.610 [get_ports {HPS_DDR3_BA[0]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_CK_P}]  0.980 [get_ports {HPS_DDR3_BA[0]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_CK_P}]  1.610 [get_ports {HPS_DDR3_BA[1]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_CK_P}]  0.980 [get_ports {HPS_DDR3_BA[1]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_CK_P}]  1.610 [get_ports {HPS_DDR3_BA[2]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_CK_P}]  0.980 [get_ports {HPS_DDR3_BA[2]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_CK_P}]  1.610 [get_ports {HPS_DDR3_CAS_N}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_CK_P}]  0.980 [get_ports {HPS_DDR3_CAS_N}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_CK_P}]  1.610 [get_ports {HPS_DDR3_CKE}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_CK_P}]  0.980 [get_ports {HPS_DDR3_CKE}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_CK_P}]  1.610 [get_ports {HPS_DDR3_CS_N}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_CK_P}]  0.980 [get_ports {HPS_DDR3_CS_N}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.331 [get_ports {HPS_DDR3_DM[0]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  -0.312 [get_ports {HPS_DDR3_DM[0]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.331 [get_ports {HPS_DDR3_DM[0]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  -0.312 [get_ports {HPS_DDR3_DM[0]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.331 [get_ports {HPS_DDR3_DM[1]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  -0.312 [get_ports {HPS_DDR3_DM[1]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.331 [get_ports {HPS_DDR3_DM[1]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  -0.312 [get_ports {HPS_DDR3_DM[1]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.331 [get_ports {HPS_DDR3_DM[2]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  -0.312 [get_ports {HPS_DDR3_DM[2]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.331 [get_ports {HPS_DDR3_DM[2]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  -0.312 [get_ports {HPS_DDR3_DM[2]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.331 [get_ports {HPS_DDR3_DM[3]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  -0.312 [get_ports {HPS_DDR3_DM[3]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.331 [get_ports {HPS_DDR3_DM[3]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  -0.312 [get_ports {HPS_DDR3_DM[3]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_CK_P}]  1.473 [get_ports {HPS_DDR3_DQS_P[0]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_CK_P}]  0.778 [get_ports {HPS_DDR3_DQS_P[0]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_CK_P}]  1.473 [get_ports {HPS_DDR3_DQS_P[1]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_CK_P}]  0.778 [get_ports {HPS_DDR3_DQS_P[1]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_CK_P}]  1.473 [get_ports {HPS_DDR3_DQS_P[2]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_CK_P}]  0.778 [get_ports {HPS_DDR3_DQS_P[2]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_CK_P}]  1.473 [get_ports {HPS_DDR3_DQS_P[3]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_CK_P}]  0.778 [get_ports {HPS_DDR3_DQS_P[3]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.331 [get_ports {HPS_DDR3_DQ[0]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  -0.312 [get_ports {HPS_DDR3_DQ[0]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.331 [get_ports {HPS_DDR3_DQ[0]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  -0.312 [get_ports {HPS_DDR3_DQ[0]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.331 [get_ports {HPS_DDR3_DQ[1]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  -0.312 [get_ports {HPS_DDR3_DQ[1]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.331 [get_ports {HPS_DDR3_DQ[1]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  -0.312 [get_ports {HPS_DDR3_DQ[1]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.331 [get_ports {HPS_DDR3_DQ[2]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  -0.312 [get_ports {HPS_DDR3_DQ[2]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.331 [get_ports {HPS_DDR3_DQ[2]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  -0.312 [get_ports {HPS_DDR3_DQ[2]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.331 [get_ports {HPS_DDR3_DQ[3]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  -0.312 [get_ports {HPS_DDR3_DQ[3]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.331 [get_ports {HPS_DDR3_DQ[3]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  -0.312 [get_ports {HPS_DDR3_DQ[3]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.331 [get_ports {HPS_DDR3_DQ[4]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  -0.312 [get_ports {HPS_DDR3_DQ[4]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.331 [get_ports {HPS_DDR3_DQ[4]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  -0.312 [get_ports {HPS_DDR3_DQ[4]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.331 [get_ports {HPS_DDR3_DQ[5]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  -0.312 [get_ports {HPS_DDR3_DQ[5]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.331 [get_ports {HPS_DDR3_DQ[5]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  -0.312 [get_ports {HPS_DDR3_DQ[5]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.331 [get_ports {HPS_DDR3_DQ[6]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  -0.312 [get_ports {HPS_DDR3_DQ[6]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.331 [get_ports {HPS_DDR3_DQ[6]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  -0.312 [get_ports {HPS_DDR3_DQ[6]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.331 [get_ports {HPS_DDR3_DQ[7]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  -0.312 [get_ports {HPS_DDR3_DQ[7]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.331 [get_ports {HPS_DDR3_DQ[7]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  -0.312 [get_ports {HPS_DDR3_DQ[7]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.331 [get_ports {HPS_DDR3_DQ[8]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  -0.312 [get_ports {HPS_DDR3_DQ[8]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.331 [get_ports {HPS_DDR3_DQ[8]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  -0.312 [get_ports {HPS_DDR3_DQ[8]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.331 [get_ports {HPS_DDR3_DQ[9]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  -0.312 [get_ports {HPS_DDR3_DQ[9]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.331 [get_ports {HPS_DDR3_DQ[9]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  -0.312 [get_ports {HPS_DDR3_DQ[9]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.331 [get_ports {HPS_DDR3_DQ[10]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  -0.312 [get_ports {HPS_DDR3_DQ[10]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.331 [get_ports {HPS_DDR3_DQ[10]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  -0.312 [get_ports {HPS_DDR3_DQ[10]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.331 [get_ports {HPS_DDR3_DQ[11]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  -0.312 [get_ports {HPS_DDR3_DQ[11]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.331 [get_ports {HPS_DDR3_DQ[11]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  -0.312 [get_ports {HPS_DDR3_DQ[11]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.331 [get_ports {HPS_DDR3_DQ[12]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  -0.312 [get_ports {HPS_DDR3_DQ[12]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.331 [get_ports {HPS_DDR3_DQ[12]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  -0.312 [get_ports {HPS_DDR3_DQ[12]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.331 [get_ports {HPS_DDR3_DQ[13]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  -0.312 [get_ports {HPS_DDR3_DQ[13]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.331 [get_ports {HPS_DDR3_DQ[13]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  -0.312 [get_ports {HPS_DDR3_DQ[13]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.331 [get_ports {HPS_DDR3_DQ[14]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  -0.312 [get_ports {HPS_DDR3_DQ[14]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.331 [get_ports {HPS_DDR3_DQ[14]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  -0.312 [get_ports {HPS_DDR3_DQ[14]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.331 [get_ports {HPS_DDR3_DQ[15]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  -0.312 [get_ports {HPS_DDR3_DQ[15]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.331 [get_ports {HPS_DDR3_DQ[15]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  -0.312 [get_ports {HPS_DDR3_DQ[15]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.331 [get_ports {HPS_DDR3_DQ[16]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  -0.312 [get_ports {HPS_DDR3_DQ[16]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.331 [get_ports {HPS_DDR3_DQ[16]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  -0.312 [get_ports {HPS_DDR3_DQ[16]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.331 [get_ports {HPS_DDR3_DQ[17]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  -0.312 [get_ports {HPS_DDR3_DQ[17]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.331 [get_ports {HPS_DDR3_DQ[17]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  -0.312 [get_ports {HPS_DDR3_DQ[17]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.331 [get_ports {HPS_DDR3_DQ[18]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  -0.312 [get_ports {HPS_DDR3_DQ[18]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.331 [get_ports {HPS_DDR3_DQ[18]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  -0.312 [get_ports {HPS_DDR3_DQ[18]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.331 [get_ports {HPS_DDR3_DQ[19]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  -0.312 [get_ports {HPS_DDR3_DQ[19]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.331 [get_ports {HPS_DDR3_DQ[19]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  -0.312 [get_ports {HPS_DDR3_DQ[19]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.331 [get_ports {HPS_DDR3_DQ[20]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  -0.312 [get_ports {HPS_DDR3_DQ[20]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.331 [get_ports {HPS_DDR3_DQ[20]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  -0.312 [get_ports {HPS_DDR3_DQ[20]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.331 [get_ports {HPS_DDR3_DQ[21]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  -0.312 [get_ports {HPS_DDR3_DQ[21]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.331 [get_ports {HPS_DDR3_DQ[21]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  -0.312 [get_ports {HPS_DDR3_DQ[21]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.331 [get_ports {HPS_DDR3_DQ[22]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  -0.312 [get_ports {HPS_DDR3_DQ[22]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.331 [get_ports {HPS_DDR3_DQ[22]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  -0.312 [get_ports {HPS_DDR3_DQ[22]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.331 [get_ports {HPS_DDR3_DQ[23]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  -0.312 [get_ports {HPS_DDR3_DQ[23]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.331 [get_ports {HPS_DDR3_DQ[23]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  -0.312 [get_ports {HPS_DDR3_DQ[23]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.331 [get_ports {HPS_DDR3_DQ[24]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  -0.312 [get_ports {HPS_DDR3_DQ[24]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.331 [get_ports {HPS_DDR3_DQ[24]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  -0.312 [get_ports {HPS_DDR3_DQ[24]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.331 [get_ports {HPS_DDR3_DQ[25]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  -0.312 [get_ports {HPS_DDR3_DQ[25]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.331 [get_ports {HPS_DDR3_DQ[25]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  -0.312 [get_ports {HPS_DDR3_DQ[25]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.331 [get_ports {HPS_DDR3_DQ[26]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  -0.312 [get_ports {HPS_DDR3_DQ[26]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.331 [get_ports {HPS_DDR3_DQ[26]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  -0.312 [get_ports {HPS_DDR3_DQ[26]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.331 [get_ports {HPS_DDR3_DQ[27]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  -0.312 [get_ports {HPS_DDR3_DQ[27]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.331 [get_ports {HPS_DDR3_DQ[27]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  -0.312 [get_ports {HPS_DDR3_DQ[27]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.331 [get_ports {HPS_DDR3_DQ[28]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  -0.312 [get_ports {HPS_DDR3_DQ[28]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.331 [get_ports {HPS_DDR3_DQ[28]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  -0.312 [get_ports {HPS_DDR3_DQ[28]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.331 [get_ports {HPS_DDR3_DQ[29]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  -0.312 [get_ports {HPS_DDR3_DQ[29]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.331 [get_ports {HPS_DDR3_DQ[29]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  -0.312 [get_ports {HPS_DDR3_DQ[29]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.331 [get_ports {HPS_DDR3_DQ[30]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  -0.312 [get_ports {HPS_DDR3_DQ[30]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.331 [get_ports {HPS_DDR3_DQ[30]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  -0.312 [get_ports {HPS_DDR3_DQ[30]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.331 [get_ports {HPS_DDR3_DQ[31]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  -0.312 [get_ports {HPS_DDR3_DQ[31]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.331 [get_ports {HPS_DDR3_DQ[31]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  -0.312 [get_ports {HPS_DDR3_DQ[31]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_CK_P}]  1.610 [get_ports {HPS_DDR3_ODT}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_CK_P}]  0.980 [get_ports {HPS_DDR3_ODT}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_CK_P}]  1.610 [get_ports {HPS_DDR3_RAS_N}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_CK_P}]  0.980 [get_ports {HPS_DDR3_RAS_N}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_CK_P}]  1.610 [get_ports {HPS_DDR3_WE_N}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_CK_P}]  0.980 [get_ports {HPS_DDR3_WE_N}]
set_output_delay -add_delay -max -clock [get_clocks {clk_vga}]  0.215 [get_ports {VGA_BLANK_N}]
set_output_delay -add_delay -min -clock [get_clocks {clk_vga}]  -1.485 [get_ports {VGA_BLANK_N}]
set_output_delay -add_delay -max -clock [get_clocks {clk_vga}]  0.264 [get_ports {VGA_B[0]}]
set_output_delay -add_delay -min -clock [get_clocks {clk_vga}]  -1.519 [get_ports {VGA_B[0]}]
set_output_delay -add_delay -max -clock [get_clocks {clk_vga}]  0.264 [get_ports {VGA_B[1]}]
set_output_delay -add_delay -min -clock [get_clocks {clk_vga}]  -1.519 [get_ports {VGA_B[1]}]
set_output_delay -add_delay -max -clock [get_clocks {clk_vga}]  0.264 [get_ports {VGA_B[2]}]
set_output_delay -add_delay -min -clock [get_clocks {clk_vga}]  -1.519 [get_ports {VGA_B[2]}]
set_output_delay -add_delay -max -clock [get_clocks {clk_vga}]  0.264 [get_ports {VGA_B[3]}]
set_output_delay -add_delay -min -clock [get_clocks {clk_vga}]  -1.519 [get_ports {VGA_B[3]}]
set_output_delay -add_delay -max -clock [get_clocks {clk_vga}]  0.264 [get_ports {VGA_B[4]}]
set_output_delay -add_delay -min -clock [get_clocks {clk_vga}]  -1.519 [get_ports {VGA_B[4]}]
set_output_delay -add_delay -max -clock [get_clocks {clk_vga}]  0.264 [get_ports {VGA_B[5]}]
set_output_delay -add_delay -min -clock [get_clocks {clk_vga}]  -1.519 [get_ports {VGA_B[5]}]
set_output_delay -add_delay -max -clock [get_clocks {clk_vga}]  0.264 [get_ports {VGA_B[6]}]
set_output_delay -add_delay -min -clock [get_clocks {clk_vga}]  -1.519 [get_ports {VGA_B[6]}]
set_output_delay -add_delay -max -clock [get_clocks {clk_vga}]  0.264 [get_ports {VGA_B[7]}]
set_output_delay -add_delay -min -clock [get_clocks {clk_vga}]  -1.519 [get_ports {VGA_B[7]}]
set_output_delay -add_delay -max -clock [get_clocks {clk_vga}]  0.212 [get_ports {VGA_G[0]}]
set_output_delay -add_delay -min -clock [get_clocks {clk_vga}]  -1.519 [get_ports {VGA_G[0]}]
set_output_delay -add_delay -max -clock [get_clocks {clk_vga}]  0.212 [get_ports {VGA_G[1]}]
set_output_delay -add_delay -min -clock [get_clocks {clk_vga}]  -1.519 [get_ports {VGA_G[1]}]
set_output_delay -add_delay -max -clock [get_clocks {clk_vga}]  0.212 [get_ports {VGA_G[2]}]
set_output_delay -add_delay -min -clock [get_clocks {clk_vga}]  -1.519 [get_ports {VGA_G[2]}]
set_output_delay -add_delay -max -clock [get_clocks {clk_vga}]  0.212 [get_ports {VGA_G[3]}]
set_output_delay -add_delay -min -clock [get_clocks {clk_vga}]  -1.519 [get_ports {VGA_G[3]}]
set_output_delay -add_delay -max -clock [get_clocks {clk_vga}]  0.212 [get_ports {VGA_G[4]}]
set_output_delay -add_delay -min -clock [get_clocks {clk_vga}]  -1.519 [get_ports {VGA_G[4]}]
set_output_delay -add_delay -max -clock [get_clocks {clk_vga}]  0.212 [get_ports {VGA_G[5]}]
set_output_delay -add_delay -min -clock [get_clocks {clk_vga}]  -1.519 [get_ports {VGA_G[5]}]
set_output_delay -add_delay -max -clock [get_clocks {clk_vga}]  0.212 [get_ports {VGA_G[6]}]
set_output_delay -add_delay -min -clock [get_clocks {clk_vga}]  -1.519 [get_ports {VGA_G[6]}]
set_output_delay -add_delay -max -clock [get_clocks {clk_vga}]  0.212 [get_ports {VGA_G[7]}]
set_output_delay -add_delay -min -clock [get_clocks {clk_vga}]  -1.519 [get_ports {VGA_G[7]}]
set_output_delay -add_delay -max -clock [get_clocks {clk_vga}]  0.220 [get_ports {VGA_R[0]}]
set_output_delay -add_delay -min -clock [get_clocks {clk_vga}]  -1.506 [get_ports {VGA_R[0]}]
set_output_delay -add_delay -max -clock [get_clocks {clk_vga}]  0.220 [get_ports {VGA_R[1]}]
set_output_delay -add_delay -min -clock [get_clocks {clk_vga}]  -1.506 [get_ports {VGA_R[1]}]
set_output_delay -add_delay -max -clock [get_clocks {clk_vga}]  0.220 [get_ports {VGA_R[2]}]
set_output_delay -add_delay -min -clock [get_clocks {clk_vga}]  -1.506 [get_ports {VGA_R[2]}]
set_output_delay -add_delay -max -clock [get_clocks {clk_vga}]  0.220 [get_ports {VGA_R[3]}]
set_output_delay -add_delay -min -clock [get_clocks {clk_vga}]  -1.506 [get_ports {VGA_R[3]}]
set_output_delay -add_delay -max -clock [get_clocks {clk_vga}]  0.220 [get_ports {VGA_R[4]}]
set_output_delay -add_delay -min -clock [get_clocks {clk_vga}]  -1.506 [get_ports {VGA_R[4]}]
set_output_delay -add_delay -max -clock [get_clocks {clk_vga}]  0.220 [get_ports {VGA_R[5]}]
set_output_delay -add_delay -min -clock [get_clocks {clk_vga}]  -1.506 [get_ports {VGA_R[5]}]
set_output_delay -add_delay -max -clock [get_clocks {clk_vga}]  0.220 [get_ports {VGA_R[6]}]
set_output_delay -add_delay -min -clock [get_clocks {clk_vga}]  -1.506 [get_ports {VGA_R[6]}]
set_output_delay -add_delay -max -clock [get_clocks {clk_vga}]  0.220 [get_ports {VGA_R[7]}]
set_output_delay -add_delay -min -clock [get_clocks {clk_vga}]  -1.506 [get_ports {VGA_R[7]}]


#**************************************************************
# Set Clock Groups
#**************************************************************

set_clock_groups -physically_exclusive -group [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -group [get_clocks {HPS_DDR3_DQS_P[0]_OUT HPS_DDR3_DQS_N[0]_OUT}] 
set_clock_groups -physically_exclusive -group [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -group [get_clocks {HPS_DDR3_DQS_P[1]_OUT HPS_DDR3_DQS_N[1]_OUT}] 
set_clock_groups -physically_exclusive -group [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -group [get_clocks {HPS_DDR3_DQS_P[2]_OUT HPS_DDR3_DQS_N[2]_OUT}] 
set_clock_groups -physically_exclusive -group [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -group [get_clocks {HPS_DDR3_DQS_P[3]_OUT HPS_DDR3_DQS_N[3]_OUT}] 


#**************************************************************
# Set False Path
#**************************************************************

set_false_path  -fall_from  [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}]  -to  [get_clocks {HPS_DDR3_CK_P}]
set_false_path  -from  [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}]  -to  [get_clocks {*_IN}]
set_false_path  -from  [get_clocks *]  -to  [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}]
set_false_path -from [get_keepers {*rdptr_g*}] -to [get_keepers {*ws_dgrp|dffpipe_2v8:dffpipe16|dffe17a*}]
set_false_path -from [get_keepers {*delayed_wrptr_g*}] -to [get_keepers {*rs_dgwp|dffpipe_1v8:dffpipe12|dffe13a*}]
set_false_path -from [get_keepers {*rdptr_g*}] -to [get_keepers {*ws_dgrp|dffpipe_4v8:dffpipe9|dffe10a*}]
set_false_path -from [get_keepers {*delayed_wrptr_g*}] -to [get_keepers {*rs_dgwp|dffpipe_3v8:dffpipe6|dffe7a*}]
set_false_path -to [get_pins -nocase -compatibility_mode {*|alt_rst_sync_uq1|altera_reset_synchronizer_int_chain*|clrn}]
set_false_path -fall_from [get_clocks {Computer_System:The_System|Computer_System_ARM_A9_HPS:arm_a9_hps|Computer_System_ARM_A9_HPS_hps_io:hps_io|Computer_System_ARM_A9_HPS_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -to [get_ports {{HPS_DDR3_ADDR[0]} {HPS_DDR3_ADDR[10]} {HPS_DDR3_ADDR[11]} {HPS_DDR3_ADDR[12]} {HPS_DDR3_ADDR[13]} {HPS_DDR3_ADDR[14]} {HPS_DDR3_ADDR[1]} {HPS_DDR3_ADDR[2]} {HPS_DDR3_ADDR[3]} {HPS_DDR3_ADDR[4]} {HPS_DDR3_ADDR[5]} {HPS_DDR3_ADDR[6]} {HPS_DDR3_ADDR[7]} {HPS_DDR3_ADDR[8]} {HPS_DDR3_ADDR[9]} {HPS_DDR3_BA[0]} {HPS_DDR3_BA[1]} {HPS_DDR3_BA[2]} HPS_DDR3_CAS_N HPS_DDR3_CKE HPS_DDR3_CS_N HPS_DDR3_ODT HPS_DDR3_RAS_N HPS_DDR3_WE_N}]
set_false_path -from [get_keepers {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*c0|hmc_inst~FF_*}] -to [get_keepers {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*p0|*umemphy|*uio_pads|*uaddr_cmd_pads|*ddio_out*}]
set_false_path -from [get_keepers {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*p0|*umemphy|hphy_inst~FF_*}] -to [get_keepers {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*p0|*lfifo~LFIFO_IN_READ_EN_DFF}]
set_false_path -from [get_keepers {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*c0|hmc_inst~FF_*}] -to [get_keepers {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*p0|*lfifo~LFIFO_IN_READ_EN_DFF}]
set_false_path -from [get_keepers {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*p0|*umemphy|hphy_inst~FF_*}] -to [get_keepers {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*p0|*vfifo~INC_WR_PTR_DFF}]
set_false_path -from [get_keepers {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*c0|hmc_inst~FF_*}] -to [get_keepers {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*p0|*altdq_dqs2_inst|vfifo~QVLD_IN_DFF}]
set_false_path -from [get_keepers {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*p0|*lfifo~LFIFO_OUT_RDATA_VALID_DFF}] -to [get_keepers {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*p0|*umemphy|hphy_inst~FF_*}]
set_false_path -from [get_keepers {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*p0|*umemphy|hphy_inst~FF_*}] -to [get_keepers {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*p0|*altdq_dqs2_inst|vfifo~QVLD_IN_DFF}]
set_false_path -from [get_keepers {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*p0|*umemphy|hphy_inst~FF_*}] -to [get_keepers {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*p0|*lfifo~RD_LATENCY_DFF*}]
set_false_path -from [get_keepers {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*p0|*umemphy|hphy_inst~FF_*}] -to [get_keepers {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*p0|*umemphy|*uio_pads|*uaddr_cmd_pads|*ddio_out*}]
set_false_path -from [get_keepers {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*p0|*umemphy|hphy_inst~FF_*}] -to [get_keepers {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*p0|*umemphy|*altdq_dqs2_inst|*output_path_gen[*].ddio_out*}]
set_false_path -from [get_keepers {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*p0|*umemphy|hphy_inst~FF_*}] -to [get_keepers {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*p0|*umemphy|*altdq_dqs2_inst|extra_output_pad_gen[*].ddio_out*}]
set_false_path -from [get_keepers {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*p0|*umemphy|hphy_inst~FF_*}] -to [get_keepers {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*p0|*umemphy|hphy_inst~FF_*}]
set_false_path -from [get_keepers {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*c0|hmc_inst~FF_*}] -to [get_keepers {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*p0|*umemphy|hphy_inst~FF_*}]
set_false_path -from [get_keepers {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*p0|*umemphy|hphy_inst~FF_*}] -to [get_keepers {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*c0|hmc_inst~FF_*}]
set_false_path -from [get_keepers {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*p0|*umemphy|hphy_inst~FF_*}] -to [get_keepers {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*p0|*phase_align_os~DFF*}]
set_false_path -from [get_keepers {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*p0|*altdq_dqs2_inst|*read_fifo~OUTPUT_DFF_*}] -to [get_keepers {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*p0|*umemphy|hphy_inst~FF_*}]
set_false_path -to [get_ports {HPS_DDR3_DQS_N[0]}]
set_false_path -to [get_ports {HPS_DDR3_DQS_N[1]}]
set_false_path -to [get_ports {HPS_DDR3_DQS_N[2]}]
set_false_path -to [get_ports {HPS_DDR3_DQS_N[3]}]
set_false_path -to [get_ports {HPS_DDR3_CK_P}]
set_false_path -to [get_ports {HPS_DDR3_CK_N}]
set_false_path -to [get_ports {HPS_DDR3_RESET_N}]
set_false_path -from [get_keepers {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*p0|*umemphy|hphy_inst~FF_*}] -to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]
set_false_path -from [get_keepers {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*p0|*umemphy|hphy_inst~FF_*}] -to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]
set_false_path -from [get_keepers {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*p0|*umemphy|hphy_inst~FF_*}] -to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]
set_false_path -from [get_keepers {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*p0|*umemphy|hphy_inst~FF_*}] -to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]
set_false_path -from [get_keepers {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*p0|*altdq_dqs2_inst|dqs_enable_ctrl~*}] -to [get_keepers {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*p0|*altdq_dqs2_inst|dqs_delay_chain~POSTAMBLE_DFF}]


#**************************************************************
# Set Multicycle Path
#**************************************************************

set_multicycle_path -setup -end -from  [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}]  -to  [get_clocks *] 2
set_multicycle_path -hold -end -from  [get_clocks {The_System|arm_a9_hps|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}]  -to  [get_clocks *] 2
set_multicycle_path -setup -end -to [get_registers {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*p0|*umemphy|*uio_pads|*uaddr_cmd_pads|*clock_gen[*].umem_ck_pad|*}] 4
set_multicycle_path -hold -end -to [get_registers {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*p0|*umemphy|*uio_pads|*uaddr_cmd_pads|*clock_gen[*].umem_ck_pad|*}] 4
set_multicycle_path -setup -end -from [get_keepers {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*p0|*umemphy|hphy_inst~FF_*}] -to [get_keepers {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*p0|*lfifo~LFIFO_IN_READ_EN_FULL_DFF}] 2
set_multicycle_path -hold -end -from [get_keepers {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*p0|*umemphy|hphy_inst~FF_*}] -to [get_keepers {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*p0|*lfifo~LFIFO_IN_READ_EN_FULL_DFF}] 1
set_multicycle_path -setup -end -from [get_keepers {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*p0|*umemphy|hphy_inst~FF_*}] -to [get_keepers {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*p0|*altdq_dqs2_inst|*read_fifo~READ_ADDRESS_DFF}] 2
set_multicycle_path -hold -end -from [get_keepers {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*p0|*umemphy|hphy_inst~FF_*}] -to [get_keepers {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*p0|*altdq_dqs2_inst|*read_fifo~READ_ADDRESS_DFF}] 1


#**************************************************************
# Set Maximum Delay
#**************************************************************

set_max_delay -from [get_ports {HPS_DDR3_DQ[0]}] -to [get_keepers {{*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {HPS_DDR3_DQ[1]}] -to [get_keepers {{*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {HPS_DDR3_DQ[2]}] -to [get_keepers {{*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {HPS_DDR3_DQ[3]}] -to [get_keepers {{*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {HPS_DDR3_DQ[4]}] -to [get_keepers {{*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {HPS_DDR3_DQ[5]}] -to [get_keepers {{*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {HPS_DDR3_DQ[6]}] -to [get_keepers {{*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {HPS_DDR3_DQ[7]}] -to [get_keepers {{*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {HPS_DDR3_DQ[8]}] -to [get_keepers {{*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {HPS_DDR3_DQ[9]}] -to [get_keepers {{*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {HPS_DDR3_DQ[10]}] -to [get_keepers {{*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {HPS_DDR3_DQ[11]}] -to [get_keepers {{*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {HPS_DDR3_DQ[12]}] -to [get_keepers {{*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {HPS_DDR3_DQ[13]}] -to [get_keepers {{*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {HPS_DDR3_DQ[14]}] -to [get_keepers {{*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {HPS_DDR3_DQ[15]}] -to [get_keepers {{*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {HPS_DDR3_DQ[16]}] -to [get_keepers {{*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {HPS_DDR3_DQ[17]}] -to [get_keepers {{*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {HPS_DDR3_DQ[18]}] -to [get_keepers {{*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {HPS_DDR3_DQ[19]}] -to [get_keepers {{*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {HPS_DDR3_DQ[20]}] -to [get_keepers {{*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {HPS_DDR3_DQ[21]}] -to [get_keepers {{*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {HPS_DDR3_DQ[22]}] -to [get_keepers {{*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {HPS_DDR3_DQ[23]}] -to [get_keepers {{*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {HPS_DDR3_DQ[24]}] -to [get_keepers {{*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {HPS_DDR3_DQ[25]}] -to [get_keepers {{*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {HPS_DDR3_DQ[26]}] -to [get_keepers {{*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {HPS_DDR3_DQ[27]}] -to [get_keepers {{*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {HPS_DDR3_DQ[28]}] -to [get_keepers {{*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {HPS_DDR3_DQ[29]}] -to [get_keepers {{*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {HPS_DDR3_DQ[30]}] -to [get_keepers {{*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {HPS_DDR3_DQ[31]}] -to [get_keepers {{*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000


#**************************************************************
# Set Minimum Delay
#**************************************************************

set_min_delay -from [get_ports {HPS_DDR3_DQ[0]}] -to [get_keepers {{*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.250
set_min_delay -from [get_ports {HPS_DDR3_DQ[1]}] -to [get_keepers {{*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.250
set_min_delay -from [get_ports {HPS_DDR3_DQ[2]}] -to [get_keepers {{*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.250
set_min_delay -from [get_ports {HPS_DDR3_DQ[3]}] -to [get_keepers {{*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.250
set_min_delay -from [get_ports {HPS_DDR3_DQ[4]}] -to [get_keepers {{*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.250
set_min_delay -from [get_ports {HPS_DDR3_DQ[5]}] -to [get_keepers {{*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.250
set_min_delay -from [get_ports {HPS_DDR3_DQ[6]}] -to [get_keepers {{*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.250
set_min_delay -from [get_ports {HPS_DDR3_DQ[7]}] -to [get_keepers {{*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.250
set_min_delay -from [get_ports {HPS_DDR3_DQ[8]}] -to [get_keepers {{*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.250
set_min_delay -from [get_ports {HPS_DDR3_DQ[9]}] -to [get_keepers {{*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.250
set_min_delay -from [get_ports {HPS_DDR3_DQ[10]}] -to [get_keepers {{*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.250
set_min_delay -from [get_ports {HPS_DDR3_DQ[11]}] -to [get_keepers {{*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.250
set_min_delay -from [get_ports {HPS_DDR3_DQ[12]}] -to [get_keepers {{*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.250
set_min_delay -from [get_ports {HPS_DDR3_DQ[13]}] -to [get_keepers {{*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.250
set_min_delay -from [get_ports {HPS_DDR3_DQ[14]}] -to [get_keepers {{*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.250
set_min_delay -from [get_ports {HPS_DDR3_DQ[15]}] -to [get_keepers {{*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.250
set_min_delay -from [get_ports {HPS_DDR3_DQ[16]}] -to [get_keepers {{*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.250
set_min_delay -from [get_ports {HPS_DDR3_DQ[17]}] -to [get_keepers {{*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.250
set_min_delay -from [get_ports {HPS_DDR3_DQ[18]}] -to [get_keepers {{*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.250
set_min_delay -from [get_ports {HPS_DDR3_DQ[19]}] -to [get_keepers {{*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.250
set_min_delay -from [get_ports {HPS_DDR3_DQ[20]}] -to [get_keepers {{*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.250
set_min_delay -from [get_ports {HPS_DDR3_DQ[21]}] -to [get_keepers {{*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.250
set_min_delay -from [get_ports {HPS_DDR3_DQ[22]}] -to [get_keepers {{*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.250
set_min_delay -from [get_ports {HPS_DDR3_DQ[23]}] -to [get_keepers {{*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.250
set_min_delay -from [get_ports {HPS_DDR3_DQ[24]}] -to [get_keepers {{*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.250
set_min_delay -from [get_ports {HPS_DDR3_DQ[25]}] -to [get_keepers {{*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.250
set_min_delay -from [get_ports {HPS_DDR3_DQ[26]}] -to [get_keepers {{*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.250
set_min_delay -from [get_ports {HPS_DDR3_DQ[27]}] -to [get_keepers {{*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.250
set_min_delay -from [get_ports {HPS_DDR3_DQ[28]}] -to [get_keepers {{*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.250
set_min_delay -from [get_ports {HPS_DDR3_DQ[29]}] -to [get_keepers {{*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.250
set_min_delay -from [get_ports {HPS_DDR3_DQ[30]}] -to [get_keepers {{*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.250
set_min_delay -from [get_ports {HPS_DDR3_DQ[31]}] -to [get_keepers {{*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:The_System|*:arm_a9_hps|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.250


#**************************************************************
# Set Input Transition
#**************************************************************

