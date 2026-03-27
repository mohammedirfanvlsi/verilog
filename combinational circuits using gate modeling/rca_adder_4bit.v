module rca_adder_4bit (input [3:0]a,b,input cin,output [3:0]sum,output carry);
wire w1,w2,w3; 

optimized_adder fa1 (.a(a[0]),.b(b[0]),.cin(cin),.sum(sum[0]),.carry(w1));
optimized_adder fa2 (.a(a[1]),.b(b[1]),.cin(w1),.sum(sum[1]),.carry(w2));
optimized_adder fa3 (.a(a[2]),.b(b[2]),.cin(w2),.sum(sum[2]),.carry(w3));
optimized_adder fa4 (.a(a[3]),.b(b[3]),.cin(w3),.sum(sum[3]),.carry(carry)); 

endmodule
