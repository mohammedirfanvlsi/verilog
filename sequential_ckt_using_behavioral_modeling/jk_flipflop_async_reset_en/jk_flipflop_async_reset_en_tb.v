module jk_flipflop_async_en_tb;

reg j;
reg k;
reg rst_n;
reg clk;
reg en;
wire q;

jk_flipflop_async_en dut (.j(j),.k(k),.rst_n(rst_n),.clk(clk),.en(en),.q(q));
 
always #5 clk= ~clk;  
 
initial begin 

    $dumpfile("jk_flipflop_async_en.vcd");
    $dumpvars(0,jk_flipflop_async_en_tb);

    $monitor("time=%0t | j=%b,k=%b,rst_n=%b,clk=%b,en=%b | q=%b",$time,j,k,rst_n,clk,en,q);
      clk=0;
      rst_n=0;
      j=0;k=0;
      en =0;
      #9 rst_n=1;
       #10 en=1;
      #11 j=0;k=0;
       #11 j=0;k=1;
        #11 j=1;k=0;
         #11 j=1;k=1;
           

#11 $finish;
end

endmodule
