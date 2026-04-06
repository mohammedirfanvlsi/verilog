module mux_16to1_tb;
reg [15:0]d;
reg [3:0]s;
wire y_da;
wire y_be;


mux_16to1_top dut(.d(d),.s(s),.y_da(y_da),.y_be(y_be));

integer i;

initial begin

$dumpfile("mux_16to1.vcd");
$dumpvars(0,mux_16to1_tb);

$monitor("time=%0t | d=%b,s=%b | y_da=%b,y_be=%b",$time,d,s,y_da,y_be);

for(i=0;i<16;i=i+1) begin
        
     d=16'b1<<i;
     	
    {s}=i;#10;


    end
$finish;
end 
endmodule

