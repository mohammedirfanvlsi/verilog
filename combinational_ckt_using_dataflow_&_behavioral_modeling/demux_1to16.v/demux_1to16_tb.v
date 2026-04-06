module demux_1to16_tb;
reg d;
reg [3:0]s;
wire [15:0]y_da;
wire [15:0]y_be;


demux_1to16_top dut(.d(d),.s(s),.y_da(y_da),.y_be(y_be));

integer i;

initial begin

$dumpfile("demux_1to16.vcd");
$dumpvars(0,demux_1to16_tb);

$monitor("time=%0t | d=%b,s=%b | y_da=%b,y_be=%b",$time,d,s,y_da,y_be);

for(i=0;i<16;i=i+1) begin
        
     d=1;
     	
    {s}=i;#10;


    end
$finish;
end 
endmodule


