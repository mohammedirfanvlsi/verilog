module largest_number_tb;

reg [3:0]a;
reg [3:0]b;

wire greater;

largest_number dut (.a(a),.b(b),.greater(greater));

initial begin 

    $dumpfile("largest_num.vcd");
    $dumpvars(0,largest_number_tb);

    $monitor("time=%0t | a=%b,b=%b | greater =%b", $time,a,b,greater);

    a= 4'b0;#10;
    b=4'b0;#10;

    a=4'b1010;#10;
    b=4'b0101;#10;

end
endmodule

