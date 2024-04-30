module matrix_dot(
    input clk,
    input reset,
    input start,
    output reg done,
    input [11:0] src1_start_address,
    input [11:0] src2_start_address,
    output reg [11:0] src1_address,
    input [15:0] src1_readdata,
    output reg [11:0] src2_address,
    input [15:0] src2_readdata,
    input [5:0] src1_row_size,
    input [5:0] src1_col_size,
    input [5:0] src2_row_size,
    input [5:0] src2_col_size,
    input [11:0] dest_start_address,
    output reg [11:0] dest_address,
    output reg [15:0] dest_writedata,
    output reg dest_write_en
);

    reg [5:0] i, j, k;
    reg [15:0] sum;
    reg calculating;

    always @(posedge clk) begin
        if (reset) begin
            done <= 0;
            dest_write_en <= 0;
            i <= 0;
            j <= 0;
            k <= 0;
            sum <= 0;
            calculating <= 0;
        end else if (start && !calculating) begin
            // Start the matrix multiplication process
            calculating <= 1;
            i <= 0;
            j <= 0;
            k <= 0;
            sum <= 0;
        end else if (calculating) begin
            if (i < src1_row_size && j < src2_col_size) begin
                if (k < src1_col_size) begin
                    // Calculate addresses for source matrices
                    src1_address <= src1_start_address + (i * src1_col_size + k);
                    src2_address <= src2_start_address + (k * src2_col_size + j);
                    sum <= sum + src1_readdata * src2_readdata;
                    k <= k + 1;
                end else begin
                    // Write the result to the destination matrix
                    dest_address <= dest_start_address + (i * src2_col_size + j);
                    dest_writedata <= sum;
                    dest_write_en <= 1;
                    sum <= 0;
                    k <= 0;
                    j <= j + 1;
                    if (j == src2_col_size) begin
                        j <= 0;
                        i <= i + 1;
                    end
                end
            end else begin
                done <= 1;
                calculating <= 0;
            end
        end
    end
endmodule
