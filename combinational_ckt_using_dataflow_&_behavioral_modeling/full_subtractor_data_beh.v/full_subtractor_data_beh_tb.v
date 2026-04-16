module full_subtractor_data_beh_tb;

reg a,b,bin;
wire diff_da,borrow_da;
wire diff_be,borrow_be;
full_subtractor_top dut(.a(a),.b(b),.bin(bin),.diff_da(diff_da),.borrow_da(borrow_da),.diff_be(diff_be),.borrow_be(borrow_be));

initial begin

$dumpfile("full_subtractor_data_beh.vcd");
$dumpvars(0,full_subtractor_data_beh_tb);

$monitor("time=%0t | a=%b,b=%b,bin=%b| diff_da=%b,borrow_da=%b,diff_be=%b,borrow_be=%b",$time,a,b,bin,diff_da,borrow_da,diff_be,borrow_be);

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

