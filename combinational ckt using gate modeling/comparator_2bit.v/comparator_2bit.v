module comparator_2bit(input a,b,output e,g,l);
wire w1,w2;

xnor x1(e,a,b);
and a1(g,a,w2);
and a2(l,w1,b);
 
not n1(w1,a);
not n2(w2,b);

endmodule
