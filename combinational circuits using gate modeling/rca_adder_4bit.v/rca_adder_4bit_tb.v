module rca_adder_4bit_tb;

reg [3:0]a,b;
reg cin;
wire [3:0]sum;
wire carry;

rca_adder_4bit dut(.a(a),.b(b),.cin(cin),.sum(sum),.carry(carry));

integer i;
initial begin

	$dumpfile("rca_adder_4bit.vcd");
	$dumpvars(0,rca_adder_4bit_tb);

	$monitor("time=%0t | a=%b,b=%b,cin=%b | sum=%b,carry=%b",$time,a,b,cin,sum,carry);

for(i=0;i<16;i=i+1)
begin
	{a,b,cin}=i;#10;

end
$finish;
end
endmodule
