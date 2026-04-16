module decoder_4to16_data_beh_tb;
  
reg [3:0]a;
reg en;
wire[15:0]d_da;
wire[15:0]d_be;

decoder_4to16_en_top dut(.a(a),.en(en),.d_da(d_da),.d_be(d_be));

integer i;

initial begin

$dumpfile("decoder_4to16_data_beh.vcd");
$dumpvars(0,decoder_4to16_data_beh_tb);

$monitor("time=%0t | a=%b,en=%b | d_da=%b,d_be=%b",$time,a,en,d_da,d_be);

for(i=0;i<16;i=i+1)begin
   
   {a,en}=i;#10;

end
$finish;
end
endmodule

