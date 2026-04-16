module t_latch_tb;

reg t;
reg rst_n;
reg en;
wire q;

t_latch dut (.t(t),.rst_n(rst_n),.en(en),.q(q));
   
 
initial begin 

    $dumpfile("t_latch.vcd");
    $dumpvars(0,t_latch_tb);

    $monitor("time=%0t | t=%b,rst_n=%b,en=%b | q=%b",$time,t,rst_n,en,q);
      en=0;
      rst_n=0;
      t=0;
     #2 en=1;
    #3 rst_n=1;

     #3 t=1;
           
     #3 t=0;
      #3 t=1;

#3 $finish;
end

endmodule
