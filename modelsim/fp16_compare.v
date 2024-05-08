module float_compare (
    input  [15 : 0] a,
    input  [15 : 0] b,
    output [15 : 0] c
);
    wire            a_sign  = a[15];
    wire   [4 : 0]  a_exponent = a[14 : 10];
    wire   [9 : 0]  a_mantissa  = a[9 : 0];
    wire            b_sign  = b[15];
    wire   [7 : 0]  b_exponent = b[14 : 10];
    wire   [9 : 0]  b_mantissa  = b[9 : 0];
    
    wire            a_e_b = ~(| (a[15 : 0] ^ b[15 : 0]));
    wire            a_sign_l_b_sign = (~a_sign) & b_sign;
    wire            a_sign_e_b_sign = ~(a_sign ^ b_sign);
    wire            a_exponent_g_b_exponent = a_exponent > b_exponent ? 1 : 0;
    wire            a_exponent_l_b_exponent = a_exponent < b_exponent ? 1 : 0;
    wire            a_exponent_e_b_exponent = ~(| (a_exponent ^ b_exponent));
    wire            a_mantissa_g_b_mantissa = a_mantissa > b_mantissa ? 1 : 0;
    wire            a_mantissa_l_b_mantissa = a_mantissa < b_mantissa ? 1 : 0;
    
    wire            condition1 = a_e_b;
    //wire            condition2 = ~a_e_b & a_sign_g_b_sign;
    wire            condition3 = ~a_e_b & a_sign_l_b_sign;
    wire            condition4 = ~a_e_b & a_sign_e_b_sign & (~a_sign) & a_exponent_g_b_exponent;
    //wire            condition5 = ~a_e_b & a_sign_e_b_sign & (~a_sign) & a_exponent_l_b_exponent;
    wire            condition6 = ~a_e_b & a_sign_e_b_sign & (~a_sign) & a_exponent_e_b_exponent & a_mantissa_g_b_mantissa;
    //wire            condition7 = ~a_e_b & a_sign_e_b_sign & (~a_sign) & a_exponent_e_b_exponent & a_mantissa_l_b_mantissa;
    //wire            condition8 = ~a_e_b & a_sign_e_b_sign & (a_sign) & a_exponent_g_b_exponent;                           
    wire            condition9 = ~a_e_b & a_sign_e_b_sign & (a_sign) & a_exponent_l_b_exponent;                           
    //wire            condition10= ~a_e_b & a_sign_e_b_sign & (a_sign) & a_exponent_e_b_exponent & a_mantissa_g_b_mantissa;         
    wire            condition11= ~a_e_b & a_sign_e_b_sign & (a_sign) & a_exponent_e_b_exponent & a_mantissa_l_b_mantissa;         
    
    assign c = (condition1 | condition3 | condition4 | condition6 | condition9 | condition11) ? a : b;
endmodule
