module decoder_2to4_en_tb;

reg a,b,en;
wire d0,d1,d2,d3;

decoder_2to4_en dut(.a(a),.b(b),.en(en),.d0(d0),.d1(d1),.d2(d2),.d3(d3));

initial begin

$dumpfile("decoder_2to4_en.vcd");
$dumpvars(0,decoder_2to4_en_tb);

$monitor("time=%0t | a=%b,b=%b,en=%b | d0=%b,d1=%b,d2=%b,d3=%b",$time,a,b,en,d0,d1,d2,d3);

en=0;a=0;b=0;
en=1;a=0;b=0;#10;
en=1;a=0;b=1;#10;
en=1;a=1;b=0;#10;
en=1;a=1;b=1;#10;

$finish;

end 
endmodule

