module half_adder_data_beh_tb;

reg a,b;
wire sum_da,carry_da;
wire sum_be,carry_be;
half_adder_top dut(.a(a),.b(b),.sum_da(sum_da),.carry_da(carry_da),.sum_be(sum_be),.carry_be(carry_be));

initial begin
$dumpfile("half_adder_data_beh.vcd");
$dumpvars(0,half_adder_data_beh_tb);
$monitor("time=%0t | a=%b,b=%b | sum_da=%b ,carry_da=%b,sum_be=%b,carry_be=%b", $time,a,b,sum_da,carry_da,sum_be,carry_be);
a=0;b=0;#10;
a=0;b=1;#10;
a=1;b=0;#10;
a=1;b=1;#10;
$finish;
end
endmodule


