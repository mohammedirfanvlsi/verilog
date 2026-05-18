module percentage_calc (
    input  [7:0] dmk_cnt,
    input  [7:0] admk_cnt,
    input  [7:0] tvk_cnt,
    input  [7:0] ntk_cnt,
    input  [7:0] other_cnt,
    input  [9:0] total_votes,

    output reg [15:0] dmk_pct_x10,
    output reg [15:0] admk_pct_x10,
    output reg [15:0] tvk_pct_x10,
    output reg [15:0] ntk_pct_x10,
    output reg [15:0] other_pct_x10
);

    always @(*) begin
        if (total_votes == 0) begin
            dmk_pct_x10   = 0;
            admk_pct_x10  = 0;
            tvk_pct_x10   = 0;
            ntk_pct_x10   = 0;
            other_pct_x10 = 0;
        end else begin
            dmk_pct_x10   = (dmk_cnt   * 1000) / total_votes;
            admk_pct_x10  = (admk_cnt  * 1000) / total_votes;
            tvk_pct_x10   = (tvk_cnt   * 1000) / total_votes;
            ntk_pct_x10   = (ntk_cnt   * 1000) / total_votes;
            other_pct_x10 = (other_cnt * 1000) / total_votes;
        end
    end

endmodule
