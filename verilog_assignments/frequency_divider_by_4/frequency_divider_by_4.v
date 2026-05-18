module frequency_divider_by_4(input clk,rst_n ,output freq_div_4);

reg[1:0]count;

always @(posedge clk or negedge rst_n)begin

    if(!rst_n)

        count <= 0;
    else 

        count <= count + 1'b1;

end

assign freq_div_4 = count[1];

endmodule
