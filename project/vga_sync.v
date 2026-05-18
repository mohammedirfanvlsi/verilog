module vga_sync (
    input  clk_25mhz,

    output reg hsync,
    output reg vsync,
    output reg video_on,

    output reg [9:0] x,   // horizontal pixel (0–639)
    output reg [9:0] y    // vertical pixel (0–479)
);

    // -----------------------------
    // VGA timing parameters
    // -----------------------------
    localparam H_VISIBLE = 640;
    localparam H_FRONT   = 16;
    localparam H_SYNC    = 96;
    localparam H_BACK    = 48;
    localparam H_TOTAL   = 800;

    localparam V_VISIBLE = 480;
    localparam V_FRONT   = 10;
    localparam V_SYNC    = 2;
    localparam V_BACK    = 33;
    localparam V_TOTAL   = 525;

    // Counters
    reg [9:0] h_count = 0;
    reg [9:0] v_count = 0;

    // -----------------------------
    // Horizontal & vertical counters
    // -----------------------------
    always @(posedge clk_25mhz) begin
        if (h_count == H_TOTAL - 1) begin
            h_count <= 0;
            if (v_count == V_TOTAL - 1)
                v_count <= 0;
            else
                v_count <= v_count + 1;
        end else begin
            h_count <= h_count + 1;
        end
    end

    // -----------------------------
    // Generate HSYNC (active low)
    // -----------------------------
    always @(*) begin
        if (h_count >= H_VISIBLE + H_FRONT &&
            h_count <  H_VISIBLE + H_FRONT + H_SYNC)
            hsync = 0;
        else
            hsync = 1;
    end

    // -----------------------------
    // Generate VSYNC (active low)
    // -----------------------------
    always @(*) begin
        if (v_count >= V_VISIBLE + V_FRONT &&
            v_count <  V_VISIBLE + V_FRONT + V_SYNC)
            vsync = 0;
        else
            vsync = 1;
    end

    // -----------------------------
    // Video ON (visible area only)
    // -----------------------------
    always @(*) begin
        video_on = (h_count < H_VISIBLE) && (v_count < V_VISIBLE);
        x = h_count;
        y = v_count;
    end

endmodule
