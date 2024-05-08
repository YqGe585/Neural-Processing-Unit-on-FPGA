module NPU(
    input CLOCK_25,
    input CLOCK_100,
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
    wire add_start;
    wire add_done;


    matrix_addition matrix_add_instance (
        .clk(CLOCK_25),
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


    
    // conv1 module
    wire [13:0] conv1_src1_address, conv1_src2_address, conv1_dest_address;
    reg [13:0] conv1_src1_start_address, conv1_src2_start_address, conv1_dest_start_address;
    wire [15:0] conv1_dest_readdata; 
    wire [15:0] conv1_src1_readdata;
    wire [15:0] conv1_src2_readdata ;
    wire [15:0] conv1_dest_writedata, conv1_src1_writedata, conv1_src2_writedata ;
    reg [9:0] conv1_src1_row_size;
    reg [9:0] conv1_src1_col_size;
    reg [5:0] conv1_src2_row_size;
    reg [5:0] conv1_src2_col_size;
    wire conv1_src1_write_en, conv1_src2_write_en, conv1_dest_write_en;
    wire conv1_start,conv1_done;

    matrix_conv conv1_instance (
        .clk(CLOCK_25),
        .reset(reset),
        .start(conv1_start),
        .done(conv1_done),
        .src1_start_address(conv1_src1_start_address),
        .src2_start_address(conv1_src2_start_address),
        .src1_address(conv1_src1_address),
        .src1_readdata(conv1_src1_readdata),
        .src1_writedata(conv1_src1_writedata),
        .src1_write_en(conv1_src1_write_en),
        .src2_address(conv1_src2_address),
        .src2_readdata(conv1_src2_readdata),
        .src2_writedata(conv1_src2_writedata),
        .src2_write_en(conv1_src2_write_en),
        .src1_row_size(conv1_src1_row_size),
        .src1_col_size(conv1_src1_col_size),
        .src2_row_size(conv1_src2_row_size),
        .src2_col_size(conv1_src2_col_size),
        .dest_start_address(conv1_dest_start_address),
        .dest_address(conv1_dest_address),
        .dest_readdata(),
        .dest_writedata(conv1_dest_writedata),
        .dest_write_en(conv1_dest_write_en)
    );

    // conv2 module
    wire [13:0] conv2_src1_address, conv2_src2_address, conv2_dest_address;
    reg [13:0] conv2_src1_start_address, conv2_src2_start_address, conv2_dest_start_address;
    wire [15:0] conv2_dest_readdata; 
    wire [15:0] conv2_src1_readdata;
    wire [15:0] conv2_src2_readdata ;
    wire [15:0] conv2_dest_writedata, conv2_src1_writedata, conv2_src2_writedata ;
    reg [9:0] conv2_src1_row_size;
    reg [9:0] conv2_src1_col_size;
    reg [5:0] conv2_src2_row_size;
    reg [5:0] conv2_src2_col_size;
    wire conv2_src1_write_en, conv2_src2_write_en, conv2_dest_write_en;
    wire conv2_start,conv2_done;

    matrix_conv conv2_instance (
        .clk(CLOCK_25),
        .reset(reset),
        .start(conv2_start),
        .done(conv2_done),
        .src1_start_address(conv2_src1_start_address),
        .src2_start_address(conv2_src2_start_address),
        .src1_address(conv2_src1_address),
        .src1_readdata(conv2_src1_readdata),
        .src1_writedata(conv2_src1_writedata),
        .src1_write_en(conv2_src1_write_en),
        .src2_address(conv2_src2_address),
        .src2_readdata(conv2_src2_readdata),
        .src2_writedata(conv2_src2_writedata),
        .src2_write_en(conv2_src2_write_en),
        .src1_row_size(conv2_src1_row_size),
        .src1_col_size(conv2_src1_col_size),
        .src2_row_size(conv2_src2_row_size),
        .src2_col_size(conv2_src2_col_size),
        .dest_start_address(conv2_dest_start_address),
        .dest_address(conv2_dest_address),
        .dest_readdata(),
        .dest_writedata(conv2_dest_writedata),
        .dest_write_en(conv2_dest_write_en)
    );

    // conv3 module
    wire [13:0] conv3_src1_address, conv3_src2_address, conv3_dest_address;
    reg [13:0] conv3_src1_start_address, conv3_src2_start_address, conv3_dest_start_address;
    wire [15:0] conv3_dest_readdata; 
    wire [15:0] conv3_src1_readdata;
    wire [15:0] conv3_src2_readdata ;
    wire [15:0] conv3_dest_writedata, conv3_src1_writedata, conv3_src2_writedata ;
    reg [9:0] conv3_src1_row_size;
    reg [9:0] conv3_src1_col_size;
    reg [5:0] conv3_src2_row_size;
    reg [5:0] conv3_src2_col_size;
    wire conv3_src1_write_en, conv3_src2_write_en, conv3_dest_write_en;
    wire conv3_start,conv3_done;

    matrix_conv conv3_instance (
        .clk(CLOCK_25),
        .reset(reset),
        .start(conv3_start),
        .done(conv3_done),
        .src1_start_address(conv3_src1_start_address),
        .src2_start_address(conv3_src2_start_address),
        .src1_address(conv3_src1_address),
        .src1_readdata(conv3_src1_readdata),
        .src1_writedata(conv3_src1_writedata),
        .src1_write_en(conv3_src1_write_en),
        .src2_address(conv3_src2_address),
        .src2_readdata(conv3_src2_readdata),
        .src2_writedata(conv3_src2_writedata),
        .src2_write_en(conv3_src2_write_en),
        .src1_row_size(conv3_src1_row_size),
        .src1_col_size(conv3_src1_col_size),
        .src2_row_size(conv3_src2_row_size),
        .src2_col_size(conv3_src2_col_size),
        .dest_start_address(conv3_dest_start_address),
        .dest_address(conv3_dest_address),
        .dest_readdata(),
        .dest_writedata(conv3_dest_writedata),
        .dest_write_en(conv3_dest_write_en)
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
        .clk(CLOCK_25),
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
        .clk(CLOCK_25),
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
        .clk(CLOCK_25),
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



    // sub module
    wire [13:0] sub_src1_address, sub_src2_address, sub_dest_address;
    reg [13:0] sub_src1_start_address, sub_src2_start_address, sub_dest_start_address;
    wire [15:0] sub_dest_readdata; 
    wire [15:0] sub_src1_readdata;
    wire [15:0] sub_src2_readdata ;
    wire [15:0] sub_dest_writedata, sub_src1_writedata, sub_src2_writedata ;
    reg [9:0] sub_src1_row_size;
    reg [9:0] sub_src1_col_size;
    reg [5:0] sub_src2_row_size;
    reg [5:0] sub_src2_col_size;
    wire sub_src1_write_en, sub_src2_write_en, sub_dest_write_en;
    wire sub_start;
    wire sub_done;


    matrix_subtraction matrix_sum_instance (
        .clk(CLOCK_25),
        .reset(reset),
        .start(sub_start),
        .done(sub_done),
        .src1_start_address(sub_src1_start_address),
        .src2_start_address(sub_src2_start_address),
        .src1_address(sub_src1_address),
        .src1_readdata(sub_src1_readdata),
        .src1_writedata(sub_src1_writedata),
        .src1_write_en(sub_src1_write_en),
        .src2_address(sub_src2_address),
        .src2_readdata(sub_src2_readdata),
        .src2_writedata(sub_src2_writedata),
        .src2_write_en(sub_src2_write_en),
        .src1_row_size(sub_src1_row_size),
        .src1_col_size(sub_src1_col_size),
        .src2_row_size(sub_src2_row_size),
        .src2_col_size(sub_src2_col_size),
        .dest_start_address(sub_dest_start_address),
        .dest_address(sub_dest_address),
        .dest_readdata(sub_dest_readdata),
        .dest_writedata(sub_dest_writedata),
        .dest_write_en(sub_dest_write_en)
    );



    // element mult module
    wire [13:0] mul_src1_address, mul_src2_address, mul_dest_address;
    reg [13:0] mul_src1_start_address, mul_src2_start_address, mul_dest_start_address;
    wire [15:0] mul_dest_readdata; 
    wire [15:0] mul_src1_readdata;
    wire [15:0] mul_src2_readdata ;
    wire [15:0] mul_dest_writedata, mul_src1_writedata, mul_src2_writedata ;
    reg [9:0] mul_src1_row_size;
    reg [9:0] mul_src1_col_size;
    reg [5:0] mul_src2_row_size;
    reg [5:0] mul_src2_col_size;
    wire mul_src1_write_en, mul_src2_write_en, mul_dest_write_en;
    wire mul_start;
    wire mul_done;


    matrix_element_mult matrix_mul_instance (
        .clk(CLOCK_25),
        .reset(reset),
        .start(mul_start),
        .done(mul_done),
        .src1_start_address(mul_src1_start_address),
        .src2_start_address(mul_src2_start_address),
        .src1_address(mul_src1_address),
        .src1_readdata(mul_src1_readdata),
        .src1_writedata(mul_src1_writedata),
        .src1_write_en(mul_src1_write_en),
        .src2_address(mul_src2_address),
        .src2_readdata(mul_src2_readdata),
        .src2_writedata(mul_src2_writedata),
        .src2_write_en(mul_src2_write_en),
        .src1_row_size(mul_src1_row_size),
        .src1_col_size(mul_src1_col_size),
        .src2_row_size(mul_src2_row_size),
        .src2_col_size(mul_src2_col_size),
        .dest_start_address(mul_dest_start_address),
        .dest_address(mul_dest_address),
        .dest_readdata(mul_dest_readdata),
        .dest_writedata(mul_dest_writedata),
        .dest_write_en(mul_dest_write_en)
    );

    // Single Fetch Signle Issue Superscalar Out of Order Processor starts here

    //---------------------------------------------------
    // Fetch
    //---------------------------------------------------
    reg [127:0] inst_D ;

    always @(posedge CLOCK_100) begin
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
    reg [3:0] sel_readdata_mux_D[15:0];
    // reg [4:0] sel_add_src1_readdata_mux_D;
    // reg [4:0] sel_add_src2_readdata_mux_D;

    reg [4:0] src1_sram_num;
    reg [4:0] src2_sram_num;
    reg [4:0] dest_sram_num;

    reg [11:0] dot_src1_row_D;
    reg [7:0] dot_src1_col_D;
    reg [7:0] dot_src2_row_D;

    // always @(posedge CLOCK_25) begin
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

    always @(posedge CLOCK_100) begin
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
            sel_readdata_mux_D[12] <= 4'd15;
            sel_readdata_mux_D[13] <= 4'd15;
			sel_readdata_mux_D[14] <= 4'd15;
            sel_readdata_mux_D[15] <= 4'd15;
            sel_readdata_mux_D[16] <= 4'd15;

        end
        else begin
            case(inst_D[127:124])
                4'b0001: begin // add
                    src1_address_D <= inst_D[105:92];
                    src2_address_D <= inst_D[73:60];
                    dest_address_D <= inst_D[41:28];
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
                    src1_address_D <= inst_D[105:92];
                    src2_address_D <= inst_D[73:60];
                    dest_address_D <= inst_D[41:28];
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
                    sel_D <= 4'b0111;
                    sel_address_mux_D[src1_sram_num] <= 5'd3;
                    sel_address_mux_D[src2_sram_num] <= 5'd4;
                    sel_address_mux_D[dest_sram_num] <= 5'd5;
                    sel_writedata_mux_D[src1_sram_num] <= 5'd3;
                    sel_writedata_mux_D[src2_sram_num] <= 5'd4;
                    sel_writedata_mux_D[dest_sram_num] <= 5'd5;
                    sel_write_en_mux_D[src1_sram_num] <= 5'd3;
                    sel_write_en_mux_D[src2_sram_num] <= 5'd4;
                    sel_write_en_mux_D[dest_sram_num] <= 5'd5;
                    sel_readdata_mux_D[2] <= src1_sram_num;
                    sel_readdata_mux_D[3] <= src2_sram_num;
                end
                4'b1000: begin // pool
                    src1_address_D <= inst_D[105:92];
                    src2_address_D <= inst_D[73:60];
                    dest_address_D <= inst_D[41:28];
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
                    src1_address_D <= inst_D[105:92];
                    src2_address_D <= inst_D[73:60];
                    dest_address_D <= inst_D[41:28];
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
                    src1_address_D <= inst_D[105:92];
                    src2_address_D <= inst_D[73:60];
                    dest_address_D <= inst_D[41:28];
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
                4'b0010: begin // sub
                    src1_address_D <= inst_D[105:92];
                    src2_address_D <= inst_D[73:60];
                    dest_address_D <= inst_D[41:28];
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
                    sel_D <= 4'b0010;
                    sel_address_mux_D[src1_sram_num] <= 5'd13;
                    sel_address_mux_D[src2_sram_num] <= 5'd14;
                    sel_address_mux_D[dest_sram_num] <= 5'd15;
                    sel_writedata_mux_D[src1_sram_num] <= 5'd13;
                    sel_writedata_mux_D[src2_sram_num] <= 5'd14;
                    sel_writedata_mux_D[dest_sram_num] <= 5'd15;
                    sel_write_en_mux_D[src1_sram_num] <= 5'd13;
                    sel_write_en_mux_D[src2_sram_num] <= 5'd14;
                    sel_write_en_mux_D[dest_sram_num] <= 5'd15;
                    sel_readdata_mux_D[8] <= src1_sram_num;
                    sel_readdata_mux_D[9] <= src2_sram_num;
                end
                4'b0011: begin // mult
                    src1_address_D <= inst_D[105:92];
                    src2_address_D <= inst_D[73:60];
                    dest_address_D <= inst_D[41:28];
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
                    sel_D <= 4'b0011;
                    sel_address_mux_D[src1_sram_num] <= 5'd16;
                    sel_address_mux_D[src2_sram_num] <= 5'd17;
                    sel_address_mux_D[dest_sram_num] <= 5'd18;
                    sel_writedata_mux_D[src1_sram_num] <= 5'd16;
                    sel_writedata_mux_D[src2_sram_num] <= 5'd17;
                    sel_writedata_mux_D[dest_sram_num] <= 5'd18;
                    sel_write_en_mux_D[src1_sram_num] <= 5'd16;
                    sel_write_en_mux_D[src2_sram_num] <= 5'd17;
                    sel_write_en_mux_D[dest_sram_num] <= 5'd18;
                    sel_readdata_mux_D[10] <= src1_sram_num;
                    sel_readdata_mux_D[11] <= src2_sram_num;
                end
                4'b1001: begin // conv2
                    src1_address_D <= inst_D[105:92];
                    src2_address_D <= inst_D[73:60];
                    dest_address_D <= inst_D[41:28];
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
                    sel_D <= 4'b1001;
                    sel_address_mux_D[src1_sram_num] <= 5'd19;
                    sel_address_mux_D[src2_sram_num] <= 5'd20;
                    sel_address_mux_D[dest_sram_num] <= 5'd21;
                    sel_writedata_mux_D[src1_sram_num] <= 5'd19;
                    sel_writedata_mux_D[src2_sram_num] <= 5'd20;
                    sel_writedata_mux_D[dest_sram_num] <= 5'd21;
                    sel_write_en_mux_D[src1_sram_num] <= 5'd19;
                    sel_write_en_mux_D[src2_sram_num] <= 5'd20;
                    sel_write_en_mux_D[dest_sram_num] <= 5'd21;
                    sel_readdata_mux_D[12] <= src1_sram_num;
                    sel_readdata_mux_D[13] <= src2_sram_num;
                end
                4'b1011: begin // conv3
                    src1_address_D <= inst_D[105:92];
                    src2_address_D <= inst_D[73:60];
                    dest_address_D <= inst_D[41:28];
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
                    sel_D <= 4'b1011;
                    sel_address_mux_D[src1_sram_num] <= 5'd22;
                    sel_address_mux_D[src2_sram_num] <= 5'd23;
                    sel_address_mux_D[dest_sram_num] <= 5'd24;
                    sel_writedata_mux_D[src1_sram_num] <= 5'd22;
                    sel_writedata_mux_D[src2_sram_num] <= 5'd23;
                    sel_writedata_mux_D[dest_sram_num] <= 5'd24;
                    sel_write_en_mux_D[src1_sram_num] <= 5'd22;
                    sel_write_en_mux_D[src2_sram_num] <= 5'd23;
                    sel_write_en_mux_D[dest_sram_num] <= 5'd24;
                    sel_readdata_mux_D[14] <= src1_sram_num;
                    sel_readdata_mux_D[15] <= src2_sram_num;
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
    reg conv1_start_I;
    reg conv2_start_I;
    reg conv3_start_I;
    reg pool_start_I;
    reg relu_start_I;
    reg dot_start_I;
    reg sub_start_I;
    reg mul_start_I;
    reg [4:0] sel_address_mux_I[SRAM_NUM-1:0];
    reg [4:0] sel_writedata_mux_I[SRAM_NUM-1:0];
    reg [4:0] sel_write_en_mux_I[SRAM_NUM-1:0];
    reg [3:0] sel_readdata_mux_I[15:0];


    genvar j;
    generate
        for (j = 0; j < SRAM_NUM; j = j + 1) begin : pipeline_register_I
            always @(posedge CLOCK_100) begin
					if(reset)begin
						 sel_address_mux_I[j]<= 5'd0;
						 sel_writedata_mux_I[j]<= 5'd0;
						 sel_write_en_mux_I[j]<= 5'd0;
						//  sel_readdata_mux_I[j]<= 4'd0;
					end
					else begin
						 sel_address_mux_I[j]<= sel_address_mux_D[j];
						 sel_writedata_mux_I[j]<= sel_writedata_mux_D[j];
						 sel_write_en_mux_I[j]<= sel_write_en_mux_D[j];
						//  sel_readdata_mux_I[j]<= sel_readdata_mux_D[j];
					end
            end
        end
    endgenerate

    generate
        for (j=0; j < 16; j=j+1) begin : pipeline_register_I_sel_readdata_mux_D
            always @(posedge CLOCK_100) begin
					if(reset)begin
						 sel_readdata_mux_I[j]<= 4'd0;
					end
					else begin
						 sel_readdata_mux_I[j]<= sel_readdata_mux_D[j];
					end
            end
        end
    endgenerate

    //pipeline register
    always @(posedge CLOCK_100) begin
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

    always @(posedge CLOCK_100) begin
	 if (reset) begin
		 add_start_I <= 0;
		 add_src1_start_address <= 0;
		 add_src2_start_address <= 0;
		 add_dest_start_address <= 0;
		 add_src1_row_size <= 0;
         add_src1_col_size <= 0;
         add_src2_row_size <= 0;
         add_src2_col_size <= 0;

         conv1_start_I <= 0;
		 conv1_src1_start_address <= 0;
		 conv1_src2_start_address <= 0;
		 conv1_dest_start_address <= 0;
		 conv1_src1_row_size <= 0;
         conv1_src1_col_size <= 0;
         conv1_src2_row_size <= 0;
         conv1_src2_col_size <= 0;

         conv2_start_I <= 0;
		 conv2_src1_start_address <= 0;
		 conv2_src2_start_address <= 0;
		 conv2_dest_start_address <= 0;
		 conv2_src1_row_size <= 0;
         conv2_src1_col_size <= 0;
         conv2_src2_row_size <= 0;
         conv2_src2_col_size <= 0;

         conv3_start_I <= 0;
		 conv3_src1_start_address <= 0;
		 conv3_src2_start_address <= 0;
		 conv3_dest_start_address <= 0;
		 conv3_src1_row_size <= 0;
         conv3_src1_col_size <= 0;
         conv3_src2_row_size <= 0;
         conv3_src2_col_size <= 0;

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

         sub_start_I <= 0;
		 sub_src1_start_address <= 0;
		 sub_src2_start_address <= 0;
		 sub_dest_start_address <= 0;
		 sub_src1_row_size <= 0;
         sub_src1_col_size <= 0;
         sub_src2_row_size <= 0;
         sub_src2_col_size <= 0;

         mul_start_I <= 0;
		 mul_src1_start_address <= 0;
		 mul_src2_start_address <= 0;
		 mul_dest_start_address <= 0;
		 mul_src1_row_size <= 0;
         mul_src1_col_size <= 0;
         mul_src2_row_size <= 0;
         mul_src2_col_size <= 0;
	 end
	 else begin
        case(sel_D)
            4'b0001:begin // issue add
                add_start_I <= 1;
                conv1_start_I <= 0;
                conv2_start_I <= 0;
                conv3_start_I <= 0;
                pool_start_I <= 0;
                relu_start_I <= 0;
                dot_start_I <= 0;
                sub_start_I <= 0;
                mul_start_I <= 0;
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

            4'b0111: begin // conv1
                add_start_I <= 0;
                conv1_start_I <= 1;
                conv2_start_I <= 0;
                conv3_start_I <= 0;
                pool_start_I <= 0;
                relu_start_I <= 0;
                dot_start_I <= 0;
                sub_start_I <= 0;
                mul_start_I <= 0;
                conv1_src1_start_address <= src1_address_D;
                conv1_src2_start_address <= src2_address_D;
                conv1_dest_start_address <= dest_address_D;

                conv1_src1_row_size <= src1_row_D;
                conv1_src1_col_size <= src1_col_D;
                conv1_src2_row_size <= src2_row_D;
                conv1_src2_col_size <= src2_col_D;
            end

            4'b1001: begin // conv2
                add_start_I <= 0;
                conv1_start_I <= 0;
                conv2_start_I <= 1;
                conv3_start_I <= 0;
                pool_start_I <= 0;
                relu_start_I <= 0;
                dot_start_I <= 0;
                sub_start_I <= 0;
                mul_start_I <= 0;
                conv2_src1_start_address <= src1_address_D;
                conv2_src2_start_address <= src2_address_D;
                conv2_dest_start_address <= dest_address_D;

                conv2_src1_row_size <= src1_row_D;
                conv2_src1_col_size <= src1_col_D;
                conv2_src2_row_size <= src2_row_D;
                conv2_src2_col_size <= src2_col_D;
            end

            4'b1011: begin // conv3
                add_start_I <= 0;
                conv1_start_I <= 0;
                conv2_start_I <= 0;
                conv3_start_I <= 1;
                pool_start_I <= 0;
                relu_start_I <= 0;
                dot_start_I <= 0;
                sub_start_I <= 0;
                mul_start_I <= 0;
                conv3_src1_start_address <= src1_address_D;
                conv3_src2_start_address <= src2_address_D;
                conv3_dest_start_address <= dest_address_D;

                conv3_src1_row_size <= src1_row_D;
                conv3_src1_col_size <= src1_col_D;
                conv3_src2_row_size <= src2_row_D;
                conv3_src2_col_size <= src2_col_D;
            end


            4'b1000: begin  // pool
                add_start_I <= 0;
                conv1_start_I <= 0;
                conv2_start_I <= 0;
                conv3_start_I <= 0;
                pool_start_I <= 1;
                relu_start_I <= 0;
                dot_start_I <= 0;
                sub_start_I <= 0;
                mul_start_I <= 0;
                pool_src1_start_address <= src1_address_D;
                // pool_src2_start_address <= src2_address_D;
                pool_dest_start_address <= dest_address_D;

                pool_src1_row_size <= src1_row_D;
                pool_src1_col_size <= src1_col_D;
                pool_src2_row_size <= src2_row_D;
                pool_src2_col_size <= src2_col_D;
            end

            4'b1010: begin  // relu
                add_start_I <= 0;
                conv1_start_I <= 0;
                conv2_start_I <= 0;
                conv3_start_I <= 0;
                pool_start_I <= 0;
                relu_start_I <= 1;
                dot_start_I <= 0;
                sub_start_I <= 0;
                mul_start_I <= 0;
                relu_src1_start_address <= src1_address_D;
                relu_dest_start_address <= dest_address_D;

                relu_src1_row_size <= src1_row_D;
                relu_src1_col_size <= src1_col_D;
                relu_src2_row_size <= src2_row_D;
                relu_src2_col_size <= src2_col_D;
            end

            4'b0110: begin  // dot
                add_start_I <= 0;
                conv1_start_I <= 0;
                conv2_start_I <= 0;
                conv3_start_I <= 0;
                pool_start_I <= 0;
                relu_start_I <= 0;
                dot_start_I <= 1;
                sub_start_I <= 0;
                mul_start_I <= 0;
                dot_src1_start_address <= src1_address_D;
                dot_src2_start_address <= src2_address_D;
                dot_dest_start_address <= dest_address_D;

                dot_src1_row_size <= dot_src1_row_D;
                dot_src1_col_size <= dot_src1_col_D;
                dot_src2_row_size <= dot_src2_row_D;
                dot_src2_col_size <= dot_src1_row_D;
            end

            4'b0010:begin // issue sub
                add_start_I <= 0;
                conv1_start_I <= 0;
                conv2_start_I <= 0;
                conv3_start_I <= 0;
                pool_start_I <= 0;
                relu_start_I <= 0;
                dot_start_I <= 0;
                sub_start_I <= 1;
                mul_start_I <= 0;

                sub_src1_start_address <= src1_address_D;
                sub_src2_start_address <= src2_address_D;
                sub_dest_start_address <= dest_address_D;

                sub_src1_row_size <= src1_row_D;
                sub_src1_col_size <= src1_col_D;
                sub_src2_row_size <= src2_row_D;
                sub_src2_col_size <= src2_col_D;
            
            end 

            4'b0011:begin // issue mul
                add_start_I <= 0;
                conv1_start_I <= 0;
                conv2_start_I <= 0;
                conv3_start_I <= 0;
                pool_start_I <= 0;
                relu_start_I <= 0;
                dot_start_I <= 0;
                sub_start_I <= 0;
                mul_start_I <= 1;

                mul_src1_start_address <= src1_address_D;
                mul_src2_start_address <= src2_address_D;
                mul_dest_start_address <= dest_address_D;


                mul_src1_row_size <= src1_row_D;
                mul_src1_col_size <= src1_col_D;
                mul_src2_row_size <= src2_row_D;
                mul_src2_col_size <= src2_col_D;

            end 

            default: begin
                add_start_I <= 0;
                conv1_start_I <= 0;
                conv2_start_I <= 0;
                conv3_start_I <= 0;
                pool_start_I <= 0;
                relu_start_I <= 0;
                dot_start_I <= 0;
                sub_start_I <= 0;
                mul_start_I <= 0;
            end
        endcase
	 end
    end


    //---------------------------------------------------
    // execute
    //---------------------------------------------------
    // reg add_start_E;
    // reg conv1_start_E;
    // reg pool_start_E;
    // reg relu_start_E;
    // reg dot_start_E;
    // reg sub_start_E;
    // reg mul_start_E;
    reg [4:0] sel_address_mux_E[SRAM_NUM-1:0];
    reg [4:0] sel_writedata_mux_E[SRAM_NUM-1:0];
    reg [4:0] sel_write_en_mux_E[SRAM_NUM-1:0];
    reg [4:0] sel_readdata_mux_E[SRAM_NUM-1:0];

    reg [15:0] start = 16'd0;
    reg [15:0] start_E = 16'd0;
    wire [15:0] done;

    assign add_start = start[0];
    assign conv1_start = start[1];
    assign pool_start = start[2];
    assign relu_start = start[3];
    assign dot_start = start[4];
    assign sub_start = start[5];
    assign mul_start = start[6];
    assign conv2_start = start[7];
    assign conv3_start = start[8];

    // assign add_start = add_start_E;
    // assign conv1_start = conv1_start_E;
    // assign pool_start = pool_start_E;
    // assign relu_start = relu_start_E;
    // assign dot_start = dot_start_E;

    // issue state machine

    localparam IDLE = 1'd0,
               E_HIGH = 1'd1;

    reg [15:0] state;
    reg [15:0] next_state;
    

    genvar i_start;
    generate
        for(i_start = 0; i_start < 9; i_start = i_start+1) begin : gen_start
            always @ (posedge CLOCK_100) begin
                if(reset) begin
                    state[i_start] <= IDLE;
                end
                else begin
                    state[i_start] <= next_state[i_start];
                end
            end

            always @(*) begin
                case(state[i_start])
                    IDLE: begin
                        if (start_E[i_start] == 1) begin
                            next_state[i_start] = E_HIGH;
                        end
                        else begin
                            next_state[i_start] = IDLE;
                        end
                    end 
                    E_HIGH: begin
                        if(done[i_start] == 1) begin
                            next_state[i_start] = E_HIGH;
                        end
                        else begin
                            next_state[i_start] = IDLE;
                        end
                    end
                    default: next_state[i_start] = IDLE;
                    // DONE_LOW: begin
                    //     if(done[i_start]) begin
                    //         next_state[i_start] = DONE_LOW;
                    //     end
                    //     else begin
                    //         next_state[i_start] = IDLE;
                    //     end
                    // end
                endcase
            end

            always @(*) begin
                case(state[i_start])
                    E_HIGH: begin
                        start[i_start] = 1;
                    end
                    IDLE: begin
                        start[i_start] = 0;
                    end
                    default: start[i_start] = 0;
                endcase
            end
        end
    endgenerate

    
    always @(posedge CLOCK_100) begin
        if(reset)begin
            start_E[0]<=0;
            start_E[1]<=0;
            start_E[2]<=0;
            start_E[3]<=0;
            start_E[4]<=0;
            start_E[5]<=0;
            start_E[6]<=0;
            start_E[7]<=0;
            start_E[8]<=0;
        end
        else begin
            start_E[0]<=add_start_I;
            start_E[1]<=conv1_start_I;
            start_E[2]<=pool_start_I;
            start_E[3]<=relu_start_I;
            start_E[4]<=dot_start_I;
            start_E[5]<=sub_start_I;
            start_E[6]<=mul_start_I;
            start_E[7]<=conv2_start_I;
            start_E[8]<=conv3_start_I;
        end
    end

    genvar m;
    generate
        for (m = 0; m < SRAM_NUM; m = m + 1) begin : pipeline_register_E
            always @(posedge CLOCK_100) begin
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
        for (i = 0; i < SRAM_NUM; i = i + 1) begin : mux_gen
            mux25to1 #(.DATA_WIDTH(14)) address_mux (
                .in0(add_src1_address),
                .in1(add_src2_address),
                .in2(add_dest_address),
                .in3(conv1_src1_address),
                .in4(conv1_src2_address),
                .in5(conv1_dest_address),
                .in6(pool_src1_address),
                .in7(pool_dest_address),
                .in8(relu_src1_address),
                .in9(relu_dest_address),
                .in10(dot_src1_address),
                .in11(dot_src2_address),
                .in12(dot_dest_address),
                .in13(sub_src1_address),
                .in14(sub_src2_address),
                .in15(sub_dest_address),
                .in16(mul_src1_address),
                .in17(mul_src2_address),
                .in18(mul_dest_address),
                .in19(conv2_src1_address),
                .in20(conv2_src2_address),
                .in21(conv2_dest_address),
                .in22(conv3_src1_address),
                .in23(conv3_src2_address),
                .in24(conv3_dest_address),
                .sel(sel_address_mux_I[i]),
                .out(sram_address[i]),
				.reset(reset)
            );

            mux25to1 #(.DATA_WIDTH(16)) writedata_mux(
                .in0(add_src1_writedata),
                .in1(add_src2_writedata),
                .in2(add_dest_writedata),
                .in3(conv1_src1_writedata),
                .in4(conv1_src2_writedata),
                .in5(conv1_dest_writedata),
                .in6(pool_src1_writedata),
                .in7(pool_dest_writedata),
                .in8(relu_src1_writedata),
                .in9(relu_dest_writedata),
                .in10(dot_src1_writedata),
                .in11(dot_src2_writedata),
                .in12(dot_dest_writedata),
                .in13(sub_src1_writedata),
                .in14(sub_src2_writedata),
                .in15(sub_dest_writedata),
                .in16(mul_src1_writedata),
                .in17(mul_src2_writedata),
                .in18(mul_dest_writedata),
                .in19(conv2_src1_writedata),
                .in20(conv2_src2_writedata),
                .in21(conv2_dest_writedata),
                .in22(conv3_src1_writedata),
                .in23(conv3_src2_writedata),
                .in24(conv3_dest_writedata),
                .sel(sel_writedata_mux_I[i]),
                .out(sram_writedata[i]),
				.reset(reset)
            );

            mux25to1 #(.DATA_WIDTH(1)) write_en_mux(
                .in0(add_src1_write_en),
                .in1(add_src2_write_en),
                .in2(add_dest_write_en),
                .in3(conv1_src1_write_en),
                .in4(conv1_src2_write_en),
                .in5(conv1_dest_write_en),
                .in6(pool_src1_write_en),
                .in7(pool_dest_write_en),
                .in8(relu_src1_write_en),
                .in9(relu_dest_write_en),
                .in10(dot_src1_write_en),
                .in11(dot_src2_write_en),
                .in12(dot_dest_write_en),
                .in13(sub_src1_write_en),
                .in14(sub_src2_write_en),
                .in15(sub_dest_write_en),
                .in16(mul_src1_write_en),
                .in17(mul_src2_write_en),
                .in18(mul_dest_write_en),
                .in19(conv2_src1_write_en),
                .in20(conv2_src2_write_en),
                .in21(conv2_dest_write_en),
                .in22(conv3_src1_write_en),
                .in23(conv3_src2_write_en),
                .in24(conv3_dest_write_en),
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


    mux16to1 #(.DATA_WIDTH(16)) conv1_src1_mux(
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
        .sel(sel_readdata_mux_I[2]),
        .out(conv1_src1_readdata),
		  .reset(reset)
    );


    mux16to1 #(.DATA_WIDTH(16)) conv1_src2_mux(
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
        .sel(sel_readdata_mux_I[3]),
        .out(conv1_src2_readdata),
		  .reset(reset)
    );

    mux16to1 #(.DATA_WIDTH(16)) conv2_src1_mux(
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
        .sel(sel_readdata_mux_I[12]),
        .out(conv2_src1_readdata),
		  .reset(reset)
    );


    mux16to1 #(.DATA_WIDTH(16)) conv2_src2_mux(
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
        .sel(sel_readdata_mux_I[13]),
        .out(conv2_src2_readdata),
		  .reset(reset)
    );


    mux16to1 #(.DATA_WIDTH(16)) conv3_src1_mux(
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
        .sel(sel_readdata_mux_I[14]),
        .out(conv3_src1_readdata),
		  .reset(reset)
    );


    mux16to1 #(.DATA_WIDTH(16)) conv3_src2_mux(
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
        .sel(sel_readdata_mux_I[15]),
        .out(conv3_src2_readdata),
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

    
    mux16to1 #(.DATA_WIDTH(16)) sub_src1_mux(
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
        .sel(sel_readdata_mux_I[8]),
        .out(sub_src1_readdata),
		  .reset(reset)
    );

    mux16to1 #(.DATA_WIDTH(16)) sub_src2_mux(
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
        .sel(sel_readdata_mux_I[9]),
        .out(sub_src2_readdata),
		  .reset(reset)
    );

    mux16to1 #(.DATA_WIDTH(16)) mul_src1_mux(
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
        .sel(sel_readdata_mux_I[10]),
        .out(mul_src1_readdata),
		  .reset(reset)
    );

    mux16to1 #(.DATA_WIDTH(16)) mul_src2_mux(
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
        .sel(sel_readdata_mux_I[11]),
        .out(mul_src2_readdata),
		  .reset(reset)
    );
	//---------------------------------------------------
    // Commit
    //---------------------------------------------------
	 
	// reg add_done_prev;
    // reg conv1_done_prev;
    // reg pool_done_prev;
    // reg relu_done_prev;
    // reg dot_done_prev;

    
    reg [15:0] done_prev;

    assign done[0] = add_done;
    assign done[1] = conv1_done;
    assign done[2] = pool_done;
    assign done[3] = relu_done;
    assign done[4] = dot_done;
    assign done[5] = sub_done;
    assign done[6] = mul_done;
    assign done[7] = conv2_done;
    assign done[8] = conv3_done;

    genvar i_done;
    generate
        for(i_done = 0; i_done<15; i_done= i_done + 1) begin : gen_done_prev
            always @ (posedge CLOCK_100) begin
                if(reset) begin
                    done_prev[i_done] <= 1;
                end
                else begin
                    done_prev[i_done] <= done[i_done];
                end
            end
        end
    endgenerate

    // always @ (posedge CLOCK_100) begin
    //     if(reset) begin
    //         add_done_prev <= 1;
    //         conv1_done_prev <= 1;
    //         pool_done_prev <= 1;
    //         relu_done_prev <= 1;
    //         dot_done_prev <= 1;
    //     end
    //     else begin
    //         add_done_prev <= add_done;
    //         conv1_done_prev <= conv1_done;
    //         pool_done_prev <= pool_done;
    //         relu_done_prev <= relu_done;
    //         dot_done_prev <= dot_done;
    //     end
    // end
    reg [15:0] commit_buffer;
    reg [15:0] write_back_buffer;


    genvar i_commit;
    generate
        for(i_commit = 0; i_commit < 16; i_commit = i_commit + 1) begin : gen_commit
            always @(posedge CLOCK_100) begin
                if(reset) begin
                    commit_buffer[i_commit] <= 1'b0;
                end
                else begin
                    if(write_back_buffer[i_commit] == 0) begin
                        if(~done_prev[i_commit] && done[i_commit]) begin
                            commit_buffer[i_commit] <= 1'b1; 
                        end
                    end
                    else begin
                        commit_buffer[i_commit] <= 1'b0; 
                    end
                    
                end
            end
        end
    endgenerate
    

    //---------------------------------------------------
    // Write Back
    //---------------------------------------------------

    reg [3:0] write_index;
    

    always @(posedge CLOCK_100) begin
        if(reset) begin
            write_index <= 4'd0;
        end
        else begin
            write_index <= write_index + 1;
            if(commit_buffer[write_index] == 1) begin
                inst_done_sram_address <= write_index;
                inst_done_sram_writedata <= 8'b11111111;
                inst_done_sram_write <= 1;
                write_back_buffer[write_index] <= 1;
            end
            else begin
                inst_done_sram_address <= 9'd0;
                inst_done_sram_writedata <= 8'b0;
                inst_done_sram_write <= 0;
                write_back_buffer[write_index] <= 0;
            end
            
        end
    end 

    // always @(posedge CLOCK_100) begin
    //     if(reset) begin
    //         inst_done_sram_address <= 9'd0;
    //         inst_done_sram_writedata <= 8'b00000000;
    //         inst_done_sram_write <=0;
    //     end
    //     else begin
    //         if(~done_prev[0] && done[0]) begin
    //             inst_done_sram_address <= 9'd0;
    //             inst_done_sram_writedata <= 8'b11111111;
    //             inst_done_sram_write <= 1;
    //         end

    //         else if(~done_prev[1] && done[1]) begin
    //             inst_done_sram_address <= 9'd1;
    //             inst_done_sram_writedata <= 8'b11111111;
    //             inst_done_sram_write <= 1;
    //         end
    //         else if(~done_prev[2] && done[2])begin
    //             inst_done_sram_address <= 9'd2;
    //             inst_done_sram_writedata <= 8'b11111111;
    //             inst_done_sram_write <= 1;
    //         end
    //         else if(~done_prev[3] && done[3])begin
    //             inst_done_sram_address <= 9'd3;
    //             inst_done_sram_writedata <= 8'b11111111;
    //             inst_done_sram_write <= 1;
    //         end
    //         else if(~done_prev[4] && done[4])begin
    //             inst_done_sram_address <= 9'd4;
    //             inst_done_sram_writedata <= 8'b11111111;
    //             inst_done_sram_write <= 1;
    //         end
            
    //     end
    // end
    
endmodule
