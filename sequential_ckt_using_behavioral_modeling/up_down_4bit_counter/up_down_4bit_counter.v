module up_down_4bit_counter(input rst_n,input clk,input up_down,output reg [3:0]count);

always @(posedge clk or negedge rst_n)begin

    if (!rst_n)
        count <=4'b0000;

    else if (up_down)

        count <= count +1'b1;
    else 
        count <= count-1'b1;
end

endmodule
