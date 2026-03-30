module decoder_4to16_en_dataflow (input  [3:0] a,input en,output [15:0]d);

assign d = en ? (16'b1 << a) : 16'b0;

endmodule


module decoder_4to16_en_behavioral (input  [3:0] a,input en,output reg [15:0] d);

always @(*)begin

if(en)

 d = 16'b1 << a;
else 
  d = 16'b0;
end 
endmodule

module decoder_4to16_en_top(input [3:0]a,input en,output [15:0]d_da,output [15:0]d_be);


 decoder_4to16_en_dataflow dec1(.a(a),.en(en),.d(d_da));
 decoder_4to16_en_behavioral dec2(.a(a),.en(en),.d(d_be));

endmodule

