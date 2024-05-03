`timescale 1ns / 1ps

module tb_proc;

    // Inputs
    reg CLOCK_50;
    reg CLOCK_250;
    reg reset;

    NPU npu(
        .CLOCK_50(CLOCK_50),
        .CLOCK_250(CLOCK_250),
        .reset(reset)
    );

    initial begin
        CLOCK_50 = 0;
        forever #10 CLOCK_50 = ~CLOCK_50;
    end

    initial begin
        CLOCK_250 = 0;
        forever #2 CLOCK_250 = ~CLOCK_250;
    end

    initial begin
        // reset = 1;
        #50;
        reset = 0;
    end


endmodule

