module d_flipflop_sync_en_tb;

reg d;
reg rst;
reg clk;
reg en;
wire q;

d_flipflop_sync_en dut (.d(d),.rst(rst),.clk(clk),.en(en),.q(q));
 
always #5 clk= ~clk;  
 
initial begin 

    $dumpfile("d_flipflop_sync_en.vcd");
    $dumpvars(0,d_flipflop_sync_en_tb);

    $monitor("time=%0t | d=%b,rst=%b,clk=%b,en=%b | q=%b",$time,d,rst,clk,en,q);
      clk=0;
      rst=1;
      d=0;
      en=0;
  
     
      #12 rst=0;
      #8 en=1;
      #9 d=1;
      #12 d=0;
      #18 d=1;
      #4 en=0;
     
     $finish;

$finish;
end

endmodule
