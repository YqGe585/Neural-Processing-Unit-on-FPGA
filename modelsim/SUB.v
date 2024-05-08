module matrix_subtraction(
    input clk,
    input reset,
    input start,
    output reg done,
    input wire [13:0] src1_start_address,
    input wire [13:0] src2_start_address,
    output reg [13:0] src1_address,
    input wire [15:0] src1_readdata,
    output wire [15:0] src1_writedata,
    output wire src1_write_en,
    output reg [13:0] src2_address,
    input wire [15:0] src2_readdata,
    output wire [15:0] src2_writedata,
    output wire src2_write_en,
    input wire [9:0] src1_row_size,
    input wire [9:0] src1_col_size,
    input wire [5:0] src2_row_size,
    input wire [5:0] src2_col_size,
    input wire [13:0] dest_start_address,
    output reg [13:0] dest_address,
    input wire [15:0] dest_readdata,
    output reg [15:0] dest_writedata,
    output reg dest_write_en
);
    reg [9:0] row_count;
    reg [9:0] col_count;
    
    assign src1_write_en = 0;
    assign src2_write_en = 0;
    assign src1_writedata = 0;
    assign src2_writedata = 0;

    reg [1:0] state = 2'd2;

    wire [15:0] sum;

    always @(posedge clk) begin
        if(reset) begin
            state <= 2'd2;
            row_count<=0;
            col_count<=0;
            src1_address<=src1_start_address;
            src2_address<=src2_start_address;
            dest_address<=dest_start_address;
            done<=1;
        end
        else begin
            case (state)
                2'd0: begin
                    src1_address<=src1_start_address;
                    src2_address<=src2_start_address;
                    dest_address<=dest_start_address-1;
                    state<=2'd1;
                end 
                2'd1: begin
                    if(row_count < src1_row_size-1) begin
                        src1_address <= src1_address + 1;
                        src2_address <= src2_address + 1;
                        row_count <= row_count+1;
                        dest_address <= dest_address + 1;
                        // dest_writedata <= src1_readdata + src2_readdata;
                        dest_writedata <= sum;
                        dest_write_en <= 1;
                    end
                    else if (col_count < src1_col_size-1) begin
                        src1_address <= src1_address + 1;
                        src2_address <= src2_address + 1;
                        col_count <= col_count+1;
                        row_count <= 0;
                        dest_address <= dest_address + 1;
                        dest_writedata <= sum;
                    end
                    else begin
                        dest_address<=dest_address + 1;
                        dest_writedata <= sum;
                        state <= 2'd2;
                    end
                end
                2'd2: begin
                    if(start == 1) begin
                        state <= 2'd0;
                        done <= 0;
                    end
                    else begin
                        dest_write_en <= 0;
                        row_count<=0;
                        col_count<=0;
                        src1_address<=src1_start_address;
                        src2_address<=src2_start_address;
                        dest_address<=dest_start_address;
                        done<=1;
                    end
                end
                default: begin
                    row_count<=0;
                    col_count<=0;
                    src1_address<=src1_start_address;
                    src2_address<=src2_start_address;
                    dest_address<=dest_start_address;
                    done<=1;
                end
            endcase
        end
    end

    floatAdd floatadd (
    .floatA(src1_readdata),
    .floatB({~src2_readdata[15],src2_readdata[14:0]}),
    .sum(sum)
);
endmodule