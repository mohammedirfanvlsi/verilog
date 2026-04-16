module cla_adder_4bit_dataflow(input [3:0]a,b,input cin,output [3:0]sum,output carry);

wire c1,c2,c3;
wire [3:0]g,p;

assign g =a & b;
assign p =a ^ b;

assign c1=g[0] | (p[0] & cin);
assign c2=g[1] | (p[1] & c1);
assign c3=g[2] | (p[2] & c2);
assign carry=g[3] | (p[3] & c3);

assign sum[0]=p[0]^cin;
assign sum[1]=p[1]^c1;
assign sum[2]=p[2]^c2;
assign sum[3]=p[3]^c3;

endmodule

module cla_adder_4bit_behavioral(input [3:0]a,b,input cin,output reg [3:0]sum,output reg carry);

reg c1,c2,c3;
reg [3:0]g,p;

always @(*)begin

 g =a & b;
 p = a ^ b;

 c1=g[0] | (p[0] & cin);
 c2=g[1] | (p[1] & c1);
 c3=g[2] | (p[2] & c2);
 carry=g[3] | (p[3] & c3);

 sum[0]=p[0]^cin;
 sum[1]=p[1]^c1;
 sum[2]=p[2]^c2;
 sum[3]=p[3]^c3;

end
endmodule

module cla_adder_4bit_top (input [3:0]a,b,input cin,output [3:0]sum_da,output carry_da,output [3:0]sum_be,output carry_be);

cla_adder_4bit_dataflow ad1(.a(a),.b(b),.cin(cin),.sum(sum_da),.carry(carry_da));
cla_adder_4bit_behavioral ad2(.a(a),.b(b),.cin(cin),.sum(sum_be),.carry(carry_be));

endmodule

