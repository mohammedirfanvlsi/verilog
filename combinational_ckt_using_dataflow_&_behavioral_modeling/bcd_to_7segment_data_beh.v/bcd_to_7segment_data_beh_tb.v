module bcd_to_7segment_data_beh_tb;

reg [3:0]d;
wire[6:0]seg_da;
wire[6:0]seg_be;

bcd_to_7segment_top dut(.d(d),.seg_da(seg_da),.seg_be(seg_be));

integer i;

initial begin

$dumpfile("bcd_to_7segment_data_beh.vcd");
$dumpvars(0,bcd_to_7segment_data_beh_tb);

$monitor("time=%0t | d=%d | seg_da=%b,seg_be=%b",$time,d,seg_da,seg_be); 

for(i=0;i<10;i=i+1)begin

d=i;
#10;
end

$finish;
end
endmodule

