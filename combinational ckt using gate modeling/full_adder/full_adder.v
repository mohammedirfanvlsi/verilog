 module full_adder(input a,b,cin,output sum,carry);
wire w1,w2,w3,w4;
xor x1(w1,a,b);
xor x2(sum,w1,cin);
and a1(w2,a,b);
and a2(w3,b,cin);
and a3(w4,a,cin);
or o1(carry,w2,w3,w4);
endmodule
