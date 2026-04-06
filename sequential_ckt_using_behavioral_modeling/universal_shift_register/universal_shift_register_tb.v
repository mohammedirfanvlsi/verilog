module universal_shift_register_tb;

reg din;
reg [3:0]pload;
reg rst_n;
reg clk;
reg [1:0]mode;
wire [3:0]dout;

universal_shift_register dut(.din(din),.pload(pload),.rst_n(rst_n),.clk(clk),.mode(mode),.dout(dout));


always #5 clk=~clk;

initial begin

    $dumpfile("universal_shift_register.vcd");
    $dumpvars(0,universal_shift_register_tb);

    $monitor("time=%0t | din=%b,pload=%b,rst_n=%b,clk=%b,mode=%b | dout=%b",$time,din,pload,rst_n,clk,mode,dout);

   clk=0;
   din=0;
   rst_n=0;
   mode=2'b00;
   pload=4'b0000;

   // RESET
    @(posedge clk);
    rst_n = 1;

    // HOLD
    mode = 2'b00;
    @(posedge clk);

    // SHIFT RIGHT
    mode = 2'b01;
    din  = 1; @(posedge clk);
    din  = 0; @(posedge clk);

    // SHIFT LEFT
    mode = 2'b10;
    din  = 0; @(posedge clk);
    din  = 1; @(posedge clk);

    // PARALLEL LOAD
    mode  = 2'b11;
    pload = 4'b1010;
    @(posedge clk);

    $finish;
end

endmodule
