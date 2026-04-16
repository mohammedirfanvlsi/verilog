module d_latch_tb;

reg d;
reg rst_n;
reg en;
wire q;

d_latch dut (.d(d),.rst_n(rst_n),.en(en),.q(q));
   
 
initial begin 

    $dumpfile("d_latch.vcd");
    $dumpvars(0,d_latch_tb);

    $monitor("time=%0t | d=%b,rst_n=%b,en=%b | q=%b",$time,d,rst_n,en,q);
      en=0;
      rst_n=0;
      d=0;
     #2 en=1;
    #3 rst_n=1;

     #3 d=1;
           
     #3 d=0;
      #3 d=1;

#3 $finish;
end

endmodule
