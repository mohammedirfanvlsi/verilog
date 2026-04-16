module bcd_to_7segment_dataflow(input [3:0]d,output [6:0]seg);
 
         assign seg=(d==4'd0)? 7'b1111110:
          (d==4'd1)? 7'b0110000:
          (d==4'd2)? 7'b1101101:
          (d==4'd3)? 7'b1111001:
          (d==4'd4)? 7'b0110011:
          (d==4'd5)? 7'b1011011:
	  (d==4'd6)? 7'b1011111:
          (d==4'd7)? 7'b1110000:
          (d==4'd8)? 7'b1111111:
          (d==4'd9)? 7'b1111011:
          7'b000000;

endmodule

module bcd_to_7segment_behavioral(input [3:0]d,output reg [6:0]seg);
  

always @(*)begin
     
       if (d == 4'd0)
	       seg=7'b1111110;
        else if(d == 4'd1) 
		seg=7'b0110000;
        else if(d == 4'd2) 
		seg=7'b1101101;
        else if(d == 4'd3)
		seg=7'b1111001;
        else if(d == 4'd4) 
		seg=7'b0110011;
        else if(d == 4'd5) 
		seg=7'b1011011;
        else if(d == 4'd6)
		seg=7'b1011111;
        else if(d == 4'd7)
		seg=7'b1110000;
        else if(d == 4'd8)
		seg=7'b1111111;
        else if(d == 4'd9)
		seg=7'b1111011;
             else
		 seg=7'b0000000;
 end

endmodule

module bcd_to_7segment_top(input [3:0]d,output [6:0]seg_da,output [6:0]seg_be);

 bcd_to_7segment_dataflow bcd1 (.d(d),.seg(seg_da));
 bcd_to_7segment_behavioral bcd2 (.d(d),.seg(seg_be));

endmodule
        
