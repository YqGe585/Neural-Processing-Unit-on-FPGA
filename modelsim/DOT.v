module matrix_dot(
    input clk,
    input reset,
    input start,
    output reg done,
    input wire [13:0] src1_start_address,
    input wire [13:0] src2_start_address,
    output reg [13:0] src1_address,
    input wire [15:0] src1_readdata,
    output wire src1_write_en,
    output reg [13:0] src2_address,
    input wire [15:0] src2_readdata,
    output wire src2_write_en,
    input wire [11:0] src1_row_size,
    input wire [7:0] src1_col_size,
    input wire [7:0] src2_row_size,
    input wire [5:0] src2_col_size,
    input wire [13:0] dest_start_address,
    output reg [13:0] dest_address,
    output wire [15:0] dest_writedata,
    output reg dest_write_en
);

    // States
    localparam IDLE = 0,
               CALC = 1,
               WRITE = 2,
               DONE = 3;

    // State register
    reg [2:0] state, next_state;

    assign src1_write_en = 0;
    assign src2_write_en = 0;

    // Intermediate data and address registers
    wire [15:0] product;
    reg [12:0] i, j, k;
    reg [15:0] sum;

    assign dest_writedata = sum;
    // State machine transitions
    always @(posedge clk, posedge reset) begin
        if (reset) begin
            state <= IDLE;
        end else begin
            state <= next_state;
        end
    end

    always @(*) begin
        case(state)
            IDLE: begin
                if (start) begin
                    next_state = CALC;
                    done = 0;
                end
                else begin
                    next_state = IDLE;
                    done = 1;
                end
            end
            CALC: begin
                done = 0;
                if  ( j == src1_row_size-1) begin
                    next_state = WRITE;
                end
                else begin
                    next_state = CALC;
                end
            end
            WRITE: begin
                done = 0;
                if  (k == src1_col_size)  begin // counter k indicate done.
                    next_state = DONE;
                end
                else begin
                    next_state = CALC;
                end
            end
            DONE: begin
                next_state = IDLE;
                done = 1;
            end
            default: begin
                next_state = IDLE;
                done = 1;
            end

        endcase
    end

    always @(posedge clk) begin
        case(state)
            IDLE: begin
                dest_write_en <= 0;
                i <= 1;
                j <= 0;
                sum <= 0;
                src1_address <= src1_start_address;
                src2_address <= src2_start_address;
                dest_address <= dest_start_address;
                k<=0;
            end
            CALC: begin
                if(j<src1_row_size-1) begin // next element
                    src1_address <= src1_address + 1;
                    src2_address <= src2_address + src2_row_size;
                end
                sum <= sum + product;
                j<=j+1;
                if(j==src1_row_size-1) begin // write in the next cycle
                    dest_write_en <= 1;
                end
                else begin
                    dest_write_en <= 0;
                end

                if  (( i == src2_row_size ) && ( j == src1_row_size-1))  begin // counter increment
                    k <= k+1;
                end
            end
            WRITE: begin
                if(i == src2_row_size) begin
                    src2_address <= src2_start_address; // reset src2_address
                end
                else begin
                    src2_address <= src2_start_address+i;
                end
                

                if(i == src2_row_size) begin 
                    src1_address <= src1_address + 1;
                end
                else begin
                    src1_address <= src1_address - src1_row_size + 1; // reset src1_address
                end

                if(i < src2_row_size ) begin
                    i<=i+1;
                end
                else begin
                    i<=1;
                end

                dest_address <= dest_address + 1; // dest_address increment
                sum <= 0;
                j<=0;
                dest_write_en <= 0;
            end
            DONE: begin
                k<=0;
                i<=0;
                j<=0;
                dest_address <= dest_start_address;
                src1_address <= src1_start_address;
                src2_address <= src2_start_address;
                dest_write_en <= 0;
            end
        endcase
    end

    signed_mult mul(
        .a(src1_readdata),
        .b(src2_readdata),
        .out(product)
    );

endmodule
