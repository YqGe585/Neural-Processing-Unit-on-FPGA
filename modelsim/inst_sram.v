module M10K_inst_sram( 
    output reg [127:0] q,
    input [127:0] d,
    input [8:0] address,
    input we, clk
);
	 // force M10K ram style
    reg [127:0] mem [511:0]  /* synthesis ramstyle = "no_rw_check, M10K" */;

    // integer i;
    // initial begin
    //     for (i = 0; i <= 511; i = i + 1) begin
    //         mem[i] = $random;
    //     end
    // end
    integer i;
    initial begin
        for (i = 0; i <= 511; i = i + 1) begin
            mem[i] = 128'd0;
        end
        mem[0] = 128'h10002020000022100000240800180c00;
    end
	 
    always @ (posedge clk) begin
        if (we) begin
            mem[address] <= d;
        end
        q <= mem[address]; // q doesn't get d in this clock cycle
    end
endmodule