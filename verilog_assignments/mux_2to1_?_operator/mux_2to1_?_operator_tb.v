module mux_2to1_tb;

reg [1:0]i;
reg sel;

wire y;

mux_2to1 dut(.i(i),.sel(sel),.y(y));

initial begin 

    $dumpfile("mux_2to1.vcd");
    $dumpvars(0,mux_2to1_tb);

    $monitor("time=%0t | i=%b,sel=%b, | y=%b",$time,i,sel,y);



    sel = 0;
    i=2'b0;#10;
    sel =1;
    i=2'b10;#10;

end 
endmodule
