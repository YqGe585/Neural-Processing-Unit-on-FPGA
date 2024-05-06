`timescale 1ns / 1ps

module tb_floatAdd;

reg [15:0] floatA, floatB;
wire [15:0] sum;

// Instantiate the floatAdd module
floatAdd uut (
    .floatA(floatA),
    .floatB(floatB),
    .sum(sum)
);

initial begin
    // Initialize inputs
    floatA = 0; floatB = 0;
    #10; // wait 10ns for simulation purposes
    
    // Test case 1: Add zero to a small number
    floatA = 16'h3f00; 
    floatB = 16'h4200; 
    #10;

    // Test case 2: Add two positive numbers of different magnitudes
    floatA = 16'h5b80; // 1.75 in FP16
    floatB = 16'h5b80; // 3.0 in FP16
    #10;

    // Test case 3: Add two large numbers potentially causing an overflow
    floatA = 16'h3266; // 240.0 in FP16
    floatB = 16'hcc13; // 240.0 in FP16
    #10;

    // Test case 4: Add a small positive and a large negative number
    floatA = 16'h30cd; // 0.2 in FP16
    floatB = 16'h3266; // -16.0 in FP16
    #10;

    // Test case 5: Add two small numbers for precision check
    floatA = 16'h40ae; // 0.15 in FP16
    floatB = 16'hc0a4; // 0.2 in FP16
    #10;

    // New Test case 6: Adding a positive number and a negative number resulting in a positive number
    floatA = 16'h45c5; // 2.25 in FP16
    floatB = 16'hc5cd; // -0.75 in FP16
    #10;

    // New Test case 7: Adding a positive number and a negative number resulting in a negative number
    floatA = 16'b0011100000000000; // 0.5 in FP16
    floatB = 16'b1100010000000000; // -2.5 in FP16
    #10;

    $finish; // Terminate simulation
end

initial begin
    $monitor("At time %t, floatA = %b (%h), floatB = %b (%h), sum = %b (%h)",
             $time, floatA, floatA, floatB, floatB, sum, sum);
end

endmodule
