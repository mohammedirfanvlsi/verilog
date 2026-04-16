module comparator_4bit_dataflow (input  [3:0] a,input  [3:0] b,output gt,output lt,output eq);

assign eq = (a == b);   
assign gt = (a >  b);   
assign lt = (a <  b);   

endmodule


module comparator_4bit_behavioral (input  [3:0] a,input  [3:0] b,output reg gt,output reg lt,output reg eq);

always @(*) begin
    if (a == b) begin
        eq = 1'b1;
        gt = 1'b0;
        lt = 1'b0;
    end
    else if (a > b) begin
        gt = 1'b1;
        eq = 1'b0;
        lt = 1'b0;
    end
    else begin
        lt = 1'b1;
        gt = 1'b0;
        eq = 1'b0;
    end
end

endmodule

 module comparator_4bit_top (input  [3:0] a,input  [3:0] b,output gt_da,output lt_da,output eq_da,output gt_be,output lt_be,output eq_be);

 comparator_4bit_dataflow c1(.a(a),.b(b),.gt(gt_da),.lt(lt_da),.eq(eq_da));
comparator_4bit_behavioral c2(.a(a),.b(b),.gt(gt_be),.lt(lt_be),.eq(eq_be));

endmodule
