module clk_div_25mhz (
    input  clk_100mhz,
    output reg clk_25mhz
);

    reg [1:0] div_cnt = 0;

    always @(posedge clk_100mhz) begin
        div_cnt <= div_cnt + 1;
        clk_25mhz <= div_cnt[1]; // divide by 4
    end

endmodule
