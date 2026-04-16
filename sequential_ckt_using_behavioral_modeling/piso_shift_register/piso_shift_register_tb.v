module piso_shift_register_tb;

reg [3:0]din;
reg rst_n;
reg clk;
reg load;
wire dout;
piso_shift_register dut (.din(din),.rst_n(rst_n),.clk(clk),.load(load),.dout(dout));
 
always #5 clk= ~clk;  


initial begin 

    $dumpfile("piso_shift_register.vcd");
    $dumpvars(0,piso_shift_register_tb);

    $monitor("time=%0t | din=%b,rst_n=%b,clk=%b,load=%b | dout=%b",$time,din,rst_n,clk,load,dout);
      clk=0;
      rst_n=0;
      din=4'b0000;
      load=1;
      #3 din=4'b1010;

    #3 rst_n=1;
    #16 load=0;

        
    
 #50 $finish;
 end

endmodule
