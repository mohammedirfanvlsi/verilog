module vote_counter (
    input  clk,          // 100 MHz clock
    input  rst,          // reset button (active high)

    // vote pulses (from button_edge)
    input  v_dmk,
    input  v_admk,
    input  v_tvk,
    input  v_ntk,
    input  v_other,

    // vote counts
    output reg [7:0] dmk_cnt,
    output reg [7:0] admk_cnt,
    output reg [7:0] tvk_cnt,
    output reg [7:0] ntk_cnt,
    output reg [7:0] other_cnt,

    // total votes
    output reg [9:0] total_votes,

    // winner index
    output reg [2:0] winner
);

    // -----------------------------
    // Vote counting
    // -----------------------------
    always @(posedge clk) begin
        if (rst) begin
            dmk_cnt   <= 0;
            admk_cnt  <= 0;
            tvk_cnt   <= 0;
            ntk_cnt   <= 0;
            other_cnt <= 0;
        end else begin
            if (v_dmk)   dmk_cnt   <= dmk_cnt + 1;
            if (v_admk)  admk_cnt  <= admk_cnt + 1;
            if (v_tvk)   tvk_cnt   <= tvk_cnt + 1;
            if (v_ntk)   ntk_cnt   <= ntk_cnt + 1;
            if (v_other) other_cnt <= other_cnt + 1;
        end
    end

    // -----------------------------
    // Total vote calculation
    // -----------------------------
    always @(*) begin
        total_votes = dmk_cnt + admk_cnt + tvk_cnt + ntk_cnt + other_cnt;
    end

    // -----------------------------
    // Winner detection
    // -----------------------------
    always @(*) begin
        winner = 0; // default DMK

        if (admk_cnt  > dmk_cnt)   winner = 1;
        if (tvk_cnt   > admk_cnt &&
            tvk_cnt   > dmk_cnt)   winner = 2;
        if (ntk_cnt   > tvk_cnt  &&
            ntk_cnt   > admk_cnt)  winner = 3;
        if (other_cnt > ntk_cnt  &&
            other_cnt > tvk_cnt)   winner = 4;
    end

endmodule
