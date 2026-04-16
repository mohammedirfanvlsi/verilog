module single_port_ram_tb;

reg [7:0]din;
reg rst_n;
reg clk;
reg wr_en;
reg re_en;
reg [2:0]addr;

wire [7:0]dout;

single_port_ram #(.depth(8),.width(8)) dut (.din(din),.rst_n(rst_n),.clk(clk),.wr_en(wr_en),.re_en(re_en),.addr(addr),.dout(dout));

always #5 clk = ~clk;

initial begin

    $dumpfile("single_port_ram.vcd");
    $dumpvars(0,single_port_ram_tb);

    $monitor("time=%0t | din =%b,rst_n=%b,clk=%b,wr_en=%b,re_en=%b,addr=%b | dout=%b",$time,din,rst_n,clk,wr_en,re_en,addr,dout);

end

integer i;

initial begin

    clk=0;
    rst_n=0;
    din=8'b0;
    wr_en=0;
    re_en=0;
    addr=3'b0;


    @(posedge clk);
    rst_n=1;
    wr_en=1;

      din=8'd1;
      addr=3'd0;
    @(posedge clk);

      din=8'd2;
      addr=3'd1;
    @(posedge clk);

       din=8'd3;
       addr=3'd2;
    @(posedge clk);

        din=8'd4;
        addr=3'd3;
    @(posedge clk);

        din=8'd5;
        addr=3'd4;
    @(posedge clk);

        din=8'd6;
        addr=3'd5;
    @(posedge clk);

        din=8'd7;
        addr=3'd6;
    @(posedge clk);

        din=8'd8;
        addr=3'd7;
    @(posedge clk);
      wr_en=0;
     

      re_en=1;
   for (i=0;i<8;i=i+1)begin

       addr = i;
        
       @(posedge clk);

   end

      $finish;

  end

  endmodule





