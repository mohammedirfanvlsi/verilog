module mod_n_counter_tb;

reg [3:0]mod_n;
reg rst_n;
reg clk;
reg load;
reg en;
reg [3:0]load_val;
wire [3:0]count;

mod_n_counter dut (.mod_n(mod_n),.rst_n(rst_n),.clk(clk),.load(load),.en(en),.load_val(load_val),.count(count));


always #5 clk =~clk;

initial begin 

    $dumpfile("mod_n_counter.vcd");
    $dumpvars(0,mod_n_counter_tb);

    $monitor("time=%0t | mod_n=%b,rst_n=%b,clk=%b,load=%b ,en=%b,load_val=%b | cout=%b",$time,mod_n,rst_n,clk,load,en,load_val,count);

    clk=0;
    rst_n=0;
    load=0;
    en=0;
    load_val=4'd1;
    mod_n=4'd15;
    
    @(posedge clk);
    rst_n=1;
    load =1;

    @(posedge clk)
    load=0;

    en=1;
    mod_n=4'd15;
    repeat (14) @(posedge clk);

    mod_n=4'd10;
    repeat (10) @(posedge clk);

    $finish; 

end
endmodule
