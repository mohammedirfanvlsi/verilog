module clock_gating_tb;

reg clk,en;

wire gated_clk;

clock_gating dut (.clk(clk),.en(en),.gated_clk(gated_clk));

always #5 clk = ~clk;


initial begin

    $dumpfile("clock_gating.vcd");
    $dumpvars(0,clock_gating_tb);

    $monitor("time=%0t | clk=%b,en=%b | gated_clk = %b",$time,clk,en,gated_clk);

end

initial begin

    clk = 0;
    en=0;

    @(negedge clk);
    en = 1;
    repeat(2)@(posedge clk)

    @(negedge clk);
    en=0;
    repeat(2)@(posedge clk)


    @(negedge clk);
    en = 1;
    repeat(2)@(posedge clk)


    $finish;

end

endmodule
