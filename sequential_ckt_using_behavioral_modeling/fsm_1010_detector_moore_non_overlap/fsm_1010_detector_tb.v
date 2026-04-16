module fsm_seq_detector_tb;

reg din;
reg rst_n;
reg clk;

wire detect;

fsm_seq_detector dut (.din(din),.rst_n(rst_n),.clk(clk),.detect(detect));

always #5 clk = ~clk;

initial begin

    $dumpfile("fsm_seq_detector.vcd");
    $dumpvars(0,fsm_seq_detector_tb);

    $monitor("time=%0t | din=%b,rst_n=%b,clk=%b | detect=%b ", $time,din,rst_n,clk,detect);

    clk=0;
    rst_n=0;
    din=0;

    @(posedge clk);
    rst_n=1;

    din=1;
    @(posedge clk);

    din=0;
    @(posedge clk);

    
    din=1;
    @(posedge clk);

     
    din=0;
    @(posedge clk);

    
    din=1;
    @(posedge clk);

    
    din=0;
    @(posedge clk);


$finish;

end
endmodule
