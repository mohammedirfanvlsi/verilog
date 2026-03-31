module mux_16to1_dataflow (input [15:0] d,input  [3:0]  s,output y);

assign y =
    (s == 4'd0)  ? d[0]  :
    (s == 4'd1)  ? d[1]  :
    (s == 4'd2)  ? d[2]  :
    (s == 4'd3)  ? d[3]  :
    (s == 4'd4)  ? d[4]  :
    (s == 4'd5)  ? d[5]  :
    (s == 4'd6)  ? d[6]  :
    (s == 4'd7)  ? d[7]  :
    (s == 4'd8)  ? d[8]  :
    (s == 4'd9)  ? d[9]  :
    (s == 4'd10) ? d[10] :
    (s == 4'd11) ? d[11] :
    (s == 4'd12) ? d[12] :
    (s == 4'd13) ? d[13] :
    (s == 4'd14) ? d[14] :
                   d[15];

endmodule


module mux_16to1_behavioral (input [15:0] d,input  [3:0]  s,output reg y);

always @(*)begin

y=d[s];

end
endmodule


module mux_16to1_top (input [15:0] d,input  [3:0]  s,output y_da,output y_be);

 mux_16to1_dataflow m1(.d(d),.s(s),.y(y_da));
 mux_16to1_behavioral m2(.d(d),.s(s),.y(y_be));

endmodule

