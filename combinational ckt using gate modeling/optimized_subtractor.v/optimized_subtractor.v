module optimized_subtractor(input a,b,bin,output diff,borrow);

wire w1,w2,w3,w4,w5;
xor x1(w1,a,b);
xor x2(diff,w1,bin);
and a1(w2,w4,b);
and a2(w3,w5,bin);
not n1(w4,a);
not n2(w5,w1);
or o1(borrow,w3,w2);

endmodule

