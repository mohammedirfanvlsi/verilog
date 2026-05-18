//==================================================
// VGA Renderer with Text, Numbers, Bars
//==================================================
module vga_renderer (
    input video_on,
    input [9:0] x,
    input [9:0] y,

    input [7:0] dmk_cnt,
    input [7:0] admk_cnt,
    input [7:0] tvk_cnt,
    input [7:0] ntk_cnt,
    input [7:0] other_cnt,

    input [15:0] dmk_pct_x10,
    input [15:0] admk_pct_x10,
    input [15:0] tvk_pct_x10,
    input [15:0] ntk_pct_x10,
    input [15:0] other_pct_x10,

    input [2:0] winner,
    output reg [11:0] rgb
);

    // ---------------- Layout ----------------
    localparam X_NAME = 40;
    localparam X_BAR  = 160;
    localparam X_VOTE = 430;
    localparam X_PCT  = 520;

    localparam ROW_Y0 = 120;
    localparam ROW_H  = 50;
    localparam BAR_MAX = 240;

    // ---------------- Helpers ----------------
    reg row_active;
    reg winner_row;
    integer bar_len;
    reg [7:0] vote;
    reg [15:0] pct;

    // party index from y
    reg [2:0] party_idx;

    // ---------------- Text & digit pixels ----------------
    wire party_text_on;
    wire vote_d1_on, vote_d0_on;
    wire pct_d1_on, pct_d0_on, pct_d2_on;
    wire dot_on;

    // party name
    text_draw TD (
        .party(party_idx),
        .x(x), .y(y),
        .x0(X_NAME),
        .y0(ROW_Y0 + party_idx*ROW_H + 12),
        .pixel_on(party_text_on)
    );

    // vote digits (2 digits)
    digit_draw VD1 (.digit(vote/10), .x(x), .y(y),
                    .x0(X_VOTE), .y0(ROW_Y0 + party_idx*ROW_H + 10),
                    .pixel_on(vote_d1_on));

    digit_draw VD0 (.digit(vote%10), .x(x), .y(y),
                    .x0(X_VOTE+18), .y0(ROW_Y0 + party_idx*ROW_H + 10),
                    .pixel_on(vote_d0_on));

    // percentage digits (xx.x)
    digit_draw PD1 (.digit(pct/100), .x(x), .y(y),
                    .x0(X_PCT), .y0(ROW_Y0 + party_idx*ROW_H + 10),
                    .pixel_on(pct_d1_on));

    digit_draw PD0 (.digit((pct/10)%10), .x(x), .y(y),
                    .x0(X_PCT+18), .y0(ROW_Y0 + party_idx*ROW_H + 10),
                    .pixel_on(pct_d0_on));

    digit_draw PD2 (.digit(pct%10), .x(x), .y(y),
                    .x0(X_PCT+42), .y0(ROW_Y0 + party_idx*ROW_H + 10),
                    .pixel_on(pct_d2_on));

    // decimal point
    assign dot_on = (x>=X_PCT+36 && x<=X_PCT+38 &&
                     y>=ROW_Y0+party_idx*ROW_H+30 &&
                     y<=ROW_Y0+party_idx*ROW_H+32);

    // ---------------- Main renderer ----------------
    always @(*) begin
        rgb = 12'h000;
        row_active = 0;
        winner_row = 0;
        bar_len = 0;
        party_idx = 0;
        vote = 0;
        pct = 0;

        if (video_on) begin

            // TITLE
            if (y>=40 && y<=70 && x>=200 && x<=440)
                rgb = 12'h0FF;

            // ROW SELECTION
            if (y>=ROW_Y0 && y<ROW_Y0+ROW_H) begin
                party_idx=0; vote=dmk_cnt; pct=dmk_pct_x10; row_active=1;
            end else if (y>=ROW_Y0+ROW_H && y<ROW_Y0+2*ROW_H) begin
                party_idx=1; vote=admk_cnt; pct=admk_pct_x10; row_active=1;
            end else if (y>=ROW_Y0+2*ROW_H && y<ROW_Y0+3*ROW_H) begin
                party_idx=2; vote=tvk_cnt; pct=tvk_pct_x10; row_active=1;
            end else if (y>=ROW_Y0+3*ROW_H && y<ROW_Y0+4*ROW_H) begin
                party_idx=3; vote=ntk_cnt; pct=ntk_pct_x10; row_active=1;
            end else if (y>=ROW_Y0+4*ROW_H && y<ROW_Y0+5*ROW_H) begin
                party_idx=4; vote=other_cnt; pct=other_pct_x10; row_active=1;
            end

            if (party_idx == winner)
                winner_row = 1;

            bar_len = pct * BAR_MAX / 1000;

            // ROW BACKGROUND
            if (row_active)
                rgb = winner_row ? 12'h330 : 12'h111;

            // BAR
            if (row_active && x>=X_BAR && x<X_BAR+bar_len)
                rgb = 12'h0F0;

            // TEXT
            if (party_text_on)
                rgb = 12'hFFF;

            // NUMBERS
            if (vote_d1_on || vote_d0_on)
                rgb = 12'hFF0;

            if (pct_d1_on || pct_d0_on || pct_d2_on || dot_on)
                rgb = 12'h0FF;
        end
    end

endmodule
