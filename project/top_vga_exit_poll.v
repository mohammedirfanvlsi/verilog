//==================================================
// TOP VGA EXIT POLL SYSTEM (PORT-CORRECT VERSION)
//==================================================
module top_vga_exit_poll (
    input clk,        // 100 MHz
    input rst,

    input btn_dmk,
    input btn_admk,
    input btn_tvk,
    input btn_ntk,
    input btn_other,

    output hsync,
    output vsync,
    output [11:0] rgb
);

    // -----------------------------------------
    // Clock divider
    // -----------------------------------------
    wire clk_25mhz;

    clk_div_25mhz CLKDIV (
        .clk_100mhz(clk),
        .clk_25mhz(clk_25mhz)
    );

    // -----------------------------------------
    // Button edge detection
    // -----------------------------------------
    wire p_dmk, p_admk, p_tvk, p_ntk, p_other;

    button_edge B0 (.clk(clk), .btn(btn_dmk),   .pulse(p_dmk));
    button_edge B1 (.clk(clk), .btn(btn_admk),  .pulse(p_admk));
    button_edge B2 (.clk(clk), .btn(btn_tvk),   .pulse(p_tvk));
    button_edge B3 (.clk(clk), .btn(btn_ntk),   .pulse(p_ntk));
    button_edge B4 (.clk(clk), .btn(btn_other), .pulse(p_other));

    // -----------------------------------------
    // Vote counters
    // -----------------------------------------
    wire [7:0] dmk_cnt, admk_cnt, tvk_cnt, ntk_cnt, other_cnt;

    vote_counter VC (
        .clk(clk),
        .rst(rst),
        .v_dmk(p_dmk),
        .v_admk(p_admk),
        .v_tvk(p_tvk),
        .v_ntk(p_ntk),
        .v_other(p_other),
        .dmk_cnt(dmk_cnt),
        .admk_cnt(admk_cnt),
        .tvk_cnt(tvk_cnt),
        .ntk_cnt(ntk_cnt),
        .other_cnt(other_cnt)
    );

    // -----------------------------------------
    // Total votes
    // -----------------------------------------
    wire [9:0] total_votes;
    assign total_votes =
        dmk_cnt + admk_cnt + tvk_cnt + ntk_cnt + other_cnt;

    // -----------------------------------------
    // Percentage calculation (×10)
    // -----------------------------------------
    wire [15:0] dmk_pct, admk_pct, tvk_pct, ntk_pct, other_pct;

    percentage_calc PC (
        .dmk_cnt(dmk_cnt),
        .admk_cnt(admk_cnt),
        .tvk_cnt(tvk_cnt),
        .ntk_cnt(ntk_cnt),
        .other_cnt(other_cnt),
        .total_votes(total_votes),
        .dmk_pct_x10(dmk_pct),
        .admk_pct_x10(admk_pct),
        .tvk_pct_x10(tvk_pct),
        .ntk_pct_x10(ntk_pct),
        .other_pct_x10(other_pct)
    );

    // -----------------------------------------
    // Winner logic
    // -----------------------------------------
    wire [2:0] winner;

    winner_logic WIN (
        .c0(dmk_cnt),
        .c1(admk_cnt),
        .c2(tvk_cnt),
        .c3(ntk_cnt),
        .c4(other_cnt),
        .winner(winner)
    );

    // -----------------------------------------
    // VGA sync
    // -----------------------------------------
    wire video_on;
    wire [9:0] x, y;

    vga_sync VS (
        .clk_25mhz(clk_25mhz),
        .hsync(hsync),
        .vsync(vsync),
        .video_on(video_on),
        .x(x),
        .y(y)
    );

    // -----------------------------------------
    // VGA renderer
    // -----------------------------------------
    vga_renderer VR (
        .video_on(video_on),
        .x(x),
        .y(y),
        .dmk_cnt(dmk_cnt),
        .admk_cnt(admk_cnt),
        .tvk_cnt(tvk_cnt),
        .ntk_cnt(ntk_cnt),
        .other_cnt(other_cnt),
        .dmk_pct_x10(dmk_pct),
        .admk_pct_x10(admk_pct),
        .tvk_pct_x10(tvk_pct),
        .ntk_pct_x10(ntk_pct),
        .other_pct_x10(other_pct),
        .winner(winner),
        .rgb(rgb)
    );

endmodule
