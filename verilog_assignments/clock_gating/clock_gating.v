module clock_gating(input clk,enable,output gated_clk);

reg enabled_latch;

always @(clk or enable)begin

    if(!clk)

        enabled_latch <= enable;

end

assign gated_clk = clk & enabled_latch;

endmodule
