//==================================================
// Winner logic: finds party with max votes
//==================================================
module winner_logic (
    input [7:0] c0,
    input [7:0] c1,
    input [7:0] c2,
    input [7:0] c3,
    input [7:0] c4,
    output reg [2:0] winner
);

    always @(*) begin
        winner = 0;
        if (c1 > c0) winner = 1;
        if (c2 > (winner==0 ? c0 : c1)) winner = 2;
        if (c3 > (winner==2 ? c2 : (winner==1 ? c1 : c0))) winner = 3;
        if (c4 > (winner==3 ? c3 : (winner==2 ? c2 :
                    (winner==1 ? c1 : c0)))) winner = 4;
    end

endmodule
