module decoder_4to16_en(input a,b,c,d,en,output d0,d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15);
wire w1,w2,w3,w4;

and a0(d0,en,w1,w2,w3,w4);
and a1(d1,en,w1,w2,w3,d);
and a2(d2,en,w1,w2,c,w4);
and a3(d3,en,w1,w2,c,d);
and a4(d4,en,w1,b,w3,w4);
and a5(d5,en,w1,b,w3,d);
and a6(d6,en,w1,b,c,w4);
and a7(d7,en,w1,b,c,d);
and a8(d8,en,a,w2,w3,w4);
and a9(d9,en,a,w2,w3,d);
and a10(d10,en,a,w2,c,w4);
and a11(d11,en,a,w2,c,d);
and a12(d12,en,a,b,w3,w4);
and a13(d13,en,a,b,w3,d);
and a14(d14,en,a,b,c,w4);
and a15(d15,en,a,b,c,d);
not n1(w1,a);
not n2(w2,b);
not n3(w3,c);
not n4(w4,d);

endmodule


