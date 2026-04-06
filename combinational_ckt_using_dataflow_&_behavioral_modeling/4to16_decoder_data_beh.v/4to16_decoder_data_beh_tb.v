module decoder_4to16_data_beh_tb;
  
reg [3:0]a;
wire[15:0]d_da;
wire[15:0]d_be;

decoder_4to16_top dut(.a(a),.d_da(d_da),.d_be(d_be));

integer i;

initial begin

$dumpfile("decoder_4to16_data_beh.vcd");
$dumpvars(0,decoder_4to16_data_beh_tb);

$monitor("time=%0t | a=%b | d_da=%b,d_be=%b",$time,a,d_da,d_be);

for(i=0;i<16;i=i+1)begin

   a=i;#10;

end
$finish;
end
endmodule
