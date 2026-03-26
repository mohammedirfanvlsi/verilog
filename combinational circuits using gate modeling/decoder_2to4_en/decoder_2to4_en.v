module decoder_2to4_en (input a,b,en,output d0,d1,d2,d3);
wire w1,w2;

and a1(d0,en,w1,w2);
and a2(d1,en,w1,b);
and a3(d2,en,a,w2);
and a4(d3,en,a,b);
not n1(w1,a);
not n2(w2,b);

endmodule

