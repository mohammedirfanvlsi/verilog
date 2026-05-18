module clock_gating_tb;

reg clk,enable;
wire gated_clk;

clock_gating dut (.clk(clk),.enable(enable),.gated_clk(gated_clk));

always #5 clk = ~clk;


initial begin

    $dumpfile("clock_gating.vcd");
    $dumpvars(0,clock_gating_tb);

    $monitor("time = %0t | clk =%b ,enable = %b | gated_clk = %b ",$time,clk,enable,gated_clk);

end

initial begin

    clk = 0;
    enable = 0;


    @(posedge clk);
    enable =1;

    repeat (5)@(posedge clk);

    $finish;

end

endmodule

