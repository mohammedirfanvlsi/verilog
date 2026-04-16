module fsm_111_detector_tb;

reg d;
reg rst_n,clk;

wire detect;

fsm_111_detector dut (.d(d),.rst_n(rst_n),.clk(clk),.detect(detect));

always #5 clk = ~clk;

initial begin

    $dumpfile("fsm_111_detector.vcd");
    $dumpvars(0,fsm_111_detector_tb);

    $monitor("time =%0t | d=%b,rst_n=%b,clk=%b | detect=%b ",$time,d,rst_n,clk,detect);

end

initial begin

    clk =0;
    d=0;
    rst_n=0;

    @(posedge clk);
    rst_n=1;

    d=1;
    @(posedge clk);

    d=1;
    @(posedge clk);

     d=1;
    @(posedge clk);

     d=1;
    @(posedge clk);

     d=1;
    @(posedge clk);

    $finish;

end

endmodule




