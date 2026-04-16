module johnson_counter #(parameter width =4)(input rst_n,input clk,output reg [width-1:0]q);

always @(posedge clk or negedge rst_n)begin 

    if(!rst_n)

        q <= 4'b0;

    else 

        q <= (q << 1) | (~q[width-1] & 1'b1);
end

endmodule

