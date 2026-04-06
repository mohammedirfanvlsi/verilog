module priority_encoder_16to4_tb;
  
reg [15:0]d;
wire[3:0]a_da;
wire[3:0]a_be;

priority_encoder_16to4_top dut(.d(d),.a_da(a_da),.a_be(a_be));

integer i;

initial begin

$dumpfile("priority_encoder_16to4.vcd");
$dumpvars(0,priority_encoder_16to4_tb);

$monitor("time=%0t | d=%b | a_da=%b,a_be=%b",$time,d,a_da,a_be);

for(i=0;i<32;i=i+1)begin

	d=i;
   #10;

end
$finish;
end
endmodule


