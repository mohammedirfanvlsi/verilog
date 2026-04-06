module decoder_4to16_dataflow (input [3:0] a,output [15:0]d);

    assign d[0]  = ~a[3] & ~a[2] & ~a[1] & ~a[0];
    assign d[1]  = ~a[3] & ~a[2] & ~a[1] &  a[0];
    assign d[2]  = ~a[3] & ~a[2] &  a[1] & ~a[0];
    assign d[3]  = ~a[3] & ~a[2] &  a[1] &  a[0];

    assign d[4]  = ~a[3] &  a[2] & ~a[1] & ~a[0];
    assign d[5]  = ~a[3] &  a[2] & ~a[1] &  a[0];
    assign d[6]  = ~a[3] &  a[2] &  a[1] & ~a[0];
    assign d[7]  = ~a[3] &  a[2] &  a[1] &  a[0];

    assign d[8]  =  a[3] & ~a[2] & ~a[1] & ~a[0];
    assign d[9]  =  a[3] & ~a[2] & ~a[1] &  a[0];
    assign d[10] =  a[3] & ~a[2] &  a[1] & ~a[0];
    assign d[11] =  a[3] & ~a[2] &  a[1] &  a[0];

    assign d[12] =  a[3] &  a[2] & ~a[1] & ~a[0];
    assign d[13] =  a[3] &  a[2] & ~a[1] &  a[0];
    assign d[14] =  a[3] &  a[2] &  a[1] & ~a[0];
    assign d[15] =  a[3] &  a[2] &  a[1] &  a[0];

endmodule

module decoder_4to16_behavioral(input [3:0]a,output reg [15:0]d);

always @(*)begin

	d=16'b1 << a;

end
endmodule

module decoder_4to16_top (input [3:0]a,output [15:0]d_da,output [15:0]d_be);

 decoder_4to16_dataflow dec1(.a(a),.d(d_da));
  decoder_4to16_behavioral dec2(.a(a),.d(d_be));

  endmodule
