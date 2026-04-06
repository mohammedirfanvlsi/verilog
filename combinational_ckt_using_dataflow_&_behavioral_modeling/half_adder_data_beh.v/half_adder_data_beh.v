module half_adder_dataflow(input a,b,output sum,carry);
 
assign sum = a^b;
assign carry = a&b;

endmodule

module half_adder_behavioral(input a,b,output reg sum,carry);

always @(*)begin
     
  sum = a^b;
  carry = a&b;

end
endmodule

module half_adder_top(input a,b,output sum_da,carry_da,output sum_be,carry_be);

half_adder_dataflow ha1(.a(a),.b(b),.sum(sum_da),.carry(carry_da));
half_adder_behavioral ha2(.a(a),.b(b),.sum(sum_be),.carry(carry_be));
endmodule


