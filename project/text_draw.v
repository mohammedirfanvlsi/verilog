//==================================================
// Draw party names using blocks
//==================================================
module text_draw (
    input [2:0] party,
    input [9:0] x,
    input [9:0] y,
    input [9:0] x0,
    input [9:0] y0,
    output reg pixel_on
);

    always @(*) begin
        pixel_on = 0;

        // Simple block letters (approx)
        // Width per letter = 20 px

        case(party)
            0: if(x>=x0 && x<x0+60 && y>=y0 && y<y0+20) pixel_on=1; // DMK
            1: if(x>=x0 && x<x0+80 && y>=y0 && y<y0+20) pixel_on=1; // ADMK
            2: if(x>=x0 && x<x0+60 && y>=y0 && y<y0+20) pixel_on=1; // TVK
            3: if(x>=x0 && x<x0+60 && y>=y0 && y<y0+20) pixel_on=1; // NTK
            4: if(x>=x0 && x<x0+100 && y>=y0 && y<y0+20) pixel_on=1; // OTHER
        endcase
    end
endmodule
