module mux_16to1(input [15:0]i,input a,b,c,d,output y);
wire [15:0]s;
wire w1,w2,w3,w4;
not n1(w1,a);
not n2(w2,b);
not n3(w3,c);
not n4(w4,d);

and a1(s[0],i[0],w1,w2,w3,w4);
and a2(s[1],i[1],w1,w2,w3,d);
and a3(s[2],i[2],w1,w2,c,w4);
and a4(s[3],i[3],w1,w2,c,d);
and a5(s[4],i[4],w1,b,w3,w4);
and a6(s[5],i[5],w1,b,w3,d);
and a7(s[6],i[6],w1,b,c,w4);
and a8(s[7],i[7],w1,b,c,d);
and a9(s[8],i[8],a,w2,w3,w4);
and a10(s[9],i[9],a,w2,w3,d);
and a11(s[10],i[10],a,w2,c,w4);
and a12(s[11],i[11],a,w2,c,d);
and a13(s[12],i[12],a,b,w3,w4);
and a14(s[13],i[13],a,b,w3,d);
and a15(s[14],i[14],a,b,c,w4);
and a16(s[15],i[15],a,b,c,d);

or o1(y,s[0],s[1],s[2],s[3],s[4],s[5],s[6],s[7],s[8],s[9],s[10],s[11],s[12],s[13],s[14],s[15]);


endmodule
