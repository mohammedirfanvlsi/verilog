module programmable_counter_tb;

reg load;
reg [3:0]load_val;
reg en;
reg [3:0]max_val;
reg rst_n,clk;

wire [3:0]count;
wire done;

programmable_counter  #(.width(4)) dut(.load(load),.load_val(load_val),.en(en),.max_val(max_val),.rst_n(rst_n),.clk(clk),.count(count),.done(done));

always #5 clk = ~clk;

initial begin 

    $dumpfile("programmable_counter.vcd");
    $dumpvars(0,programmable_counter_tb);

    $monitor("time=%0t | load=%b,load_val=%b,max_val=%b,en=%b,rst_n=%b,clk=%b | count =%b,done=%b",$time,load,load_val,max_val,en,rst_n,clk,count,done);

end

initial begin

    clk =0;
    rst_n=0;
    load_val=4'b0;
    max_val=4'b0;
    en=0;
    load=0;

    @(posedge clk);
    rst_n=1;

    load=1;
    load_val = 4'b1;
    @(posedge clk);
    load=0;

    en=1;
    max_val=4'b1111;
    @(posedge clk);
    

    repeat(16)@(posedge clk);
    en=0;

    $finish;

end

endmodule




