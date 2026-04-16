module sr_flipflop_async_en_tb;

reg s;
reg r;
reg rst_n;
reg clk;
reg en;
wire q;

sr_flipflop_async_en dut (.s(s),.r(r),.rst_n(rst_n),.clk(clk),.en(en),.q(q));
 
always #5 clk= ~clk;  
 
initial begin 

    $dumpfile("sr_flipflop_async_en.vcd");
    $dumpvars(0,sr_flipflop_async_en_tb);

    $monitor("time=%0t | s=%b,r=%b,rst_n=%b,clk=%b,en=%b | q=%b",$time,s,r,rst_n,clk,en,q);
      clk=0;
      rst_n=0;
      s=0;r=0;
      en =0;
      #9 rst_n=1;
       #10 en=1;
      #11 s=0;r=0;
       #11 s=0;r=1;
        #11 s=1;r=0;
         #11 s=1;r=1;
           

$finish;
end

endmodule
