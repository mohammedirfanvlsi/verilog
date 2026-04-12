module lfsr_shift_register (input rst_n,clk,output [3:0]dout);

reg [3:0]q;

wire feedback;

assign feedback = (q[3]) ~^(q[2]);

always @(posedge clk or negedge rst_n)begin

    if(!rst_n)

        q <= 4'b0;

    else 

        q <= (q<<1) | feedback ;

end

assign dout = q;

endmodule
