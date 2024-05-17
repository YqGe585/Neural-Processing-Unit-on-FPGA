module floatMult 
(
	input wire [15:0] floatA,
	input wire [15:0] floatB,
	output reg [15:0] product
);

reg sign; 
reg signed [5:0] exponent; 
reg [9:0] mantissa;
reg [10:0] fractionA, fractionB;	
reg [21:0] fraction;


always @ (floatA or floatB) 
begin
	if (floatA == 0 || floatB == 0)  // have 0
		product = 0;				//  output 0 
	else 
	begin
		sign = floatA[15] ^ floatB[15]; // sign bit
		exponent = floatA[14:10] + floatB[14:10] - 5'd15 + 5'd2; 
	
		fractionA = {1'b1,floatA[9:0]}; 
		fractionB = {1'b1,floatB[9:0]}; 
		fraction = fractionA * fractionB; 
		
		if (fraction[21] == 1'b1) 
		begin
			fraction = fraction << 1;
			exponent = exponent - 1; 
		end 
		else if (fraction[20] == 1'b1) 
		begin
			fraction = fraction << 2;
			exponent = exponent - 2;
		end 
		else if (fraction[19] == 1'b1) 
		begin
			fraction = fraction << 3;
			exponent = exponent - 3;
		end 
		else if (fraction[18] == 1'b1) 
		begin
			fraction = fraction << 4;
			exponent = exponent - 4;
		end 
		else if (fraction[17] == 1'b1) 
		begin
			fraction = fraction << 5;
			exponent = exponent - 5;
		end 
		else if (fraction[16] == 1'b1) 
		begin
			fraction = fraction << 6;
			exponent = exponent - 6;
		end 
		else if (fraction[15] == 1'b1) 
		begin
			fraction = fraction << 7;
			exponent = exponent - 7;
		end 
		else if (fraction[14] == 1'b1) 
		begin
			fraction = fraction << 8;
			exponent = exponent - 8;
		end 
		else if (fraction[13] == 1'b1) 
		begin
			fraction = fraction << 9;
			exponent = exponent - 9;
		end 
		else if (fraction[12] == 1'b0) 
		begin
			fraction = fraction << 10;
			exponent = exponent - 10;
		end 
		// FP16 format
		mantissa = fraction[21:12];
		if(exponent[5]==1'b1) begin 
			product=16'b0000000000000000;
		end
		else begin
			product = {sign,exponent[4:0],mantissa};
		end
	end
end
endmodule