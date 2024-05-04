`timescale 1ns / 1ps

module matrix_dot_tb();

    // Input signals
    reg clk;
    reg clk_300;
    reg dot_reset;
    reg dot_start;
    reg [11:0] dot_src1_start_address;
    reg [11:0] dot_src2_start_address;
    wire [15:0] dot_src1_readdata;
    wire [15:0] dot_src2_readdata;
    reg [5:0] dot_src1_row_size;
    reg [5:0] dot_src1_col_size;
    reg [5:0] dot_src2_row_size;
    reg [5:0] dot_src2_col_size;
    reg [11:0] dot_dest_start_address;

    // Output signals
    wire dot_done;
    wire [11:0] dot_src1_address;
    wire [11:0] dot_src2_address;
    wire [11:0] dot_dest_address;
    wire [15:0] dot_dest_writedata;
    wire dot_dest_write_en;

    // Instantiate the Unit Under Test (UUT)
    matrix_dot uut(
        .clk(clk),
        .reset(dot_reset),
        .start(dot_start),
        .done(dot_done),
        .src1_start_address(dot_src1_start_address),
        .src2_start_address(dot_src2_start_address),
        .src1_address(dot_src1_address),
        .src1_readdata(dot_src1_readdata),
        .src2_address(dot_src2_address),
        .src2_readdata(dot_src2_readdata),
        .src1_row_size(dot_src1_row_size),
        .src1_col_size(dot_src1_col_size),
        .src2_row_size(dot_src2_row_size),
        .src2_col_size(dot_src2_col_size),
        .dest_start_address(dot_dest_start_address),
        .dest_address(dot_dest_address),
        .dest_writedata(dot_dest_writedata),
        .dest_write_en(dot_dest_write_en)
    );

    M10K_sram src1(
        .clk(clk_300),
        .we(dot_src1_write_en),
        .q(dot_src1_readdata),
        .d(dot_src1_write_data),
        .address(dot_src1_address)
    );

    M10K_sram src2(
        .clk(clk_300),
        .we(dot_src2_write_en),
        .q(dot_src2_readdata),
        .d(dot_src2_write_data),
        .address(dot_src2_address)
    );

    M10K_sram dest(
        .clk(clk_300),
        .we(dot_dest_write_en),
        .q(),
        .d(dot_dest_writedata),
        .address(dot_dest_address)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #10 clk = ~clk;  // 50MHz clock
    end

    initial begin
        clk_300 = 0;
        forever #2 clk_300 = ~clk_300;  // 300MHz clock
    end

    // Initial Setup
    initial begin
        // Initialize Inputs
        dot_reset = 1;
        dot_start = 0;
        dot_src1_start_address = 0;
        dot_src2_start_address = 0;
        dot_src1_row_size = 3;
        dot_src1_col_size = 2;
        dot_src2_row_size = 2;
        dot_src2_col_size = 3;
        dot_dest_start_address = 12'h0;

        // Wait for global reset
        #100;
        dot_reset = 0;
        #20;
        dot_start = 1;
        #10;
        dot_start = 0;

        // Complete
        #500;
        $finish;
    end

endmodule
