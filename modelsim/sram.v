module M10K_sram( 
    output reg [15:0] q,
    input [15:0] d,
    input [13:0] address,
    input we, clk
);
	 // force M10K ram style
    reg [15:0] mem [16384:0]  /* synthesis ramstyle = "no_rw_check, M10K" */;

    integer i;
    initial begin
        for (i = 0; i <= 16383; i = i + 1) begin
            // mem[i] = $random;
            mem[i] = i;
        end
    end
	 
    always @ (posedge clk) begin
        if (we) begin
            mem[address] <= d;
        end
        q <= mem[address]; // q doesn't get d in this clock cycle
    end
endmodule
