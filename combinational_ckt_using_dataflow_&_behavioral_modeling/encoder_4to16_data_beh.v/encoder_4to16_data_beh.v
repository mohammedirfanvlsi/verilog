module encoder_16to4_dataflow(input [15:0]d,output [3:0]a);

assign a=(d==(16'b1<<0)) ? 4'd0:
(d==(16'b1<<1)) ? 4'd1:
(d==(16'b1<<2)) ? 4'd2:
(d==(16'b1<<3)) ? 4'd3:
(d==(16'b1<<4)) ? 4'd4:
(d==(16'b1<<5)) ? 4'd5:
(d==(16'b1<<6)) ? 4'd6:
(d==(16'b1<<7)) ? 4'd7:
(d==(16'b1<<8)) ? 4'd8:
(d==(16'b1<<9)) ? 4'd9:
(d==(16'b1<<10)) ? 4'd10:
(d==(16'b1<<11)) ? 4'd11:
(d==(16'b1<<12)) ? 4'd12:
(d==(16'b1<<13)) ? 4'd13:
(d==(16'b1<<14)) ? 4'd14:
(d==(16'b1<<15)) ? 4'd15:
4'd0;


endmodule

module encoder_16to4_behavioral(input [15:0]d,output reg [3:0]a);

integer i;
 
always @(*)begin
   
   a=4'd0;

for(i=0;i<16;i=i+1)begin
    if(d==16'b1 <<i)
    a=i[3:0];

end
end
endmodule

module encoder_16to4_top(input [15:0]d,output [3:0]a_da,output [3:0]a_be);

 encoder_16to4_dataflow en1(.d(d),.a(a_da));
 encoder_16to4_behavioral en2(.d(d),.a(a_be));

endmodule

