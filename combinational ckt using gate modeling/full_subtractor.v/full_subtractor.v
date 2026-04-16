module full_subtractor(input a,b,bin,output diff,borrow);
wire w1,w2,w3,w4,w5;
xor x1(w1,a,b);
xor x2(diff,w1,bin);
and a1(w2,w5,b);
and a2(w3,w5,bin);
and a3(w4,b,bin);
not n1(w5,a);
or o1(borrow,w2,w3,w4);
endmodule
