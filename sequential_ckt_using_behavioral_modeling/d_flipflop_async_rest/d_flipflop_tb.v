module d_flipflop_tb;

reg d;
reg rst_n;
reg clk;
wire q;

d_flipflop dut (.d(d),.rst_n(rst_n),.clk(clk),.q(q));
 
always #5 clk= ~clk;  
 
initial begin 

    $dumpfile("d_flipflop.vcd");
    $dumpvars(0,d_flipflop_tb);

    $monitor("time=%0t | d=%b,rst_n=%b,clk=%b | q=%b",$time,d,rst_n,clk,q);
      clk=0;
      rst_n=0;
      d=0;
  
    #12 rst_n=1;

     #10 d=1;
           
     #10 d=0;
      #10 d=1;

$finish;
end

endmodule
