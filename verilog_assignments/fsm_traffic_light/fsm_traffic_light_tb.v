module fsm_traffic_light_tb;

reg rst_n;
reg clk;

wire red;
wire green;
wire yellow;

fsm_traffic_light dut (.rst_n(rst_n),.clk(clk),.red(red),.green(green),.yellow(yellow));

always #5 clk = ~clk;

initial begin

    $dumpfile("fsm_traffic_light.vcd");
    $dumpvars(0,fsm_traffic_light_tb);

    $monitor("time=%0t | rst_n=%b,clk=%b | red=%b,green=%b,yellow=%b ",$time,rst_n,clk,red,green,yellow);

    clk=0;
    rst_n=0;


    @(posedge clk);
    rst_n=1;

  repeat (4) @(posedge clk);

  




    $finish;

end

endmodule
