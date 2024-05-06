module element_process(clk, reset, a, b, out);
    parameter DATA_WIDTH = 16;

    input      signed  clk;
    input      signed  reset;
    input      signed  [DATA_WIDTH-1:0] a;
    input      signed  [DATA_WIDTH-1:0] b;
    output reg signed  [DATA_WIDTH-1:0] out;

    wire signed [DATA_WIDTH-1:0] mulResult;
    wire signed [DATA_WIDTH-1:0] addResult;

    signed_mult multiplication (a, b, mulResult);
    assign addResult = out + mulResult;
    
    always @(posedge clk) begin
        if (reset) begin
            out <= 0;
        end
        else begin
            out <= addResult;
        end
    end

endmodule