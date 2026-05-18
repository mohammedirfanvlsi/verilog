module memory_arbiter_fsm_tb;

reg clk,rst_n;
reg req0,req1;

wire grant0,grant1;

memory_arbiter_fsm dut (.clk(clk),.rst_n(rst_n),.req0(req0),.req1(req1),.grant0(grant0),.grant1(grant1));

always #5 clk = ~clk;

initial begin

    $dumpfile("memory_arbiter_fsm.vcd");
    $dumpvars(0,memory_arbiter_fsm_tb);

    $monitor("time = %0t | clk = %b, rst_n = %b , req0 = %b,req1 = %b | grant0 = %b,grant1 = %b",$time,clk,rst_n,req0,req1,grant0,grant1);

end

initial begin

    clk = 0;
    rst_n = 0;
    req0 = 0;
    req1 = 0;


    @(posedge clk);
    rst_n = 1;

    req1 = 1;
    @(posedge clk);
    @(posedge clk);
    req1 = 0;


    req0 = 1;
    @(posedge clk);

    repeat (2)@(posedge clk);

    $finish;

end

endmodule





