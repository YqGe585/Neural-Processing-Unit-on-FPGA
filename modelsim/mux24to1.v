module mux24to1 #(
    parameter DATA_WIDTH = 12
)(
    input wire [DATA_WIDTH-1:0] in0,
    input wire [DATA_WIDTH-1:0] in1,
    input wire [DATA_WIDTH-1:0] in2,
    input wire [DATA_WIDTH-1:0] in3,
    input wire [DATA_WIDTH-1:0] in4,
    input wire [DATA_WIDTH-1:0] in5,
    input wire [DATA_WIDTH-1:0] in6,
    input wire [DATA_WIDTH-1:0] in7,
    input wire [DATA_WIDTH-1:0] in8,
    input wire [DATA_WIDTH-1:0] in9,
    input wire [DATA_WIDTH-1:0] in10,
    input wire [DATA_WIDTH-1:0] in11,
    input wire [DATA_WIDTH-1:0] in12,
    input wire [DATA_WIDTH-1:0] in13,
    input wire [DATA_WIDTH-1:0] in14,
    input wire [DATA_WIDTH-1:0] in15,
    input wire [DATA_WIDTH-1:0] in16,
    input wire [DATA_WIDTH-1:0] in17,
    input wire [DATA_WIDTH-1:0] in18,
    input wire [DATA_WIDTH-1:0] in19,
    input wire [DATA_WIDTH-1:0] in20,
    input wire [DATA_WIDTH-1:0] in21,
    input wire [DATA_WIDTH-1:0] in22,
    input wire [DATA_WIDTH-1:0] in23,
    input wire [4:0] sel,
    output reg [DATA_WIDTH-1:0] out,
	 input wire reset
);

always @(*) begin
    if(reset) begin
        out = {DATA_WIDTH{1'b0}};
    end
    else begin
        case (sel)
            5'd0:  out = in0;
            5'd1:  out = in1;
            5'd2:  out = in2;
            5'd3:  out = in3;
            5'd4:  out = in4;
            5'd5:  out = in5;
            5'd6:  out = in6;
            5'd7:  out = in7;
            5'd8:  out = in8;
            5'd9:  out = in9;
            5'd10: out = in10;
            5'd11: out = in11;
            5'd12: out = in12;
            5'd13: out = in13;
            5'd14: out = in14;
            5'd15: out = in15;
            5'd16: out = in16;
            5'd17: out = in17;
            5'd18: out = in18;
            5'd19: out = in19;
            5'd20: out = in20;
            5'd21: out = in21;
            5'd22: out = in22;
            5'd23: out = in23;
            5'd31: out = {DATA_WIDTH{1'b0}};
            default: out = {DATA_WIDTH{1'b0}};
        endcase
    end
end

endmodule