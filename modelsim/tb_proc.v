`timescale 1ns / 1ps

module tb_proc;

    // Inputs
    reg CLOCK_50;
    reg CLOCK_300;
    reg reset;

    NPU npu(
        .CLOCK_50(CLOCK_50),
        .CLOCK_300(CLOCK_300),
        .reset(reset)
    );

    initial begin
        CLOCK_50 = 0;
        forever #60 CLOCK_50 = ~CLOCK_50;
    end

    initial begin
        CLOCK_300 = 0;
        forever #10 CLOCK_300 = ~CLOCK_300;
    end

    initial begin
        reset = 1;
        #600;
        reset = 0;
    end


endmodule

