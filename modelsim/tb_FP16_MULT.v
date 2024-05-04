`timescale 1ns / 1ps

module tb_floatMuilt (); /* this is automatically generated */
	reg [15:0] floatA;
	reg [15:0] floatB;
	wire [15:0] product;

	floatMuilt inst_floatMuilt 
	(	.floatA(floatA), 
		.floatB(floatB), 
		.product(product)
	);

	initial begin
		floatA = 16'b0000000000000000; //0
		floatB = 16'b0000000000000000; //0
		#40;
		floatA = 16'b0100000000000000; //2
		floatB = 16'b0011100110011010; //0.7
		#40;
		floatA = 16'b0011010110011010; //0.35
		floatB = 16'b0011100011110110; //0.62
		#40;
		floatA = 16'b0011000001111011; //0.14
		floatB = 16'b0011101010100100; //0.83
		#40;
		$stop;
	end



endmodule
