module synchronous_fifo_tb;

reg [7:0]din;
reg rst_n,clk;
reg wr_en,re_en;

wire [7:0]dout;
wire full;
wire empty;

synchronous_fifo #(.depth(8),.width(8)) dut (.din(din),.rst_n(rst_n),.clk(clk),.wr_en(wr_en),.re_en(re_en),.dout(dout),.full(full),.empty(empty));

always #5 clk = ~clk;

initial begin

    $dumpfile("synchronous_fifo.vcd");
    $dumpvars(0,synchronous_fifo_tb);

    $monitor("time=%0t | din=%b,rst_n=%b,clk=%b,wr_en=%b,re_en=%b | dout=%b,full=%b,empty=%b",$time,din,rst_n,clk,wr_en,re_en,dout,full,empty);

    din = 0;
    rst_n=0;
    clk = 0;
    wr_en=0;
    re_en = 0;


    @(posedge clk);
    rst_n=1;
    wr_en=1;


    din=8'd1;
    @(posedge clk);

    
    din=8'd2;
    @(posedge clk);

     din=8'd3;
    @(posedge clk);
    

    din=8'd4;
    @(posedge clk);
    

     din=8'd5;
    @(posedge clk);

    din=8'd6;
    @(posedge clk);
    

    din=8'd7;
    @(posedge clk);

    din=8'd8;
    @(posedge clk);
 
     
     din=8'd9;
    @(posedge clk);
    wr_en=0;

     

    re_en=1;
    repeat (8)@(posedge clk);

    $finish;
end
endmodule

