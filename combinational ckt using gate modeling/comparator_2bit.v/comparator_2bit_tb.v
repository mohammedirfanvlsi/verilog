module comparator_2bit_tb;
reg a,b;
wire e,g,l;

comparator_2bit dut(.a(a),.b(b),.e(e),.g(g),.l(l));

integer i;
initial begin

$dumpfile("comparator_2bit.vcd");
$dumpvars(0,comparator_2bit_tb);

$monitor("time=%0t | a=%b,b=%b | e=%b,g=%b,l=%b",$time,a,b,e,g,l);

for(i=0;i<4;i=i+1)begin
{a,b}=i;
#10;
end

$finish;
end
endmodule
