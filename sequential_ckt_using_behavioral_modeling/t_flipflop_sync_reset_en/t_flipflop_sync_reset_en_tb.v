module t_flipflop_sync_en_tb;

reg t;
reg rst;
reg clk;
reg en;
wire q;

t_flipflop_sync_en dut (.t(t),.rst(rst),.clk(clk),.en(en),.q(q));
 
always #5 clk= ~clk;  
 
initial begin 

    $dumpfile("t_flipflop_sync_en.vcd");
    $dumpvars(0,t_flipflop_sync_en_tb);

    $monitor("time=%0t | t=%b,rst=%b,clk=%b,en=%b | q=%b",$time,t,rst,clk,en,q);
      clk=0;
      rst=1;
      t=0;
      en=0;
  
     
      #12 rst=0;
      #8 en=1;
      #9 t=1;
      #12 t=0;
      #18 t=1;
      #4 en=0;
     
     $finish;

$finish;
end

endmodule
