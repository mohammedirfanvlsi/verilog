module demux_1to16_dataflow (input d,input  [3:0] s,output [15:0] y);

assign y = d ? (16'b1 << s) : 16'b0;

endmodule

module demux_1to16_behavioral (input d,input  [3:0] s,output reg [15:0] y);

always @(*) begin
 
	if(d)
	  y=16'b1 << s;
	else 	 
          y=16'b0;
            
end

endmodule

module demux_1to16_top (input d,input  [3:0] s,output [15:0] y_da,output [15:0] y_be);

demux_1to16_dataflow de1(.d(d),.s(s),.y(y_da));
demux_1to16_behavioral de2(.d(d),.s(s),.y(y_be));

endmodule

 
