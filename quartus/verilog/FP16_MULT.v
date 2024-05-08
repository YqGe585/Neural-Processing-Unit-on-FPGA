module floatMult 
(
	input wire [15:0] floatA,
	input wire [15:0] floatB,
	output reg [15:0] product
);

reg sign; // 输出的正负标志位
reg signed [5:0] exponent; // 输出数据的指数，因为有正负所以选择有符号数
reg [9:0] mantissa; // 输出数据的小数
reg [10:0] fractionA, fractionB;	//fraction = {1,mantissa} // 计算二进制数据最高位补1
reg [21:0] fraction; // 相乘结果参数


always @ (floatA or floatB) 
begin
	if (floatA == 0 || floatB == 0)  // 处理乘数有一个或者两个均为0的情况
		product = 0;				//  输出为0
	else 
	begin
		sign = floatA[15] ^ floatB[15]; // 异或门判断输出的计算正负
		exponent = floatA[14:10] + floatB[14:10] - 5'd15 + 5'd2; // 由于借位给fractionA和fractionB需要先补齐两位指数
	
		fractionA = {1'b1,floatA[9:0]}; //借位给fractionA
		fractionB = {1'b1,floatB[9:0]}; //借位给fractionB
		fraction = fractionA * fractionB; //计算二进制乘法
		// 找到第一个不为0的数字并对指数进行匹配处理
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
		// 按照半精度浮点数的格式输出
		mantissa = fraction[21:12];
		if(exponent[5]==1'b1) begin //太小了输出全0(精度问题)
			product=16'b0000000000000000;
		end
		else begin
			product = {sign,exponent[4:0],mantissa}; //拼接输出数据
		end
	end
end
endmodule