module mux_16to1_tb;
reg [15:0]i;
reg a,b,c,d;
wire y;

mux_16to1 dut(.i(i),.a(a),.b(b),.c(c),.d(d),.y(y));

integer x;

initial begin

$dumpfile("mux_16to1.vcd");
$dumpvars(0,mux_16to1_tb);

$monitor("time=%0t | i=%b,a=%b,b=%b,c=%b,d=%b | y=%b",$time,i,a,b,c,d,y);

for(x=0;x<16;x=x+1) begin
        
      i = 16'b0;
      i[x] = 1'b1;

      a = x[3];
      b = x[2];
      c = x[1];
      d = x[0];
        #10;
    end
$finish;
end 
endmodule
