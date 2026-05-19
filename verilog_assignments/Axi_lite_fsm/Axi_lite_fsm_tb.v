module axi_lite_fsm_tb;

    reg clk;
    reg rst_n;
    reg start_write;

    wire awvalid;
    reg  awready;

    wire wvalid;
    reg  wready;

    reg  bvalid;
    wire bready;

    // DUT
    axi_lite_fsm dut (
        .clk(clk),
        .rst_n(rst_n),
        .start_write(start_write),
        .awvalid(awvalid),
        .awready(awready),
        .wvalid(wvalid),
        .wready(wready),
        .bvalid(bvalid),
        .bready(bready)
    );

    // CLOCK
    always #5 clk = ~clk;

    initial begin
        $dumpfile("axi_lite_fsm.vcd");
        $dumpvars(0, axi_lite_fsm_tb);

        $monitor("t=%0t | awv=%b awr=%b | wv=%b wr=%b | bv=%b br=%b",
                 $time, awvalid, awready, wvalid, wready, bvalid, bready);
    end

    initial begin
        // INIT
        clk = 0;
        rst_n = 0;
        start_write = 0;
        awready = 0;
        wready  = 0;
        bvalid  = 0;

        // RESET
        #20 rst_n = 1;

        // START WRITE
        @(posedge clk);
        start_write = 1;
        @(posedge clk);
        start_write = 0;

        // ADDRESS HANDSHAKE
        repeat (2) @(posedge clk);
        awready = 1;
        @(posedge clk);
        awready = 0;

        // DATA HANDSHAKE
        repeat (2) @(posedge clk);
        wready = 1;
        @(posedge clk);
        wready = 0;

        // RESPONSE HANDSHAKE
        repeat (2) @(posedge clk);
        bvalid = 1;
        @(posedge clk);
        bvalid = 0;

        repeat (5) @(posedge clk);
        $finish;
    end

endmodule
