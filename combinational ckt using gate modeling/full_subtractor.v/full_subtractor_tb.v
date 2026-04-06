module full_subtractor_tb;

reg a,b,bin;
wire diff,borrow;

full_subtractor dut(.a(a),.b(b),.bin(bin),.diff(diff),.borrow(borrow));

initial begin

$dumpfile("full_subtractor.vcd");
$dumpvars(0,full_subtractor_tb);

$monitor("time=%0t | a=%b,b=%b,bin=%b| diff=%b,borrow=%b",$time,a,b,bin,diff,borrow);

a=0;b=0;bin=0;#10;
a=0;b=0;bin=1;#10;
a=0;b=1;bin=0;#10;
a=0;b=1;bin=1;#10;
a=1;b=0;bin=0;#10;
a=1;b=0;bin=1;#10;
a=1;b=1;bin=0;#10;
a=1;b=1;bin=1;#10;

$finish;
end
endmodule

