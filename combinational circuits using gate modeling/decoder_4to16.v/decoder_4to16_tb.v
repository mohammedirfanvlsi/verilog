module decoder_4to16_en_tb;

reg a,b,c,d,en;
wire  d0,d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15;

decoder_4to16_en dut(.a(a),.b(b),.c(c),.d(d),.en(en),.d0(d0),.d1(d1),.d2(d2),.d3(d3),.d4(d4),.d5(d5),.d6(d6),.d7(d7),.d8(d8),.d9(d9),.d10(d10),.d11(d11),.d12(d12),.d13(d13),.d14(d14),.d15(d15));

initial begin

$dumpfile("decoder_4to16_en.vcd");
$dumpvars(0,decoder_4to16_en_tb);

$monitor("time=%0t | a=%b,b=%b,c=%b,d=%b en=%b|  d0=%b,d1=%b,d2=%b,d3=%b,d4=%b,d5=%b,d6=%b,d7=%b,d8=%b,d9=%b,d10=%b,d11=%b,d12=%b,d13=%b,d14=%b,d15=%b",$time,a,b,c,d,en,d0,d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15);

en=0;a=0;b=0;c=0;d=0;#10;
en=1;a=0;b=0;c=0;d=1;#10;
en=1;a=0;b=0;c=1;d=0;#10;
en=1;a=0;b=0;c=1;d=1;#10;
en=1;a=0;b=1;c=0;d=0;#10;
en=1;a=0;b=1;c=0;d=1;#10;
en=1;a=0;b=1;c=1;d=0;#10;
en=1;a=0;b=1;c=1;d=1;#10;
en=1;a=1;b=0;c=0;d=0;#10;
en=1;a=1;b=0;c=0;d=1;#10;
en=1;a=1;b=0;c=1;d=0;#10;
en=1;a=1;b=0;c=1;d=1;#10;
en=1;a=1;b=1;c=0;d=0;#10;
en=1;a=1;b=1;c=0;d=1;#10;
en=1;a=1;b=1;c=1;d=0;#10;
en=1;a=1;b=1;c=1;d=1;#10;


$finish;

end 
endmodule


