module up_down_4bit_counter_tb;

reg rst_n;
reg clk;
reg up_down;
wire [3:0]count;

up_down_4bit_counter dut (.rst_n(rst_n),.clk(clk),.up_down(up_down),.count(count));


always #5 clk =~clk;

initial begin 

    $dumpfile("up_down_4bit_counter.vcd");
    $dumpvars(0,up_down_4bit_counter_tb);

    $monitor("time=%0t | rst_n=%b,clk=%b,up_down=%b | cout=%b",$time,rst_n,clk,up_down,count);

    clk=0;
    rst_n=0;
    up_down=0;

    
    @(posedge clk);
    rst_n=1;

    up_down=1;
    repeat (16) @(posedge clk);

    up_down=0;
    repeat (16) @(posedge clk);

    $finish; 

end
endmodule
