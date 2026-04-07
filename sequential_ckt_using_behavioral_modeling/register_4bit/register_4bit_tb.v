module register_4bit_tb;

reg [3:0]d;
reg rst_n;
reg clk;
reg en;
wire [3:0]q;
register_4bit dut (.d(d),.rst_n(rst_n),.clk(clk),.en(en),.q(q));
 
always #5 clk= ~clk;  

integer i;
initial begin 

    $dumpfile("register_4bit.vcd");
    $dumpvars(0,register_4bit_tb);

    $monitor("time=%0t | d=%b,rst_n=%b,clk=%b,en=%b | q=%b",$time,d,rst_n,clk,en,q);
      clk=0;
      rst_n=0;
      en=0;
      d=4'b0000;
  
       

     @(posedge clk);
     rst_n=1;
     en=1;

 for(i=0;i<16;i=i+1)begin
    
    d=i;
    @(posedge clk);
     
end
  $finish;
end

endmodule
