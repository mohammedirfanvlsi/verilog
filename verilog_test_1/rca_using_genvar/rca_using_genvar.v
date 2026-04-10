module full_adder (input a,b,input cin,output sum,carry);

assign sum = a^b^cin;
assign carry = a&b | a&cin | b&cin ;

endmodule
  
module rca_adder (input [3:0]a,b,input cin,output [3:0]sum,output carry);

wire [4:0]c;
 assign c[0] = cin;

genvar i;

generate 
 
for(i=0;i<4;i=i+1)begin : rca_block

    full_adder r1(.a(a[i]),.b(b[i]),.cin(c[i]),.sum(sum[i]),.carry(c[i+1]));

end
assign carry = c[4];
endgenerate

endmodule
   


   



