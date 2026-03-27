module encoder_8to3_tb;
reg d0,d1,d2,d3,d4,d5,d6,d7;
wire a,b,c;

encoder_8to3 dut(.d0(d0),.d1(d1),.d2(d2),.d3(d3),.d4(d4),.d5(d5),.d6(d6),.d7(d7),.a(a),.b(b),.c(c));

integer i;
initial begin

$dumpfile("encoder_8to3.vcd");
$dumpvars(0,encoder_8to3_tb);
  
$monitor("time=%0t | d0=%b,d1=%b,d2=%b,d3=%b,d4=%b,d5=%b,d6=%b,d7=%b | a=%b,b=%b,c=%b",$time,d0,d1,d2,d3,d4,d5,d6,d7,a,b,c);


for(i=0;i<8;i=i+1) begin
	{d0,d1,d2,d3,d4,d5,d6,d7}= 8'b00000001 << i;
#10;
end
$finish;
end
endmodule
