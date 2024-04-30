// (C) 2001-2015 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License Subscription 
// Agreement, Altera MegaCore Function License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


// THIS FILE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
// THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
// FROM, OUT OF OR IN CONNECTION WITH THIS FILE OR THE USE OR OTHER DEALINGS
// IN THIS FILE.

/******************************************************************************
 *                                                                            *
 * This module contains a character map for 128 different characters.         *
 *                                                                            *
 ******************************************************************************/

module altera_up_video_128_character_rom (
	// Inputs
	clk,
	clk_en,

	character,
	x_coordinate,
	y_coordinate,
	
	// Bidirectionals

	// Outputs
	character_data
);


/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/


/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
// Inputs
input						clk;
input						clk_en;

input			[ 6: 0]	character;
input			[ 2: 0]	x_coordinate;
input			[ 2: 0]	y_coordinate;

// Bidirectionals

// Outputs
output					character_data;

/*****************************************************************************
 *                           Constant Declarations                           *
 *****************************************************************************/

/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/
// Internal Wires
wire			[12: 0]	character_address;

// Internal Registers

// State Machine Registers

/*****************************************************************************
 *                         Finite State Machine(s)                           *
 *****************************************************************************/


/*****************************************************************************
 *                             Sequential Logic                              *
 *****************************************************************************/


/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/

assign character_address = {character, y_coordinate, x_coordinate};

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/

altsyncram	character_data_rom (
	// Inputs
	.clock0				(clk),
	.clocken0			(clk_en),

	.address_a			(character_address),

	// Bidirectionals

	// Outputs
	.q_a					(character_data),
	
	// Unused 
	.aclr0				(1'b0),
	.aclr1				(1'b0),
	.q_b					(),
	.clocken1			(1'b1),
	.data_b				(1'b1),
	.wren_a				(1'b0),
	.data_a				(1'b1),
	.rden_b				(1'b1),
	.address_b			(1'b1),
	.wren_b				(1'b0),
	.byteena_b			(1'b1),
	.addressstall_a	(1'b0),
	.byteena_a			(1'b1),
	.addressstall_b	(1'b0),
	.clock1				(1'b1)
);
defparam
	character_data_rom.clock_enable_input_a 					= "NORMAL",
	character_data_rom.clock_enable_output_a	 				= "NORMAL",
	character_data_rom.init_file 									= "altera_up_video_char_mode_rom_128.mif",
	character_data_rom.intended_device_family 				= "Cyclone II",
	character_data_rom.lpm_hint 									= "ENABLE_RUNTIME_MOD=NO",
	character_data_rom.lpm_type			 						= "altsyncram",
	character_data_rom.numwords_a						 			= 8192,
	character_data_rom.operation_mode	 						= "ROM",
	character_data_rom.outdata_aclr_a 							= "NONE",
	character_data_rom.outdata_reg_a 							= "CLOCK0",
	character_data_rom.power_up_uninitialized 				= "FALSE",
	character_data_rom.read_during_write_mode_mixed_ports = "DONT_CARE",
	character_data_rom.widthad_a 									= 13,
	character_data_rom.width_a 									= 1,
	character_data_rom.width_byteena_a							= 1;
	
endmodule
