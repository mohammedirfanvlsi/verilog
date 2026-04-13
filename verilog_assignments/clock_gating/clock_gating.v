module clock_gating(input clk,en,output gated_clk);

reg enable_latched;

always @(negedge clk)begin

    enable_latched  <= en;

end

assign gated_clk = clk & enable_latched;

endmodule
