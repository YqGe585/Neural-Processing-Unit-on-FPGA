`timescale 1ns / 1ps

module tb_proc;

    // Inputs
    reg CLOCK_25;
    reg CLOCK_100;
    reg CLOCK_250;
    reg reset;

    NPU npu(
        .CLOCK_25(CLOCK_25),
        .CLOCK_100(CLOCK_100),
        .CLOCK_250(CLOCK_250),
        .reset(reset)
    );

    initial begin
        CLOCK_25 = 0;
        forever #40 CLOCK_25 = ~CLOCK_25;
    end

    initial begin
        CLOCK_100 = 0;
        forever #10 CLOCK_100 = ~CLOCK_100;
    end

    initial begin
        CLOCK_250 = 0;
        forever #4 CLOCK_250 = ~CLOCK_250;
    end

    initial begin
        reset = 0;
        #50;
        reset = 1;
        #50;
        reset = 0;
    end


endmodule

