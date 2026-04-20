module leap_year_tb;

reg feb;
reg date29;

wire leap_year;

leap_year dut (.feb(feb),.date29(date29),.leap_year(leap_year));

initial begin 

    $dumpfile("leap_year.vcd");
    $dumpvars(0,leap_year_tb);

    $monitor("time =%0t |feb=%b,date29=%b | leap_year=%b",$time,feb,date29,leap_year);

   feb = 0;#10;
   date29 = 0;#10;
   
   
    feb = 1;#10;
    date29=1;#10;

    feb =0;#10;
    date29 = 1;#10;

end
endmodule

