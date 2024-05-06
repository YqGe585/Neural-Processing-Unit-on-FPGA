`timescale 1ns / 1ps

module tb_conv;

    reg clk;
    reg clk_300;
    reg reset;
    reg conv_start;
    wire conv_done;
    reg [13:0] conv_src1_start_address;
    reg [13:0] conv_src2_start_address;
    wire [13:0] conv_src1_address;
    wire [15:0] conv_src1_readdata;
    wire [15:0] conv_src2_readdata;
    wire [15:0] conv_src1_writedata;
    wire conv_src1_write_en;
    wire [13:0] conv_src2_address;
    wire [15:0] conv_src2_writedata;
    wire conv_src2_write_en;
    reg [15:0] conv_dest_readdata;
    wire [13:0] conv_dest_address;
    wire [15:0] conv_dest_writedata;
    wire conv_dest_write_en;
    reg [9:0] conv_src1_row_size;
    reg [9:0] conv_src1_col_size;
    reg [5:0] conv_src2_row_size;
    reg [5:0] conv_src2_col_size;
    reg [13:0] conv_dest_start_address;


    conv uut (
        .clk(clk),
        .reset(reset),
        .start(conv_start),
        .done(conv_done),
        .src1_start_address(conv_src1_start_address),
        .src2_start_address(conv_src2_start_address),
        .src1_address(conv_src1_address),
        .src1_readdata(conv_src1_readdata),
        .src1_writedata(conv_src1_writedata),
        .src1_write_en(conv_src1_write_en),
        .src2_address(conv_src2_address),
        .src2_readdata(conv_src2_readdata),
        .src2_writedata(conv_src2_writedata),
        .src2_write_en(conv_src2_write_en),
        .src1_row_size(conv_src1_row_size),
        .src1_col_size(conv_src1_col_size),
        .src2_row_size(conv_src2_row_size),
        .src2_col_size(conv_src2_col_size),
        .dest_start_address(conv_dest_start_address),
        .dest_address(conv_dest_address),
        .dest_readdata(),
        .dest_writedata(conv_dest_writedata),
        .dest_write_en(conv_dest_write_en)
    );

    M10K_sram src1(
        .clk(clk_300),
        .we(conv_src1_write_en),
        .q(conv_src1_readdata),
        .d(conv_src1_writedata),
        .address(conv_src1_address)
    );

    M10K_sram src2(
        .clk(clk_300),
        .we(conv_src2_write_en),
        .q(conv_src2_readdata),
        .d(conv_src2_writedata),
        .address(conv_src2_address)
    );

    M10K_sram dest(
        .clk(clk_300),
        .we(conv_dest_write_en),
        .q(),
        .d(conv_dest_writedata),
        .address(conv_dest_address)
    );

    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end

    initial begin
        clk_300 = 0;
        forever #2 clk_300 = ~clk_300;
    end

    initial begin
        reset = 1;
        conv_start = 0;
        conv_src1_start_address = 0;
        conv_src2_start_address = 0;
        conv_src1_row_size = 28; 
        conv_src1_col_size = 28;
        conv_src2_row_size = 3;
        conv_src2_col_size = 3;
        conv_dest_start_address = 0;


        #10;
        reset = 1;
        #10;
        reset = 0;


        #20;
        conv_start = 1;
        #10;
        conv_start = 0;

    end

endmodule
