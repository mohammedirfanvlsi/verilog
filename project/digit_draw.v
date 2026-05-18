//==================================================
// Draw single digit using 7-segment style
//==================================================
module digit_draw (
    input [3:0] digit,
    input [9:0] x,
    input [9:0] y,
    input [9:0] x0,
    input [9:0] y0,
    output reg pixel_on
);

    // segment size
    localparam W = 12;
    localparam H = 20;

    // segment enable
    reg a,b,c,d,e,f,g;

    always @(*) begin
        {a,b,c,d,e,f,g} = 7'b0000000;
        case(digit)
            0: {a,b,c,d,e,f} = 6'b111111;
            1: {b,c} = 2'b11;
            2: {a,b,g,e,d} = 5'b11111;
            3: {a,b,g,c,d} = 5'b11111;
            4: {f,g,b,c} = 4'b1111;
            5: {a,f,g,c,d} = 5'b11111;
            6: {a,f,e,d,c,g} = 6'b111111;
            7: {a,b,c} = 3'b111;
            8: {a,b,c,d,e,f,g} = 7'b1111111;
            9: {a,b,c,d,f,g} = 6'b111111;
        endcase
    end

    always @(*) begin
        pixel_on = 0;

        // a
        if (a && x>=x0 && x<x0+W && y>=y0 && y<y0+3) pixel_on=1;
        // d
        if (d && x>=x0 && x<x0+W && y>=y0+H && y<y0+H+3) pixel_on=1;
        // g
        if (g && x>=x0 && x<x0+W && y>=y0+H/2 && y<y0+H/2+3) pixel_on=1;

        // f
        if (f && x>=x0 && x<x0+3 && y>=y0 && y<y0+H/2) pixel_on=1;
        // e
        if (e && x>=x0 && x<x0+3 && y>=y0+H/2 && y<y0+H) pixel_on=1;

        // b
        if (b && x>=x0+W-3 && x<x0+W && y>=y0 && y<y0+H/2) pixel_on=1;
        // c
        if (c && x>=x0+W-3 && x<x0+W && y>=y0+H/2 && y<y0+H) pixel_on=1;
    end

endmodule
