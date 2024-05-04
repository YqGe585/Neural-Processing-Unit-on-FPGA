module M10K_ROB( 
    output reg [3:0] q,
    input [3:0] d,
    input [8:0] address,
    input we, clk
);
	 // force M10K ram style
    reg [3:0] mem [511:0]  /* synthesis ramstyle = "no_rw_check, M10K" */;

    integer i;
    initial begin
        for (i = 0; i <= 511; i = i + 1) begin
            mem[i] = 4'd0;
        end
    end
	 
    always @ (posedge clk) begin
        if (we) begin
            mem[address] <= d;
        end
        q <= mem[address]; // q doesn't get d in this clock cycle
    end
endmodule
