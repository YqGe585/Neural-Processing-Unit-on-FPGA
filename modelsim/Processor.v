module NPU(
    input CLOCK_50,
    input CLOCK_300,
    input reset
);
    parameter SRAM_NUM = 5'd19;
    // all modules are instantiated here
    wire [15:0] sram_readdata [19:0];
    wire [15:0] sram_writedata [19:0];
    wire [11:0] sram_address [19:0]; 
    wire sram_write [19:0];  

    wire [127:0] inst_sram_readdata ;
    reg [127:0] inst_sram_writedata ;
    reg [8:0] inst_sram_address = 9'd0; 
    reg inst_sram_write = 0;
    
    M10K_inst_sram inst_sram(
        .clk(CLOCK_300),
        .q(inst_sram_readdata),
        .d(inst_sram_writedata),
        .address(inst_sram_address),
        .we(inst_sram_write)
    );

    genvar k;
    generate
        for (k = 0; k < 20; k = k + 1) begin : sram_instances
            M10K_sram sram(
                .q(sram_readdata[k]),
                .d(sram_writedata[k]),
                .address(sram_address[k]),
                .we(sram_write[k]),
                .clk(CLOCK_300)
            );
        end
    endgenerate

    
    wire [11:0] add_src1_address, add_src2_address, add_dest_address;
    reg [11:0] add_src1_start_address, add_src2_start_address, add_dest_start_address;
    wire [15:0] add_dest_readdata; 
    wire [15:0] add_src1_readdata;
    wire [15:0] add_src2_readdata ;
    wire [15:0] add_dest_writedata, add_src1_writedata, add_src2_writedata ;
    reg [5:0] add_src1_row_size;
    reg [5:0] add_src1_col_size;
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

    // Single Fetch Signle Issue Superscalar Out of Order Processor starts here

    //---------------------------------------------------
    // Fetch
    //---------------------------------------------------
    reg [127:0] inst_D ;

    always @(posedge CLOCK_50) begin
        if(reset) begin
            inst_D <= 0;
            inst_sram_address <= 128'b0;
        end
        else begin
            if(inst_sram_readdata == 128'd0) begin
                inst_sram_address <= inst_sram_address;
                inst_D <= 128'b0;
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
    reg [11:0] src1_address_D; //sram offset
    reg [11:0] src2_address_D;
    reg [11:0] dest_address_D;
    reg [4:0] src1_sram_num_D; // sram number(use for select)
    reg [4:0] src2_sram_num_D;
    reg [4:0] dest_sram_num_D;
    reg [9:0] src1_row_D;
    reg [9:0] src1_col_D;
    reg [4:0] src2_row_D;
    reg [4:0] src2_col_D;
    reg [3:0] sel_D;
    reg [4:0] sel_address_mux_D[19:0];
    reg [4:0] sel_writedata_mux_D[19:0];
    reg [4:0] sel_write_en_mux_D[19:0];
    reg [4:0] sel_readdata_mux_D[19:0];
    // reg [4:0] sel_add_src1_readdata_mux_D;
    // reg [4:0] sel_add_src2_readdata_mux_D;

    reg [11:0] src1_sram_num;
    reg [11:0] src2_sram_num;
    reg [11:0] dest_sram_num;

    // always @(posedge CLOCK_50) begin
    //     if(reset) begin
    //         inst_D <= 128'd0;
    //     end
    //     else begin
    //         inst_D <= inst_sram_writedata;
    //     end
    // end

    // assign inst_D = inst_sram_readdata;
    integer i0;

    always @(*) begin
        src1_sram_num = SRAM_NUM - (inst_D[111:104]>>1);
        src2_sram_num = SRAM_NUM - (inst_D[79:72]>>1);
        dest_sram_num = SRAM_NUM - (inst_D[47:40]>>1);
    end

    always @(posedge CLOCK_50) begin
        if(reset) begin
            src1_address_D <= 12'd0;
            src2_address_D <= 12'd0;
            dest_address_D <= 12'd0;
            src1_sram_num_D <= 5'd0;
            src2_sram_num_D <= 5'd0;
            dest_sram_num_D <= 5'd0;
            src1_row_D <= 10'd0;
            src1_col_D <= 10'd0;
            src2_row_D <= 5'd0;
            src2_col_D <= 5'd0;
            sel_D <= 4'b0000;
            sel_address_mux_D[src1_sram_num_D] <= 5'd31;
            sel_address_mux_D[src2_sram_num_D] <= 5'd31;
            sel_address_mux_D[dest_sram_num_D] <= 5'd31;
            sel_writedata_mux_D[src1_sram_num] <= 5'd31;
            sel_writedata_mux_D[src2_sram_num] <= 5'd31;
            sel_writedata_mux_D[dest_sram_num] <= 5'd31;
            sel_write_en_mux_D[src1_sram_num] <= 5'd31;
            sel_write_en_mux_D[src2_sram_num] <= 5'd31;
            sel_write_en_mux_D[dest_sram_num] <= 5'd31;
            for (i0 = 0; i0 < 20; i0 = i0 + 1) begin
                sel_readdata_mux_D[i0] <= 5'd0;
            end
        end
        else begin
            case(inst_D[127:124])
                4'b0001: begin // add
                    src1_address_D <= inst_D[103:92];
                    src2_address_D <= inst_D[72:60];
                    dest_address_D <= inst_D[47:28];
                    src1_sram_num_D <= src1_sram_num;
                    src2_sram_num_D <= src2_sram_num;
                    dest_sram_num_D <= dest_sram_num;
                    src1_row_D <= inst_D[27:19];
                    src1_col_D <= inst_D[18:10];
                    src2_row_D <= 5'd0;
                    src2_col_D <= 5'd0;
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
                    // src1_address_D <= inst_D[123:92];
                    // src2_address_D <= inst_D[91:60];
                    // dest_address_D <= inst_D[59:28];
                    src1_address_D <= inst_D[103:92];
                    src2_address_D <= inst_D[72:60];
                    dest_address_D <= inst_D[47:28];
                    src1_sram_num_D <= src1_sram_num;
                    src2_sram_num_D <= src2_sram_num;
                    dest_sram_num_D <= dest_sram_num;
                    src1_row_D <= inst_D[27:19];
                    src1_col_D <= inst_D[18:10];
                    src2_row_D <= inst_D[9:5];
                    src2_col_D <= inst_D[4:0];
                    sel_address_mux_D[src1_sram_num] <= 5'd0;
                    sel_address_mux_D[3] <= src1_sram_num;
                    sel_address_mux_D[4] <= src2_sram_num;
                end
                4'b1000: begin // pool
                    // src1_address_D <= inst_D[123:92];
                    // src2_address_D <= inst_D[91:60];
                    // dest_address_D <= inst_D[59:28];
                    src1_address_D <= inst_D[103:92];
                    src2_address_D <= inst_D[72:60];
                    dest_address_D <= inst_D[47:28];
                    src1_sram_num_D <= src1_sram_num;
                    src2_sram_num_D <= src2_sram_num;
                    dest_sram_num_D <= dest_sram_num;
                    src1_row_D <= inst_D[27:19];
                    src1_col_D <= inst_D[18:10];
                    src2_row_D <= inst_D[9:5];
                    src2_col_D <= inst_D[4:0];
                    sel_address_mux_D[src1_sram_num] <= 5'd0;
                    sel_address_mux_D[src2_sram_num] <= 5'd1;
                    sel_address_mux_D[dest_sram_num] <= 5'd2;
                end
                4'b1010: begin // Relu
                    // src1_address_D <= inst_D[123:92];
                    // src2_address_D <= inst_D[91:60];
                    // dest_address_D <= inst_D[59:28];
                    src1_address_D <= inst_D[103:92];
                    src2_address_D <= inst_D[72:60];
                    dest_address_D <= inst_D[47:28];
                    src1_sram_num_D <= src1_sram_num;
                    src2_sram_num_D <= src2_sram_num;
                    dest_sram_num_D <= dest_sram_num;
                    src1_row_D <= inst_D[27:19];
                    src1_col_D <= inst_D[18:10];
                    src2_row_D <= inst_D[9:5];
                    src2_col_D <= inst_D[4:0];
                    sel_address_mux_D[src1_sram_num] <= 5'd0;
                    sel_address_mux_D[src2_sram_num] <= 5'd1;
                    sel_address_mux_D[dest_sram_num] <= 5'd2;
                end
                default: begin 
                    src1_address_D <= 12'd0;
                    src2_address_D <= 12'd0;
                    dest_address_D <= 12'd0;
                    src1_sram_num_D <= 5'd0;
                    src2_sram_num_D <= 5'd0;
                    dest_sram_num_D <= 5'd0;
                    src1_row_D <= 10'd0;
                    src1_col_D <= 10'd0;
                    src2_row_D <= 5'd0;
                    src2_col_D <= 5'd0;
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
    reg [11:0] src1_address_I;
    reg [11:0] src2_address_I;
    reg [11:0] dest_address_I;
    reg [4:0] src1_sram_num_I; // sram number(use for select)
    reg [4:0] src2_sram_num_I;
    reg [4:0] dest_sram_num_I;
    reg [9:0] src1_row_I;
    reg [9:0] src1_col_I;
    reg [4:0] src2_row_I;
    reg [4:0] src2_col_I;
    reg [3:0] sel_I;
    reg add_start_I;
    reg [4:0] sel_address_mux_I[19:0];
    reg [4:0] sel_writedata_mux_I[19:0];
    reg [4:0] sel_write_en_mux_I[19:0];
    reg [4:0] sel_readdata_mux_I[19:0];


    genvar j;
    generate
        for (j = 0; j < 20; j = j + 1) begin : pipeline_register_I
            always @(posedge CLOCK_50) begin
                sel_address_mux_I[j]<= sel_address_mux_D[j];
                sel_writedata_mux_I[j]<= sel_writedata_mux_D[j];
                sel_write_en_mux_I[j]<= sel_write_en_mux_D[j];
                sel_readdata_mux_I[j]<= sel_readdata_mux_D[j];
            end
        end
    endgenerate

    //pipeline register
    always @(posedge CLOCK_50) begin
        if(reset) begin
            sel_I <= 4'd0;
            src1_address_I <= 12'd0;
            src2_address_I <= 12'd0;
            dest_address_I <= 12'd0;
            src1_sram_num_I <= 5'd0;
            src2_sram_num_I <= 5'd0;
            dest_sram_num_I <= 5'd0;
            src1_row_I <= 5'd0;
            src1_col_I <= 5'd0;
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
        case(sel_D)
            4'b0001:begin // issue add
                add_start_I <= 1;
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

            default: begin
                add_start_I <= 0;
                // add_src1_start_address <= 11'd0;
                // add_src2_start_address <= 11'd0;

                // add_src1_address <= 11'd0;
                // add_src1_readdata <= 16'd0;
                // add_src1_writedata <= 16'd0;
                // add_src1_write_en <= 0;

                // add_src2_address <= 11'd0;
                // add_src2_readdata <= 16'd0;
                // add_src2_writedata <= 16'd0;
                // add_src2_write_en <= 0;

                // add_src1_row_size <= 5'd0;
                // add_src1_col_size <= 5'd0;
                // add_src2_row_size <= 5'd0;
                // add_src2_col_size <= 5'd0;

                // add_dest_address <= 11'd0;
                // add_dest_readdata <= 16'd0;
                // add_dest_writedata <= 16'd0;
                // add_dest_write_en <= 0;
            end
        endcase
    end

    //---------------------------------------------------
    // execute
    //---------------------------------------------------
    reg add_start_E;
    reg [4:0] sel_address_mux_E[19:0];
    reg [4:0] sel_writedata_mux_E[19:0];
    reg [4:0] sel_write_en_mux_E[19:0];
    reg [4:0] sel_readdata_mux_E[19:0];

    assign add_start = add_start_E;
    
    always @(posedge CLOCK_50) begin
        if(reset)begin
            add_start_E <=0;
        end
        else begin
            add_start_E<=add_start_I;
        end
    end

    genvar m;
    generate
        for (m = 0; m < 20; m = m + 1) begin : pipeline_register_E
            always @(posedge CLOCK_50) begin
                sel_address_mux_E[m]<= sel_address_mux_I[m];
                sel_writedata_mux_E[m]<= sel_writedata_mux_I[m];
                sel_write_en_mux_E[m]<= sel_write_en_mux_I[m];
                sel_readdata_mux_E[m]<= sel_readdata_mux_I[m];
            end
        end
    endgenerate

    genvar i;
    generate
        for (i = 0; i < 20; i = i + 1) begin : mux_gen
            mux24to1 #(.DATA_WIDTH(12)) address_mux (
                .in0(add_src1_address),
                .in1(add_src2_address),
                .in2(add_dest_address),
                .in3(),
                .in4(),
                .in5(),
                .in6(),
                .in7(),
                .in8(),
                .in9(),
                .in10(),
                .in11(),
                .in12(),
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
                .out(sram_address[i])
            );

            mux24to1 #(.DATA_WIDTH(16)) writedata_mux(
                .in0(add_src1_writedata),
                .in1(add_src2_writedata),
                .in2(add_dest_writedata),
                .in3(),
                .in4(),
                .in5(),
                .in6(),
                .in7(),
                .in8(),
                .in9(),
                .in10(),
                .in11(),
                .in12(),
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
                .out(sram_writedata[i])
            );

            mux24to1 #(.DATA_WIDTH(1)) write_en_mux(
                .in0(add_src1_write_en),
                .in1(add_src2_write_en),
                .in2(add_dest_write_en),
                .in3(),
                .in4(),
                .in5(),
                .in6(),
                .in7(),
                .in8(),
                .in9(),
                .in10(),
                .in11(),
                .in12(),
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
                .out(sram_write[i])
            );

        end
    endgenerate

    mux24to1 #(.DATA_WIDTH(16)) add_src1_mux(
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
        .in12(sram_readdata[12]),
        .in13(sram_readdata[13]),
        .in14(sram_readdata[14]),
        .in15(sram_readdata[15]),
        .in16(sram_readdata[16]),
        .in17(sram_readdata[17]),
        .in18(sram_readdata[18]),
        .in19(sram_readdata[19]),
        .in20(),
        .in21(),
        .in22(),
        .in23(),
        .sel(sel_readdata_mux_I[0]),
        .out(add_src1_readdata)
    );

    mux24to1 #(.DATA_WIDTH(16)) add_src2_mux(
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
        .in12(sram_readdata[12]),
        .in13(sram_readdata[13]),
        .in14(sram_readdata[14]),
        .in15(sram_readdata[15]),
        .in16(sram_readdata[16]),
        .in17(sram_readdata[17]),
        .in18(sram_readdata[18]),
        .in19(sram_readdata[19]),
        .in20(),
        .in21(),
        .in22(),
        .in23(),
        .sel(sel_readdata_mux_I[1]),
        .out(add_src2_readdata)
    );

    //---------------------------------------------------
    // Commit
    //---------------------------------------------------





endmodule