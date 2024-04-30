module signed_mult (out, a, b);
	output 	signed  [15:0]	out;
	input 	signed	[15:0] 	a;
	input 	signed	[15:0] 	b;
	wire 	signed	[31:0]	mult_out;
	assign mult_out = a * b;
	assign out = {mult_out[31], mult_out[28:14]};
endmodule