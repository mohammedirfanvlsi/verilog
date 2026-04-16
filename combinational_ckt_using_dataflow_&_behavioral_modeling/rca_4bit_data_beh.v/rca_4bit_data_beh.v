module rca_4bit_dataflow(input [3:0]a,b,input cin,output [3:0]sum,output carry);

wire w1,w2,w3;

assign sum[0]=a[0]^b[0]^cin;
assign w1=((a[0]&b[0])|(a[0]&cin)|(b[0]&cin));
 
assign sum[1]=a[1]^b[1]^w1;
assign w2=((a[1]&b[1])|(a[1]&w1)|(b[1]&w1));

assign sum[2]=a[2]^b[2]^w2;
assign w3=((a[2]&b[2])|(a[2]&w2)|(b[2]&w2));

assign sum[3]=a[3]^b[3]^w3;
assign carry=((a[3]&b[3])|(a[3]&w3)|(b[3]&w3));

endmodule

module rca_4bit_behavioral(input [3:0]a,b,input cin,output reg [3:0]sum,output reg carry);

integer i;
reg c;
always @(*)begin
	c=cin;
for(i=0;i<4;i=i+1)begin
    sum[i]=a[i]^b[i]^c;
    c=((a[i]&b[i])|(a[i]&c)|(b[i]&c));
end
   carry=c;
end
endmodule

module rca_4bit_top(input [3:0]a,b,input cin,output [3:0]sum_da,output carry_da,output [3:0]sum_be,output carry_be);

rca_4bit_dataflow rc1(.a(a),.b(b),.cin(cin),.sum(sum_da),.carry(carry_da));
rca_4bit_behavioral rc2(.a(a),.b(b),.cin(cin),.sum(sum_be),.carry(carry_be));

endmodule

