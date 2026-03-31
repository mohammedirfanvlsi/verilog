module encoder_16to4_data_beh_tb;
  
reg [15:0]d;
wire[3:0]a_da;
wire[3:0]a_be;

encoder_16to4_top dut(.d(d),.a_da(a_da),.a_be(a_be));

integer i;

initial begin

$dumpfile("encoder_16to4_data_beh.vcd");
$dumpvars(0,encoder_16to4_data_beh_tb);

$monitor("time=%0t | d=%b | a_da=%b,a_be=%b",$time,d,a_da,a_be);

for(i=0;i<16;i=i+1)begin

	d=16'b1<<i;
   #10;

end
$finish;
end
endmodule

