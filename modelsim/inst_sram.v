`timescale 1ns / 1ps

module M10K_inst_sram( 
    output reg [127:0] q,
    input [127:0] d,
    input [8:0] address,
    input we, clk
);
	 // force M10K ram style
    reg [127:0] mem [511:0]  /* synthesis ramstyle = "no_rw_check, M10K" */;

    integer i;
    initial begin
        for (i = 0; i <= 511; i = i + 1) begin
            mem[i] = 128'd0;
        end
        #500;
        mem[0] = 128'h100024000000220000002000002814a5;//10002020000022100000240800180c00;
        #500;
        mem[1] = 128'h80001800000000000000260000d06842;
    end
	 
    always @ (posedge clk) begin
        if (we) begin
            mem[address] <= d;
        end
        q <= mem[address]; // q doesn't get d in this clock cycle
    end
endmodule
