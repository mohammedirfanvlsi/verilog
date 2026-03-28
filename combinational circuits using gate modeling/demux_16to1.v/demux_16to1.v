module demux_1to16 (input i,input a,b,c,d,output [15:0]s);

wire w1,w2,w3,w4;
not n1(w1,a);
not n2(w2,b);
not n3(w3,c);
not n4(w4,d);

and a1(s[0],i,w1,w2,w3,w4);
and a2(s[1],i,w1,w2,w3,d);
and a3(s[2],i,w1,w2,c,w4);
and a4(s[3],i,w1,w2,c,d);
and a5(s[4],i,w1,b,w3,w4);
and a6(s[5],i,w1,b,w3,d);
and a7(s[6],i,w1,b,c,w4);
and a8(s[7],i,w1,b,c,d);
and a9(s[8],i,a,w2,w3,w4);
and a10(s[9],i,a,w2,w3,d);
and a11(s[10],i,a,w2,c,w4);
and a12(s[11],i,a,w2,c,d);
and a13(s[12],i,a,b,w3,w4);
and a14(s[13],i,a,b,w3,d);
and a15(s[14],i,a,b,c,w4);
and a16(s[15],i,a,b,c,d);



endmodule


