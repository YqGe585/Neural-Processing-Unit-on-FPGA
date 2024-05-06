module NPU(
    input CLOCK_50,
    input CLOCK_250,
    input reset
);
    parameter SRAM_NUM = 5'd12;
    // all modules are instantiated here
    wire [15:0] sram_readdata [SRAM_NUM-1:0];
    wire [15:0] sram_writedata [SRAM_NUM-1:0];
    wire [13:0] sram_address [SRAM_NUM-1:0]; 
    wire [SRAM_NUM-1:0] sram_write;  

    wire [127:0] inst_sram_readdata ;
    reg [127:0] inst_sram_writedata ;
    reg [8:0] inst_sram_address = 9'd0; 
    reg inst_sram_write = 0;

    wire [7:0] inst_done_sram_readdata ;
    reg [7:0] inst_done_sram_writedata ;
    reg [8:0] inst_done_sram_address = 9'd0; 
    reg inst_done_sram_write = 0;
    
    M10K_inst_sram inst_sram(
        .clk(CLOCK_250),
        .q(inst_sram_readdata),
        .d(inst_sram_writedata),
        .address(inst_sram_address),
        .we(inst_sram_write)
    );

    M10K_inst_done_sram inst_done_sram(
        .clk(CLOCK_250),
        .q(inst_done_sram_readdata),
        .d(inst_done_sram_writedata),
        .address(inst_done_sram_address),
        .we(inst_done_sram_write)
    );

    genvar k;
    generate
        for (k = 0; k < SRAM_NUM; k = k + 1) begin : sram_instances
            M10K_sram sram(
                .q(sram_readdata[k]),
                .d(sram_writedata[k]),
                .address(sram_address[k]),
                .we(sram_write[k]),
                .clk(CLOCK_250)
            );
        end
    endgenerate

    // add module
    wire [13:0] add_src1_address, add_src2_address, add_dest_address;
    reg [13:0] add_src1_start_address, add_src2_start_address, add_dest_start_address;
    wire [15:0] add_dest_readdata; 
    wire [15:0] add_src1_readdata;
    wire [15:0] add_src2_readdata ;
    wire [15:0] add_dest_writedata, add_src1_writedata, add_src2_writedata ;
    reg [9:0] add_src1_row_size;
    reg [9:0] add_src1_col_size;
    reg [5:0] add_src2_row_size;
    reg [5:0] add_src2_col_size;
    wire add_src1_write_en, add_src2_write_en, add_dest_write_en;
    wire add_start,add_done;

    matrix_addition matrix_add_instance (
        .clk(CLOCK_50),
        .reset(reset),
        .start(add_start),
        .done(add_done),
        .src1_start_address(add_src1_start_address),
        .src2_start_address(add_src2_start_address),
        .src1_address(add_src1_address),
        .src1_readdata(add_src1_readdata),
        .src1_writedata(add_src1_writedata),
        .src1_write_en(add_src1_write_en),
        .src2_address(add_src2_address),
        .src2_readdata(add_src2_readdata),
        .src2_writedata(add_src2_writedata),
        .src2_write_en(add_src2_write_en),
        .src1_row_size(add_src1_row_size),
        .src1_col_size(add_src1_col_size),
        .src2_row_size(add_src2_row_size),
        .src2_col_size(add_src2_col_size),
        .dest_start_address(add_dest_start_address),
        .dest_address(add_dest_address),
        .dest_readdata(add_dest_readdata),
        .dest_writedata(add_dest_writedata),
        .dest_write_en(add_dest_write_en)
    );

    // pooling module
    wire [13:0] pool_src1_address, pool_src2_address, pool_dest_address;
    reg [13:0] pool_src1_start_address, pool_src2_start_address, pool_dest_start_address;
    wire [15:0] pool_dest_readdata; 
    wire [15:0] pool_src1_readdata;
    wire [15:0] pool_src2_readdata ;
    wire [15:0] pool_dest_writedata, pool_src1_writedata, pool_src2_writedata ;
    reg [9:0] pool_src1_row_size;
    reg [9:0] pool_src1_col_size;
    reg [5:0] pool_src2_row_size;
    reg [5:0] pool_src2_col_size;
    wire pool_src1_write_en, pool_src2_write_en, pool_dest_write_en;
    wire pool_start,pool_done;

    matrix_maxpool matrix_pooling_instance (
        .clk(CLOCK_50),
        .reset(reset),
        .start(pool_start),
        .done(pool_done),
        .src1_start_address(pool_src1_start_address),
        .src1_address(pool_src1_address),
        .src1_readdata(pool_src1_readdata),
        .src1_write_en(pool_src1_write_en),
        .src1_row_size(pool_src1_row_size),
        .src1_col_size(pool_src1_col_size),
        .src2_row_size(pool_src2_row_size),
        .src2_col_size(pool_src2_col_size),
        .dest_start_address(pool_dest_start_address),
        .dest_address(pool_dest_address),
        .dest_writedata(pool_dest_writedata),
        .dest_write_en(pool_dest_write_en)
    );

    // relu module
    wire [13:0] relu_src1_address, relu_src2_address, relu_dest_address;
    reg [13:0] relu_src1_start_address, relu_src2_start_address, relu_dest_start_address;
    wire [15:0] relu_dest_readdata; 
    wire [15:0] relu_src1_readdata;
    wire [15:0] relu_src2_readdata ;
    wire [15:0] relu_dest_writedata, relu_src1_writedata, relu_src2_writedata ;
    reg [9:0] relu_src1_row_size;
    reg [9:0] relu_src1_col_size;
    reg [5:0] relu_src2_row_size;
    reg [5:0] relu_src2_col_size;
    wire relu_src1_write_en, relu_src2_write_en, relu_dest_write_en;
    wire relu_start,relu_done;

    matrix_relu matrix_relu_instance (
        .clk(CLOCK_50),
        .reset(reset),
        .start(relu_start),
        .done(relu_done),
        .src1_start_address(relu_src1_start_address),
        .src1_address(relu_src1_address),
        .src1_readdata(relu_src1_readdata),
        .src1_write_en(relu_src1_write_en),
        .src1_row_size(relu_src1_row_size),
        .src1_col_size(relu_src1_col_size),
        .src2_row_size(relu_src2_row_size),
        .src2_col_size(relu_src2_col_size),
        .dest_start_address(relu_dest_start_address),
        .dest_address(relu_dest_address),
        .dest_writedata(relu_dest_writedata),
        .dest_write_en(relu_dest_write_en)
    );

    wire [13:0] dot_src1_address, dot_src2_address, dot_dest_address;
    reg [13:0] dot_src1_start_address, dot_src2_start_address, dot_dest_start_address;
    wire [15:0] dot_dest_readdata; 
    wire [15:0] dot_src1_readdata;
    wire [15:0] dot_src2_readdata ;
    wire [15:0] dot_dest_writedata, dot_src1_writedata, dot_src2_writedata ;
    reg [11:0] dot_src1_row_size;
    reg [7:0] dot_src1_col_size;
    reg [7:0] dot_src2_row_size;
    reg [5:0] dot_src2_col_size;
    wire dot_src1_write_en, dot_src2_write_en, dot_dest_write_en;
    wire dot_start,dot_done;

    matrix_dot matrix_dot_instance(
        .clk(CLOCK_50),
        .reset(reset),
        .start(dot_start),
        .done(dot_done),
        .src1_start_address(dot_src1_start_address),
        .src2_start_address(dot_src2_start_address),
        .src1_address(dot_src1_address),
        .src1_readdata(dot_src1_readdata),
        .src1_write_en(dot_src1_write_en),
        .src2_address(dot_src2_address),
        .src2_readdata(dot_src2_readdata),
        .src2_write_en(dot_src2_write_en),
        .src1_row_size(dot_src1_row_size),
        .src1_col_size(dot_src1_col_size),
        .src2_row_size(dot_src2_row_size),
        .src2_col_size(dot_src2_col_size),
        .dest_start_address(dot_dest_start_address),
        .dest_address(dot_dest_address),
        .dest_writedata(dot_dest_writedata),
        .dest_write_en(dot_dest_write_en)
    );

    // Single Fetch Signle Issue Superscalar Out of Order Processor starts here

    //---------------------------------------------------
    // Fetch
    //---------------------------------------------------
    reg [127:0] inst_D ;

    always @(posedge CLOCK_50) begin
        if(reset) begin
            inst_D <= 128'd0;
            inst_sram_address <= 9'b0;
        end
        else begin
            if(inst_sram_readdata[127:124] == 4'd0) begin
                inst_sram_address <= inst_sram_address;
                inst_D <= 128'd0;
            end
            else begin
                inst_sram_address <= inst_sram_address + 1;
                inst_D <= inst_sram_readdata;
            end
        end
    end


    //---------------------------------------------------
    // Decode
    //---------------------------------------------------
    reg [13:0] src1_address_D; //sram offset
    reg [13:0] src2_address_D;
    reg [13:0] dest_address_D;
    reg [4:0] src1_sram_num_D; // sram number(use for select)
    reg [4:0] src2_sram_num_D;
    reg [4:0] dest_sram_num_D;
    reg [9:0] src1_row_D;
    reg [9:0] src1_col_D;
    reg [4:0] src2_row_D;
    reg [4:0] src2_col_D;
    reg [3:0] sel_D;
    reg [4:0] sel_address_mux_D[SRAM_NUM-1:0];
    reg [4:0] sel_writedata_mux_D[SRAM_NUM-1:0];
    reg [4:0] sel_write_en_mux_D[SRAM_NUM-1:0];
    reg [3:0] sel_readdata_mux_D[SRAM_NUM-1:0];
    // reg [4:0] sel_add_src1_readdata_mux_D;
    // reg [4:0] sel_add_src2_readdata_mux_D;

    reg [4:0] src1_sram_num;
    reg [4:0] src2_sram_num;
    reg [4:0] dest_sram_num;

    reg [11:0] dot_src1_row_D;
    reg [7:0] dot_src1_col_D;
    reg [7:0] dot_src2_row_D;

    // always @(posedge CLOCK_50) begin
    //     if(reset) begin
    //         inst_D <= 128'd0;
    //     end
    //     else begin
    //         inst_D <= inst_sram_writedata;
    //     end
    // end

    // assign inst_D = inst_sram_readdata;
//    integer i0;

    always @(*) begin
        src1_sram_num = SRAM_NUM - 1 - (inst_D[111:104]>>3);
        src2_sram_num = SRAM_NUM - 1 - (inst_D[79:72]>>3);
        dest_sram_num = SRAM_NUM - 1 - (inst_D[47:40]>>3);
    end

    always @(posedge CLOCK_50) begin
        if(reset) begin
            src1_address_D <= 14'd0;
            src2_address_D <= 14'd0;
            dest_address_D <= 14'd0;
            src1_sram_num_D <= 5'd0;
            src2_sram_num_D <= 5'd0;
            dest_sram_num_D <= 5'd0;
            src1_row_D <= 10'd0;
            src1_col_D <= 10'd0;
            src2_row_D <= 5'd0;
            src2_col_D <= 5'd0;
            sel_D <= 4'b0000;
            sel_address_mux_D[0] <= 5'd31;
            sel_address_mux_D[1] <= 5'd31;
            sel_address_mux_D[2] <= 5'd31;
				sel_address_mux_D[3] <= 5'd31;
            sel_address_mux_D[4] <= 5'd31;
            sel_address_mux_D[5] <= 5'd31;
				sel_address_mux_D[6] <= 5'd31;
            sel_address_mux_D[7] <= 5'd31;
            sel_address_mux_D[8] <= 5'd31;
				sel_address_mux_D[9] <= 5'd31;
            sel_address_mux_D[10] <= 5'd31;
            sel_address_mux_D[11] <= 5'd31;

            sel_writedata_mux_D[0] <= 5'd31;
            sel_writedata_mux_D[1] <= 5'd31;
            sel_writedata_mux_D[2] <= 5'd31;
				sel_writedata_mux_D[3] <= 5'd31;
            sel_writedata_mux_D[4] <= 5'd31;
            sel_writedata_mux_D[5] <= 5'd31;
				sel_writedata_mux_D[6] <= 5'd31;
            sel_writedata_mux_D[7] <= 5'd31;
            sel_writedata_mux_D[8] <= 5'd31;
				sel_writedata_mux_D[9] <= 5'd31;
            sel_writedata_mux_D[10] <= 5'd31;
            sel_writedata_mux_D[11] <= 5'd31;

            sel_write_en_mux_D[0] <= 5'd31;
            sel_write_en_mux_D[1] <= 5'd31;
            sel_write_en_mux_D[2] <= 5'd31;
				sel_write_en_mux_D[3] <= 5'd31;
            sel_write_en_mux_D[4] <= 5'd31;
            sel_write_en_mux_D[5] <= 5'd31;
				sel_write_en_mux_D[6] <= 5'd31;
            sel_write_en_mux_D[7] <= 5'd31;
            sel_write_en_mux_D[8] <= 5'd31;
				sel_write_en_mux_D[9] <= 5'd31;
            sel_write_en_mux_D[10] <= 5'd31;
            sel_write_en_mux_D[11] <= 5'd31;

			sel_readdata_mux_D[0] <= 4'd15;
            sel_readdata_mux_D[1] <= 4'd15;
			sel_readdata_mux_D[2] <= 4'd15;
            sel_readdata_mux_D[3] <= 4'd15;
			sel_readdata_mux_D[4] <= 4'd15;
            sel_readdata_mux_D[5] <= 4'd15;
			sel_readdata_mux_D[6] <= 4'd15;
            sel_readdata_mux_D[7] <= 4'd15;
			sel_readdata_mux_D[8] <= 4'd15;
            sel_readdata_mux_D[9] <= 4'd15;
			sel_readdata_mux_D[10] <= 4'd15;
            sel_readdata_mux_D[11] <= 4'd15;

        end
        else begin
            case(inst_D[127:124])
                4'b0001: begin // add
                    src1_address_D <= inst_D[103:92];
                    src2_address_D <= inst_D[71:60];
                    dest_address_D <= inst_D[37:28];
                    src1_sram_num_D <= src1_sram_num;
                    src2_sram_num_D <= src2_sram_num;
                    dest_sram_num_D <= dest_sram_num;
                    src1_row_D <= inst_D[27:19];
                    src1_col_D <= inst_D[18:10];
                    src2_row_D <= 5'd0;
                    src2_col_D <= 5'd0;
                    dot_src1_row_D <= 12'd0;
                    dot_src1_col_D <= 8'd0;
                    dot_src2_row_D <= 8'd0;
                    sel_D <= 4'b0001;
                    sel_address_mux_D[src1_sram_num] <= 5'd0;
                    sel_address_mux_D[src2_sram_num] <= 5'd1;
                    sel_address_mux_D[dest_sram_num] <= 5'd2;
                    sel_writedata_mux_D[src1_sram_num] <= 5'd0;
                    sel_writedata_mux_D[src2_sram_num] <= 5'd1;
                    sel_writedata_mux_D[dest_sram_num] <= 5'd2;
                    sel_write_en_mux_D[src1_sram_num] <= 5'd0;
                    sel_write_en_mux_D[src2_sram_num] <= 5'd1;
                    sel_write_en_mux_D[dest_sram_num] <= 5'd2;
                    sel_readdata_mux_D[0] <= src1_sram_num;
                    sel_readdata_mux_D[1] <= src2_sram_num;
                end
                4'b0111: begin // conv
                    src1_address_D <= inst_D[103:92];
                    src2_address_D <= inst_D[71:60];
                    dest_address_D <= inst_D[37:28];
                    src1_sram_num_D <= src1_sram_num;
                    src2_sram_num_D <= src2_sram_num;
                    dest_sram_num_D <= dest_sram_num;
                    src1_row_D <= inst_D[27:19];
                    src1_col_D <= inst_D[18:10];
                    src2_row_D <= inst_D[9:5];
                    src2_col_D <= inst_D[4:0];
                    dot_src1_row_D <= 12'd0;
                    dot_src1_col_D <= 8'd0;
                    dot_src2_row_D <= 8'd0;
                    sel_address_mux_D[src1_sram_num] <= 5'd0;
                    sel_address_mux_D[2] <= src1_sram_num;
                    sel_address_mux_D[3] <= src2_sram_num;
                end
                4'b1000: begin // pool
                    src1_address_D <= inst_D[103:92];
                    src2_address_D <= inst_D[71:60];
                    dest_address_D <= inst_D[37:28];
                    src1_sram_num_D <= src1_sram_num;
                    src2_sram_num_D <= src2_sram_num;
                    dest_sram_num_D <= dest_sram_num;
                    src1_row_D <= inst_D[27:19];
                    src1_col_D <= inst_D[18:10];
                    src2_row_D <= inst_D[9:5];
                    src2_col_D <= inst_D[4:0];
                    dot_src1_row_D <= 12'd0;
                    dot_src1_col_D <= 8'd0;
                    dot_src2_row_D <= 8'd0;
                    sel_D <= 4'b1000;
                    sel_address_mux_D[src1_sram_num] <= 5'd6;
                    // sel_address_mux_D[src2_sram_num] <= 5'd7;
                    sel_address_mux_D[dest_sram_num] <= 5'd7;
                    sel_writedata_mux_D[src1_sram_num] <= 5'd6;
                    // sel_writedata_mux_D[src2_sram_num] <= 5'd7;
                    sel_writedata_mux_D[dest_sram_num] <= 5'd7;
                    sel_write_en_mux_D[src1_sram_num] <= 5'd6;
                    // sel_write_en_mux_D[src2_sram_num] <= 5'd7;
                    sel_write_en_mux_D[dest_sram_num] <= 5'd7;
                    sel_readdata_mux_D[4] <= src1_sram_num;
                    // sel_readdata_mux_D[5] <= src2_sram_num;
                end
                4'b1010: begin // Relu
                    src1_address_D <= inst_D[103:92];
                    src2_address_D <= inst_D[71:60];
                    dest_address_D <= inst_D[37:28];
                    src1_sram_num_D <= src1_sram_num;
                    src2_sram_num_D <= src2_sram_num;
                    dest_sram_num_D <= dest_sram_num;
                    src1_row_D <= inst_D[27:19];
                    src1_col_D <= inst_D[18:10];
                    src2_row_D <= inst_D[9:5];
                    src2_col_D <= inst_D[4:0];
                    dot_src1_row_D <= 12'd0;
                    dot_src1_col_D <= 8'd0;
                    dot_src2_row_D <= 8'd0;
                    sel_D <= 4'b1010;
                    sel_address_mux_D[src1_sram_num] <= 5'd8;
                    // sel_address_mux_D[src2_sram_num] <= 5'd7;
                    sel_address_mux_D[dest_sram_num] <= 5'd9;
                    sel_writedata_mux_D[src1_sram_num] <= 5'd8;
                    // sel_writedata_mux_D[src2_sram_num] <= 5'd7;
                    sel_writedata_mux_D[dest_sram_num] <= 5'd9;
                    sel_write_en_mux_D[src1_sram_num] <= 5'd8;
                    // sel_write_en_mux_D[src2_sram_num] <= 5'd7;
                    sel_write_en_mux_D[dest_sram_num] <= 5'd9;
                    sel_readdata_mux_D[5] <= src1_sram_num;
                end
                4'b0110: begin // Dot
                    src1_address_D <= inst_D[103:92];
                    src2_address_D <= inst_D[71:60];
                    dest_address_D <= inst_D[37:28];
                    src1_sram_num_D <= src1_sram_num;
                    src2_sram_num_D <= src2_sram_num;
                    dest_sram_num_D <= dest_sram_num;
                    src1_row_D <= inst_D[27:19];
                    src1_col_D <= inst_D[18:10];
                    src2_row_D <= inst_D[9:5];
                    src2_col_D <= inst_D[4:0];
                    dot_src1_row_D <= inst_D[27:16];
                    dot_src1_col_D <= inst_D[15:8];
                    dot_src2_row_D <= inst_D[7:0];
                    sel_D <= 4'b0110;
                    sel_address_mux_D[src1_sram_num] <= 5'd10;
                    sel_address_mux_D[src2_sram_num] <= 5'd11;
                    sel_address_mux_D[dest_sram_num] <= 5'd12;
                    sel_writedata_mux_D[src1_sram_num] <= 5'd10;
                    sel_writedata_mux_D[src2_sram_num] <= 5'd11;
                    sel_writedata_mux_D[dest_sram_num] <= 5'd12;
                    sel_write_en_mux_D[src1_sram_num] <= 5'd10;
                    sel_write_en_mux_D[src2_sram_num] <= 5'd11;
                    sel_write_en_mux_D[dest_sram_num] <= 5'd12;
                    sel_readdata_mux_D[6] <= src1_sram_num;
                    sel_readdata_mux_D[7] <= src2_sram_num;
                end
                default: begin 
                    src1_address_D <= 14'd0;
                    src2_address_D <= 14'd0;
                    dest_address_D <= 14'd0;
                    src1_sram_num_D <= 5'd0;
                    src2_sram_num_D <= 5'd0;
                    dest_sram_num_D <= 5'd0;
                    src1_row_D <= 10'd0;
                    src1_col_D <= 10'd0;
                    src2_row_D <= 5'd0;
                    src2_col_D <= 5'd0;
                    dot_src1_row_D <= 12'd0;
                    dot_src1_col_D <= 8'd0;
                    dot_src2_row_D <= 8'd0;
                    sel_D <= 4'b0000;
                    sel_address_mux_D[src1_sram_num_D] <= sel_address_mux_D[src1_sram_num_D];
                    sel_address_mux_D[src2_sram_num_D] <= sel_address_mux_D[src2_sram_num_D];
                    sel_address_mux_D[dest_sram_num_D] <= sel_address_mux_D[dest_sram_num_D];
                end
            endcase
        end
    end

    //---------------------------------------------------
    // Issue
    //---------------------------------------------------
    reg [13:0] src1_address_I;
    reg [13:0] src2_address_I;
    reg [13:0] dest_address_I;
    reg [4:0] src1_sram_num_I; // sram number(use for select)
    reg [4:0] src2_sram_num_I;
    reg [4:0] dest_sram_num_I;
    reg [9:0] src1_row_I;
    reg [9:0] src1_col_I;
    reg [4:0] src2_row_I;
    reg [4:0] src2_col_I;
    reg [3:0] sel_I;
    reg add_start_I;
    reg pool_start_I;
    reg relu_start_I;
    reg dot_start_I;
    reg [4:0] sel_address_mux_I[SRAM_NUM-1:0];
    reg [4:0] sel_writedata_mux_I[SRAM_NUM-1:0];
    reg [4:0] sel_write_en_mux_I[SRAM_NUM-1:0];
    reg [3:0] sel_readdata_mux_I[SRAM_NUM-1:0];


    genvar j;
    generate
        for (j = 0; j < SRAM_NUM; j = j + 1) begin : pipeline_register_I
            always @(posedge CLOCK_50) begin
					if(reset)begin
						 sel_address_mux_I[j]<= 5'd0;
						 sel_writedata_mux_I[j]<= 5'd0;
						 sel_write_en_mux_I[j]<= 5'd0;
						 sel_readdata_mux_I[j]<= 4'd0;
					end
					else begin
						 sel_address_mux_I[j]<= sel_address_mux_D[j];
						 sel_writedata_mux_I[j]<= sel_writedata_mux_D[j];
						 sel_write_en_mux_I[j]<= sel_write_en_mux_D[j];
						 sel_readdata_mux_I[j]<= sel_readdata_mux_D[j];
					end
            end
        end
    endgenerate

    //pipeline register
    always @(posedge CLOCK_50) begin
        if(reset) begin
            sel_I <= 4'd0;
            src1_address_I <= 14'd0;
            src2_address_I <= 14'd0;
            dest_address_I <= 14'd0;
            src1_sram_num_I <= 5'd0;
            src2_sram_num_I <= 5'd0;
            dest_sram_num_I <= 5'd0;
            src1_row_I <= 10'd0;
            src1_col_I <= 10'd0;
            src2_row_I <= 5'd0;
            src2_col_I <= 5'd0;
        end
        else begin
            sel_I <= sel_D;
            src1_address_I <= src1_address_D;
            src2_address_I <= src2_address_D;
            dest_address_I <= dest_address_D;
            src1_sram_num_I <= src1_sram_num_D;
            src2_sram_num_I <= src2_sram_num_D;
            dest_sram_num_I <= dest_sram_num_D;
            src1_row_I <= src1_row_D;
            src1_col_I <= src1_col_D;
            src2_row_I <= src2_row_D;
            src2_col_I <= src2_col_D;
        end
    end

    always @(posedge CLOCK_50) begin
	 if (reset) begin
		 add_start_I <= 0;
		 add_src1_start_address <= 0;
		 add_src2_start_address <= 0;
		 add_dest_start_address <= 0;
		 add_src1_row_size <= 0;
         add_src1_col_size <= 0;
         add_src2_row_size <= 0;
         add_src2_col_size <= 0;

         pool_start_I <= 0;
         pool_src1_start_address <= 0;
         pool_dest_start_address <= 0;
         pool_src1_row_size <= 0;
         pool_src1_col_size <= 0;
         pool_src2_row_size <= 0;
         pool_src2_col_size <= 0;

         relu_start_I <= 0;
         relu_src1_start_address <= 0;
         relu_dest_start_address <= 0;
         relu_src1_row_size <= 0;
         relu_src1_col_size <= 0;
         relu_src2_row_size <= 0;
         relu_src2_col_size <= 0;
         
         dot_start_I <= 0;
         dot_src1_start_address <= 0;
         dot_dest_start_address <= 0;
         dot_src1_row_size <= 0;
         dot_src1_col_size <= 0;
         dot_src2_row_size <= 0;
         dot_src2_col_size <= 0;
	 end
	 else begin
        case(sel_D)
            4'b0001:begin // issue add
                add_start_I <= 1;
                pool_start_I <= 0;
                relu_start_I <= 0;
                dot_start_I <= 0;
                add_src1_start_address <= src1_address_D;
                add_src2_start_address <= src2_address_D;
                add_dest_start_address <= dest_address_D;

                // sram_address[src1_sram_num_D] <= add_src1_address;
                // add_src1_readdata <= sram_readdata[src1_sram_num_D];
                // sram_writedata[src1_sram_num_D] <= add_src1_writedata;
                // sram_write[src1_sram_num_D] <= add_src1_write_en;

                // add_src2_address <= sram_address[src2_sram_num_D];
                // add_src2_readdata <= sram_readdata[src2_sram_num_D];
                // add_src2_writedata <= sram_writedata[src2_sram_num_D];
                // add_src2_write_en <= sram_write[src2_sram_num_D];

                add_src1_row_size <= src1_row_D;
                add_src1_col_size <= src1_col_D;
                add_src2_row_size <= src2_row_D;
                add_src2_col_size <= src2_col_D;

                // add_dest_address <= sram_address[dest_sram_num_D];
                // add_dest_readdata <= sram_readdata[dest_sram_num_D];
                // add_dest_writedata <= sram_writedata[dest_sram_num_D];
                // add_dest_write_en <= sram_write[dest_sram_num_D];
            
            end 
            4'b1000: begin
                add_start_I <= 0;
                pool_start_I <= 1;
                relu_start_I <= 0;
                dot_start_I <= 0;
                pool_src1_start_address <= src1_address_D;
                // pool_src2_start_address <= src2_address_D;
                pool_dest_start_address <= dest_address_D;

                pool_src1_row_size <= src1_row_D;
                pool_src1_col_size <= src1_col_D;
                pool_src2_row_size <= src2_row_D;
                pool_src2_col_size <= src2_col_D;
            end

            4'b1010: begin
                add_start_I <= 0;
                pool_start_I <= 0;
                relu_start_I <= 1;
                dot_start_I <= 0;
                relu_src1_start_address <= src1_address_D;
                relu_dest_start_address <= dest_address_D;

                relu_src1_row_size <= src1_row_D;
                relu_src1_col_size <= src1_col_D;
                relu_src2_row_size <= src2_row_D;
                relu_src2_col_size <= src2_col_D;
            end

            4'b0110: begin
                add_start_I <= 0;
                pool_start_I <= 0;
                relu_start_I <= 0;
                dot_start_I <= 1;
                dot_src1_start_address <= src1_address_D;
                dot_src2_start_address <= src2_address_D;
                dot_dest_start_address <= dest_address_D;

                dot_src1_row_size <= dot_src1_row_D;
                dot_src1_col_size <= dot_src1_col_D;
                dot_src2_row_size <= dot_src2_row_D;
                dot_src2_col_size <= dot_src1_row_D;
            end

            default: begin
                add_start_I <= 0;
                pool_start_I <= 0;
                relu_start_I <= 0;
                dot_start_I <= 0;
            end
        endcase
	 end
    end

    //---------------------------------------------------
    // execute
    //---------------------------------------------------
    reg add_start_E;
    reg pool_start_E;
    reg relu_start_E;
    reg dot_start_E;
    reg [4:0] sel_address_mux_E[SRAM_NUM-1:0];
    reg [4:0] sel_writedata_mux_E[SRAM_NUM-1:0];
    reg [4:0] sel_write_en_mux_E[SRAM_NUM-1:0];
    reg [4:0] sel_readdata_mux_E[SRAM_NUM-1:0];

    assign add_start = add_start_E;
    assign pool_start = pool_start_E;
    assign relu_start = relu_start_E;
    assign dot_start = dot_start_E;
    
    always @(posedge CLOCK_50) begin
        if(reset)begin
            add_start_E <=0;
            pool_start_E <=0;
            relu_start_E <=0;
            dot_start_E <=0;
        end
        else begin
            add_start_E<=add_start_I;
            pool_start_E<=pool_start_I;
            relu_start_E<=relu_start_I;
            dot_start_E<=dot_start_I;
        end
    end

    genvar m;
    generate
        for (m = 0; m < SRAM_NUM; m = m + 1) begin : pipeline_register_E
            always @(posedge CLOCK_50) begin
					if(reset) begin
						 sel_address_mux_E[m]<= 0;
						 sel_writedata_mux_E[m]<= 0;
						 sel_write_en_mux_E[m]<= 0;
						 sel_readdata_mux_E[m]<= 0;
					end
					else begin
						 sel_address_mux_E[m]<= sel_address_mux_I[m];
						 sel_writedata_mux_E[m]<= sel_writedata_mux_I[m];
						 sel_write_en_mux_E[m]<= sel_write_en_mux_I[m];
						 sel_readdata_mux_E[m]<= sel_readdata_mux_I[m];
					end
            end
        end
    endgenerate

    genvar i;
    generate
        for (i = 0; i < SRAM_NUM-1; i = i + 1) begin : mux_gen
            mux24to1 #(.DATA_WIDTH(14)) address_mux (
                .in0(add_src1_address),
                .in1(add_src2_address),
                .in2(add_dest_address),
                .in3(),
                .in4(),
                .in5(),
                .in6(pool_src1_address),
                .in7(pool_dest_address),
                .in8(relu_src1_address),
                .in9(relu_dest_address),
                .in10(dot_src1_address),
                .in11(dot_src2_address),
                .in12(dot_dest_address),
                .in13(),
                .in14(),
                .in15(),
                .in16(),
                .in17(),
                .in18(),
                .in19(),
                .in20(),
                .in21(),
                .in22(),
                .in23(),
                .sel(sel_address_mux_I[i]),
                .out(sram_address[i]),
				.reset(reset)
            );

            mux24to1 #(.DATA_WIDTH(16)) writedata_mux(
                .in0(add_src1_writedata),
                .in1(add_src2_writedata),
                .in2(add_dest_writedata),
                .in3(),
                .in4(),
                .in5(),
                .in6(pool_src1_writedata),
                .in7(pool_dest_writedata),
                .in8(relu_src1_writedata),
                .in9(relu_dest_writedata),
                .in10(dot_src1_writedata),
                .in11(dot_src2_writedata),
                .in12(dot_dest_writedata),
                .in13(),
                .in14(),
                .in15(),
                .in16(),
                .in17(),
                .in18(),
                .in19(),
                .in20(),
                .in21(),
                .in22(),
                .in23(),
                .sel(sel_writedata_mux_I[i]),
                .out(sram_writedata[i]),
				.reset(reset)
            );

            mux24to1 #(.DATA_WIDTH(1)) write_en_mux(
                .in0(add_src1_write_en),
                .in1(add_src2_write_en),
                .in2(add_dest_write_en),
                .in3(),
                .in4(),
                .in5(),
                .in6(pool_src1_write_en),
                .in7(pool_dest_write_en),
                .in8(relu_src1_write_en),
                .in9(relu_dest_write_en),
                .in10(dot_src1_write_en),
                .in11(dot_src2_write_en),
                .in12(dot_dest_write_en),
                .in13(),
                .in14(),
                .in15(),
                .in16(),
                .in17(),
                .in18(),
                .in19(),
                .in20(),
                .in21(),
                .in22(),
                .in23(),
                .sel(sel_write_en_mux_I[i]),
                .out(sram_write[i]),
				.reset(reset)
            );

        end
    endgenerate

    mux16to1 #(.DATA_WIDTH(16)) add_src1_mux(
        .in0(sram_readdata[0]),
        .in1(sram_readdata[1]),
        .in2(sram_readdata[2]),
        .in3(sram_readdata[3]),
        .in4(sram_readdata[4]),
        .in5(sram_readdata[5]),
        .in6(sram_readdata[6]),
        .in7(sram_readdata[7]),
        .in8(sram_readdata[8]),
        .in9(sram_readdata[9]),
        .in10(sram_readdata[10]),
        .in11(sram_readdata[11]),
        .in12(),
        .in13(),
        .in14(),
        .in15(),
        .sel(sel_readdata_mux_I[0]),
        .out(add_src1_readdata),
		  .reset(reset)
    );

    mux16to1 #(.DATA_WIDTH(16)) add_src2_mux(
        .in0(sram_readdata[0]),
        .in1(sram_readdata[1]),
        .in2(sram_readdata[2]),
        .in3(sram_readdata[3]),
        .in4(sram_readdata[4]),
        .in5(sram_readdata[5]),
        .in6(sram_readdata[6]),
        .in7(sram_readdata[7]),
        .in8(sram_readdata[8]),
        .in9(sram_readdata[9]),
        .in10(sram_readdata[10]),
        .in11(sram_readdata[11]),
        .in12(),
        .in13(),
        .in14(),
        .in15(),
        .sel(sel_readdata_mux_I[1]),
        .out(add_src2_readdata),
		  .reset(reset)
    );

    mux16to1 #(.DATA_WIDTH(16)) pool_src1_mux(
        .in0(sram_readdata[0]),
        .in1(sram_readdata[1]),
        .in2(sram_readdata[2]),
        .in3(sram_readdata[3]),
        .in4(sram_readdata[4]),
        .in5(sram_readdata[5]),
        .in6(sram_readdata[6]),
        .in7(sram_readdata[7]),
        .in8(sram_readdata[8]),
        .in9(sram_readdata[9]),
        .in10(sram_readdata[10]),
        .in11(sram_readdata[11]),
        .in12(),
        .in13(),
        .in14(),
        .in15(),
        .sel(sel_readdata_mux_I[4]),
        .out(pool_src1_readdata),
		  .reset(reset)
    );

    mux16to1 #(.DATA_WIDTH(16)) relu_src1_mux(
        .in0(sram_readdata[0]),
        .in1(sram_readdata[1]),
        .in2(sram_readdata[2]),
        .in3(sram_readdata[3]),
        .in4(sram_readdata[4]),
        .in5(sram_readdata[5]),
        .in6(sram_readdata[6]),
        .in7(sram_readdata[7]),
        .in8(sram_readdata[8]),
        .in9(sram_readdata[9]),
        .in10(sram_readdata[10]),
        .in11(sram_readdata[11]),
        .in12(),
        .in13(),
        .in14(),
        .in15(),
        .sel(sel_readdata_mux_I[5]),
        .out(relu_src1_readdata),
		.reset(reset)
    );

    mux16to1 #(.DATA_WIDTH(16)) dot_src1_mux(
        .in0(sram_readdata[0]),
        .in1(sram_readdata[1]),
        .in2(sram_readdata[2]),
        .in3(sram_readdata[3]),
        .in4(sram_readdata[4]),
        .in5(sram_readdata[5]),
        .in6(sram_readdata[6]),
        .in7(sram_readdata[7]),
        .in8(sram_readdata[8]),
        .in9(sram_readdata[9]),
        .in10(sram_readdata[10]),
        .in11(sram_readdata[11]),
        .in12(),
        .in13(),
        .in14(),
        .in15(),
        .sel(sel_readdata_mux_I[6]),
        .out(dot_src1_readdata),
		.reset(reset)
    );


    mux16to1 #(.DATA_WIDTH(16)) dot_src2_mux(
        .in0(sram_readdata[0]),
        .in1(sram_readdata[1]),
        .in2(sram_readdata[2]),
        .in3(sram_readdata[3]),
        .in4(sram_readdata[4]),
        .in5(sram_readdata[5]),
        .in6(sram_readdata[6]),
        .in7(sram_readdata[7]),
        .in8(sram_readdata[8]),
        .in9(sram_readdata[9]),
        .in10(sram_readdata[10]),
        .in11(sram_readdata[11]),
        .in12(),
        .in13(),
        .in14(),
        .in15(),
        .sel(sel_readdata_mux_I[7]),
        .out(dot_src2_readdata),
		.reset(reset)
    );

	 //---------------------------------------------------
    // Commit
    //---------------------------------------------------
	 
	reg add_done_prev;
    reg pool_done_prev;
    reg relu_done_prev;
    reg dot_done_prev;

    always @ (posedge CLOCK_50) begin
        if(reset) begin
            add_done_prev <= 0;
            pool_done_prev <= 0;
            relu_done_prev <= 0;
            dot_done_prev <= 0;
        end
        else begin
            add_done_prev <= add_done;
            pool_done_prev <= pool_done;
            relu_done_prev <= relu_done;
            dot_done_prev <= dot_done;
        end
    end

    always @(posedge CLOCK_50) begin
        if(reset) begin
            inst_done_sram_address <= 9'd0;
            inst_done_sram_writedata <= 8'b00000000;
            inst_done_sram_write <=0;
        end
        else begin
            if(~add_done_prev && add_done) begin
                inst_done_sram_address <= 9'd0;
                inst_done_sram_writedata <= 8'b11111111;
                inst_done_sram_write <=1;
            end
            else if(~pool_done_prev && pool_done)begin
                inst_done_sram_address <= 9'd2;
                inst_done_sram_writedata <= 8'b11111111;
                inst_done_sram_write <=1;
            end
            else if(~relu_done_prev && relu_done)begin
                inst_done_sram_address <= 9'd3;
                inst_done_sram_writedata <= 8'b11111111;
                inst_done_sram_write <=1;
            end
            else if(~dot_done_prev && dot_done)begin
                inst_done_sram_address <= 9'd4;
                inst_done_sram_writedata <= 8'b11111111;
                inst_done_sram_write <=1;
            end
            else begin
                inst_done_sram_write <=0;
            end
            
        end
    end
    
endmodule
