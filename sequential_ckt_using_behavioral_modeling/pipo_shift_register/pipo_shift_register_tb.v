module pipo_shift_register_tb;

reg [3:0]din;
reg rst_n;
reg clk;
reg load;
wire [3:0]dout;
pipo_shift_register dut (.din(din),.rst_n(rst_n),.clk(clk),.load(load),.dout(dout));
 
always #5 clk= ~clk;  

integer i;
initial begin 

    $dumpfile("pipo_shift_register.vcd");
    $dumpvars(0,pipo_shift_register_tb);

    $monitor("time=%0t | din=%b,rst_n=%b,clk=%b,load=%b | dout=%b",$time,din,rst_n,clk,load,dout);
      clk=0;
      rst_n=0;
      load=0;
      din=4'b0000;


    #10 rst_n=1;
    
 for(i=0;i<16;i=i+1)begin
    
    din=i;
    load=1;#10;
    load=0;
    #10;
end
  $finish;
end

endmodule
