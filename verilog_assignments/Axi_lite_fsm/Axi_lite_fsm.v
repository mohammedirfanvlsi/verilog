module axi_lite_fsm (
    input  wire clk,
    input  wire rst_n,

    input  wire start_write,

    output reg  awvalid,
    output reg  wvalid,
    output reg  bready,

    input  wire awready,
    input  wire wready,
    input  wire bvalid
);

    localparam IDLE       = 2'd0,
               WRITE_ADDR = 2'd1,
               WRITE_DATA = 2'd2,
               WRITE_RESP = 2'd3;

    reg [1:0] state, next_state;

    // STATE REGISTER
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            state <= IDLE;
        else
            state <= next_state;
    end

    // NEXT STATE LOGIC
    always @(*) begin
        next_state = state;
        case (state)
            IDLE:
                if (start_write)
                    next_state = WRITE_ADDR;

            WRITE_ADDR:
                if (awready)
                    next_state = WRITE_DATA;

            WRITE_DATA:
                if (wready)
                    next_state = WRITE_RESP;

            WRITE_RESP:
                if (bvalid)
                    next_state = IDLE;
        endcase
    end

    // OUTPUT LOGIC (CORRECT AXI STYLE)
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            awvalid <= 0;
            wvalid  <= 0;
            bready  <= 0;
        end else begin
            awvalid <= (state == WRITE_ADDR);
            wvalid  <= (state == WRITE_DATA);
            bready  <= (state == WRITE_RESP);
        end
    end

endmodule
