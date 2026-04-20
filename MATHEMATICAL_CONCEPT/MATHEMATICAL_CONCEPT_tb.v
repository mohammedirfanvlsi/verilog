module second_largest_tb;

reg [3:0]a,b,c,d;

wire [3:0]second_max;

second_largest dut (.a(a),.b(b),.c(c),.d(d),.second_max(second_max));

initial begin

    $dumpfile("second_largest.vcd");
    $dumpvars(0,second_largest_tb);

    $monitor("time=%0t | a=%b,b=%b,c=%b,d=%b | second_max",$time,a,b,c,d,second_max);

    a=4'h2;#10;
    b=4'h9;#10;
    c=4'h4;#10;
    d=4'h7;#10;

$finish;

end
endmodule


