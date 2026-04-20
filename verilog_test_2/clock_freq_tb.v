modulule clk_freq_tb;

reg clk,rst_n;
wire clk1;

clk_freq dut #(.clk (10),.freq (3)) dut ((.clk(clk),.rst_n(rst_n),.clk1(clk1));

initial begin 

    $dumpfile("clk_freq.vcd");
    $dumpvars(0);

    $monitor("time=%0t | clk=%b,rst_n=%b,clk1=%b",$time,clk,rst_n,clk1);

    clk = 0;
    rst_n = 0;

    @(posedge clk);
    rst_n = 1;

    repeat (10)@(posedge clk);

end

endmodule
