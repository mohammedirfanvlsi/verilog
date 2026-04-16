module dual_port_ram_tb;

reg [7:0]din;
reg rst_n;
reg clk1,clk2;
reg wr_en;
reg re_en;
reg [2:0]wr_addr;
reg[2:0]re_addr;

wire [7:0]dout;

dual_port_ram #(.depth(8),.width(8)) dut (.din(din),.rst_n(rst_n),.clk1(clk1),.clk2(clk2),.wr_en(wr_en),.re_en(re_en),.wr_addr(wr_addr),.re_addr(re_addr),.dout(dout));

always #5 clk1 = ~clk1;
always #5 clk2 = ~clk2;

initial begin

    $dumpfile("dual_port_ram.vcd");
    $dumpvars(0,dual_port_ram_tb);

    $monitor("time=%0t | din =%b,rst_n=%b,clk1=%b,clk2=%b,wr_en=%b,re_en=%b,wr_addr=%b,re_addr=%b | dout=%b",$time,din,rst_n,clk1,clk2,wr_en,re_en,
        wr_addr,re_addr,dout);

end

integer i;

initial begin

    clk1=0;
    clk2=0;
    rst_n=0;
    din=8'b0;
    wr_en=0;
    re_en=0;
    wr_addr=3'b0;
    re_addr=3'b0;


    @(posedge clk1);
    rst_n=1;
    wr_en=1;

      din=8'd1;
      wr_addr=3'd0;
    @(posedge clk1);

      din=8'd2;
      wr_addr=3'd1;
    @(posedge clk1);

       din=8'd3;
       wr_addr=3'd2;
    @(posedge clk1);

        din=8'd4;
        wr_addr=3'd3;
    @(posedge clk1);

        din=8'd5;
        wr_addr=3'd4;
    @(posedge clk1);

        din=8'd6;
        wr_addr=3'd5;
    @(posedge clk1);

        din=8'd7;
        wr_addr=3'd6;
    @(posedge clk1);

        din=8'd8;
        wr_addr=3'd7;
    @(posedge clk1);
      wr_en=0;
     

      re_en=1;
   for (i=0;i<8;i=i+1)begin

       re_addr = i;
        
       @(posedge clk2);

   end

      $finish;

  end

  endmodule
