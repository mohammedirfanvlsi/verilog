module button_edge (
    input  clk,        // 100 MHz system clock
    input  btn,        // push button input
    output reg pulse   // 1-clock pulse on press
);

    reg btn_d;          // delayed button

    always @(posedge clk) begin
        btn_d  <= btn;                 // store previous state
        pulse  <= btn & ~btn_d;        // rising edge detect
    end

endmodule
