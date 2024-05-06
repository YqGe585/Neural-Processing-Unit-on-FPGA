module conv_unit(
    input clk,
    input reset,
    input start,
    output wire done,
    input  wire [13:0] src1_start_address,
    input  wire [13:0] src2_start_address,
    output reg [13:0] src1_address,
    input  wire [15:0] src1_readdata,
    output reg [15:0] src1_writedata,
    output reg        src1_write_en,
    output reg [13:0] src2_address,
    input  wire [15:0] src2_readdata,
    output reg [15:0] src2_writedata,
    output reg        src2_write_en,
    input  wire [9:0]  src1_row_size,
    input  wire [9:0]  src1_col_size,
    input  wire [5:0]  src2_row_size,
    input  wire [5:0]  src2_col_size,
    input  wire [13:0] dest_start_address,
    output reg [13:0] dest_address,
    output reg [15:0] dest_writedata,
    input  wire [15:0] dest_readdata,
    output reg        dest_write_en
);
    reg  [2:0]  state;
    reg  [2:0]  internal_state;
    reg [15:0]  imag_data, weight1, weight2, weight3;
    wire [15:0]  operand_output[2:0];
    reg [15:0]  kernel_output[2:0];
    reg  [3:0]  conv_counter;
    reg  [4:0]  kernel_counter;
    reg  [1:0]  store_counter;
    reg  [9:0]  imag_counter;
    reg [15:0]  kernel1 [8:0];
    reg [15:0]  kernel2 [8:0];
    reg [15:0]  kernel3 [8:0];
    reg         internal_reset1, internal_reset2, internal_reset3;

    element_process processUnit1 (clk, internal_reset1, imag_data, weight1, operand_output[0]);
    element_process processUnit2 (clk, internal_reset2, imag_data, weight2, operand_output[1]);
    element_process processUnit3 (clk, internal_reset3, imag_data, weight3, operand_output[2]);

    /*  state
        0: initial state
        1: get the weight from the kernel sram
        2: calculate the first conv unit
        3: calculate the rest conv units
        4: done
    */

    /*  internal_state
        0: blank, help to advance the clocks
        1: calculate the first two pixels in each line of conv unit
        2: calcute the last pixel in each line of conv unit
        3: calcute the last pixel in conv unit
        4: get the kernel results
        5: store the result in the destination sram
    */

    // state transit for internal state
    always @(posedge clk) begin
        if (reset) begin
            internal_state <= 0;
        end
        // else if (internal_state == 0 && (state == 2 || state == 3) ) begin
        //     internal_state <= 1;
        // end
        else if (internal_state == 0 && ( (state == 1 && kernel_counter == (src1_row_size-2)) || (state == 2 || state == 3) ) )begin
            internal_state <= 1;
        end
        else if (internal_state == 1 && conv_counter == 6) begin
            internal_state <= 3;
        end
        else if ( (conv_counter+3) % 3 == 0 && internal_state == 1 ) begin
            internal_state <= 2;
        end
        else if (internal_state == 2 && conv_counter != 7) begin
            internal_state <= 1;
        end
        else if (internal_state == 3) begin
            internal_state <= 4;
        end
        else if (internal_state == 4) begin
            internal_state <= 5;
        end
        else if (internal_state == 5 && store_counter == 2) begin
            internal_state <= 0;
        end
        else begin
            internal_state <= internal_state;
        end
    end

    // state transit for state
    always @(posedge clk) begin
        if (reset) begin
            state <= 0;
        end
        else if (start) begin
            if (state == 0) begin
                state <= 1;
            end 
        end
        else if (state == 1 && kernel_counter == (src1_row_size-2)) begin
            state <= 2;
        end
        else if (state == 2 && internal_state == 5 && store_counter == 2) begin
            state <= 3;
        end
        else if (state == 3 && imag_counter == (src1_row_size-2)*(src1_row_size-2)-1 && internal_state == 0 && store_counter == 3) begin
            state <= 4;
        end
        else begin
            state <= state;
        end
    end 


    always @(posedge clk) begin
        if (reset) begin
            conv_counter <= 0;
            imag_counter <= 0;
            internal_reset1 <= 1;
            internal_reset2 <= 1;
            internal_reset3 <= 1;
            dest_write_en <= 0;
            store_counter <= 0;
        end
        // else if (start) begin
        //     internal_reset1 <= 1;
        //     internal_reset2 <= 1;
        //     internal_reset3 <= 1;
        // end
        else begin
            if ((state == 1 && kernel_counter == 25)) begin
                src1_address <= src1_start_address;
                internal_reset1 <= 0;
                internal_reset2 <= 0;
                internal_reset3 <= 0;
                dest_write_en <= 0;
                store_counter <= 0;
            end
            else if ((state == 1 && kernel_counter == (src1_row_size-2))) begin
                src1_address <= src1_address + 1;
            end
            else if (state == 2 || state == 3) begin
                case (internal_state)
                    0: begin // help advance the clocks
                        internal_reset1 <= 0;
                        internal_reset2 <= 0;
                        internal_reset3 <= 0;
                        dest_write_en <= 0;
                        store_counter <= 0;
                        src1_address <= src1_address + 1;
                        // if ((state == 1 && kernel_counter == 26)) begin
                        //     src1_address <= src1_start_address;
                        // end
                        if (store_counter == 3) begin
                            imag_counter <= imag_counter + 1;
                        end
                    end
                    1: begin // calculate the first two pixels in each line of conv unit
                        src1_address <= src1_address + 1;
                        conv_counter <= conv_counter + 1;
                    end
                    2: begin // calcute the last pixel in each line of conv unit
                        src1_address <= src1_address + src1_col_size - 2;
                        conv_counter <= conv_counter + 1;
                    end
                    3: begin // calcute the last pixel in conv unit
                        src1_address <= src1_address - (src1_col_size*2) + 1; 
                        conv_counter <= conv_counter + 1;
                        // imag_counter <= imag_counter + 1;
                        // dest_write_en <= 1;
                        internal_reset1 <= 1;
                        internal_reset2 <= 1;
                        internal_reset3 <= 1;
                        // if (state == 2) begin
                        //     dest_address <= dest_start_address;
                        // end
                        // else if (state == 3) begin
                        //     dest_address <= dest_address + 1;
                        // end
                        // dest_writedata <= operand_output[store_counter];
                    end
                    4: begin 
                        conv_counter <= 0;
                        // imag_counter <= imag_counter + 1;
                        dest_writedata <= operand_output[store_counter];
                        dest_write_en <= 1;
                        if (state == 2) begin
                            dest_address <= dest_start_address;
                        end
                        else if (state == 3) begin
                            dest_address <= dest_address - 2*(src1_row_size-2)*(src1_row_size-2)+1;
                        end
                        kernel_output[0] <= operand_output[0];
                        kernel_output[1] <= operand_output[1];
                        kernel_output[2] <= operand_output[2];
                        store_counter <= store_counter + 1;
                    end
                    5: begin  // start writing results into the destination sram
                        dest_writedata <= kernel_output[store_counter];
                        dest_address <= dest_address + (src1_row_size-2)*(src1_row_size-2);
                        store_counter <= store_counter + 1;
                        // if (store_counter == 3) begin
                        //     imag_counter <= imag_counter + 1;
                        // end
                    end
                endcase
            end
        end
    end

    always @(posedge clk) begin
        if (reset) begin
            kernel_counter <= 0;
        end
        case(state)
            0: begin
                src2_address <= src2_start_address;
            end
            1: begin
                src2_address <= src2_address + 1;
                kernel_counter <= kernel_counter + 1;
                if (kernel_counter < 9) begin 
                    kernel1[kernel_counter] <= src2_readdata;
                end
                else if (kernel_counter < 18) begin
                    kernel2[kernel_counter-9] <= src2_readdata;
                end
                else begin
                    kernel3[kernel_counter-18] <= src2_readdata;
                end
            end
            // 4: begin
            //     done <= 1;
            // end
        endcase
    end

    assign done = (state == 4) ?  1 : 0;

    always @(*) begin
        imag_data = src1_readdata;
        weight1 = kernel1[conv_counter];
        weight2 = kernel2[conv_counter];
        weight3 = kernel3[conv_counter];
    end


endmodule
