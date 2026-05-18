module freq_tb;

reg clk,rst_n;
wire freq_div_4;

frequency_divider_by_4 dut(.clk(clk),.rst_n(rst_n),.freq_div_4(freq_div_4));

always #5 clk = ~clk;

initial begin 

    $dumpfile("freq.vcd");
    $dumpvars(0,freq_tb);

    $monitor("time = %0t | clk = %b ,rst_n = %b | freq_div_4 = %b",$time,clk,rst_n,freq_div_4);

end

initial begin

    clk = 0;
    rst_n = 0;


    @(posedge clk);

    rst_n = 1;

    repeat (5)@(posedge clk);

    $finish;

end

endmodule


