module sipo_shift_register_tb;

reg din;
reg rst_n;
reg clk;
wire [3:0]dout;
sipo_shift_register dut (.din(din),.rst_n(rst_n),.clk(clk),.dout(dout));
 
always #5 clk= ~clk;  

integer i;
initial begin 

    $dumpfile("sipo_shift_register.vcd");
    $dumpvars(0,sipo_shift_register_tb);

    $monitor("time=%0t | din=%b,rst_n=%b,clk=%b | dout=%b",$time,din,rst_n,clk,dout);
      clk=0;
      rst_n=0;
      din=0;
  

    #12 rst_n=1;

 for(i=0;i<16;i=i+1)begin
    
    din=i[0];
    #10;
     
end
  $finish;
end

endmodule
