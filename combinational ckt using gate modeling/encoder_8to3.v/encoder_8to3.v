module encoder_8to3(input d0,d1,d2,d3,d4,d5,d6,d7,output a,b,c);
 
or o1(a,d3,d2,d1,d0);
or o2(b,d5,d4,d1,d0);
or o3(c,d6,d4,d2,d0);

endmodule


