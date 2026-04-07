module ripple_counter_tb;

reg rst_n;
reg clk;

wire [3:0]q;

ripple_counter dut (.rst_n(rst_n),.clk(clk),.q(q));

always #5 clk=~clk;

initial begin 

    $dumpfile("ripple_counter.vcd");
    $dumpvars(0,ripple_counter_tb);

    $monitor("time=%0t | rst_n=%b,clk=%b | q=%b",$time,rst_n,clk,q);

    clk=0;
    rst_n=0;

    @(posedge clk);
    rst_n=1;

  repeat (20) @(posedge clk);

  $finish;

  end
  endmodule
