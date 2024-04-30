module demux1to16 #(
    parameter DATA_WIDTH = 12 
)(
    input wire[DATA_WIDTH-1:0] in, 
    input wire [3:0] sel, 
    output reg [DATA_WIDTH-1:0] out0,
    output reg [DATA_WIDTH-1:0] out1,
    output reg [DATA_WIDTH-1:0] out2,
    output reg [DATA_WIDTH-1:0] out3,
    output reg [DATA_WIDTH-1:0] out4,
    output reg [DATA_WIDTH-1:0] out5,
    output reg [DATA_WIDTH-1:0] out6,
    output reg [DATA_WIDTH-1:0] out7,
    output reg [DATA_WIDTH-1:0] out8,
    output reg [DATA_WIDTH-1:0] out9,
    output reg [DATA_WIDTH-1:0] out10,
    output reg [DATA_WIDTH-1:0] out11,
    output reg [DATA_WIDTH-1:0] out12,
    output reg [DATA_WIDTH-1:0] out13,
    output reg [DATA_WIDTH-1:0] out14,
    output reg [DATA_WIDTH-1:0] out15
);

always @(*) begin

    out0 = {DATA_WIDTH{1'b0}}; out1 = {DATA_WIDTH{1'b0}}; 
    out2 = {DATA_WIDTH{1'b0}}; out3 = {DATA_WIDTH{1'b0}};
    out4 = {DATA_WIDTH{1'b0}}; out5 = {DATA_WIDTH{1'b0}};
    out6 = {DATA_WIDTH{1'b0}}; out7 = {DATA_WIDTH{1'b0}};
    out8 = {DATA_WIDTH{1'b0}}; out9 = {DATA_WIDTH{1'b0}};
    out10 = {DATA_WIDTH{1'b0}}; out11 = {DATA_WIDTH{1'b0}};
    out12 = {DATA_WIDTH{1'b0}}; out13 = {DATA_WIDTH{1'b0}};
    out14 = {DATA_WIDTH{1'b0}}; out15 = {DATA_WIDTH{1'b0}};

    case (sel)
        4'd0: out0 = in;
        4'd1: out1 = in;
        4'd2: out2 = in;
        4'd3: out3 = in;
        4'd4: out4 = in;
        4'd5: out5 = in;
        4'd6: out6 = in;
        4'd7: out7 = in;
        4'd8: out8 = in;
        4'd9: out9 = in;
        4'd10: out10 = in;
        4'd11: out11 = in;
        4'd12: out12 = in;
        4'd13: out13 = in;
        4'd14: out14 = in;
        4'd15: out15 = in;
        default: begin
            out0 = {DATA_WIDTH{1'b0}}; out1 = {DATA_WIDTH{1'b0}}; 
            out2 = {DATA_WIDTH{1'b0}}; out3 = {DATA_WIDTH{1'b0}};
            out4 = {DATA_WIDTH{1'b0}}; out5 = {DATA_WIDTH{1'b0}};
            out6 = {DATA_WIDTH{1'b0}}; out7 = {DATA_WIDTH{1'b0}};
            out8 = {DATA_WIDTH{1'b0}}; out9 = {DATA_WIDTH{1'b0}};
            out10 = {DATA_WIDTH{1'b0}}; out11 = {DATA_WIDTH{1'b0}};
            out12 = {DATA_WIDTH{1'b0}}; out13 = {DATA_WIDTH{1'b0}};
            out14 = {DATA_WIDTH{1'b0}}; out15 = {DATA_WIDTH{1'b0}};
        end
    endcase
end

endmodule
