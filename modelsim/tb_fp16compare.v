module float_compare_tb;

    // Parameters
    parameter DELAY = 10;

    // Inputs
    reg [15:0] a;
    reg [15:0] b;

    // Outputs
    wire [15:0] c;

    // Instantiate the float_compare module
    float_compare dut (
        .a(a),
        .b(b),
        .c(c)
    );

    // Stimulus
    initial begin
        // Test Case 1: a > b
        a = 16'h4099; // a = 2.0
        b = 16'h409E; // b = 1.0
        #DELAY;
        // Test Case 2: a < b
        a = 16'h5988; // a = 1.0
        b = 16'h5988; // b = 2.0
        #DELAY;
        // Test Case 3: a = b
        a = 16'hBF1E; // a = 2.0
        b = 16'hBF28; // b = 2.0
        #DELAY;
        // Add more test cases as needed...
        $finish;
    end

endmodule
