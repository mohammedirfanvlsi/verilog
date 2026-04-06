module cla_adder_4bit_data_beh_tb;

reg [3:0]a,b;
reg cin;
wire [3:0]sum_da;
wire carry_da;
wire [3:0]sum_be;
wire carry_be;

cla_adder_4bit_top dut(.a(a),.b(b),.cin(cin),.sum_da(sum_da),.carry_da(carry_da),.sum_be(sum_be),.carry_be(carry_be));

integer i;

initial begin

$dumpfile("cla_adder_4bit_data_beh.vcd");
$dumpvars(0,cla_adder_4bit_data_beh_tb);

$monitor("time=%0t | a=%b,b=%b,cin=%b | sum_da=%b,carry_da=%b,sum_be=%b,carry_be=%b",$time,a,b,cin,sum_da,carry_da,sum_be,carry_be);

for(i=0;i<32;i=i+1)begin

{a,b,cin}=i;#10;
end
end

endmodule
