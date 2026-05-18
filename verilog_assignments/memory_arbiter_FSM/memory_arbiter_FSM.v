module memory_arbiter_fsm (
    input  wire clk,
    input  wire rst_n,

    input  wire req0,      // request from master 0
    input  wire req1,      // request from master 1

    output reg  grant0,    // grant to master 0
    output reg  grant1     // grant to master 1
);

    // State encoding
    localparam IDLE   = 2'b00,GNT0 = 2'b01,GNT1 = 2'b10;

    reg [1:0]state, next_state;

    // State register
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            state <= IDLE;
        else
            state <= next_state;
    end

    // Next-state logic
    always @(*) begin
        next_state = state;

        case (state)
            IDLE: begin
                if (req0)
                    next_state = GNT0;
                else if (req1)
                    next_state = GNT1;
            end

            GNT0: begin
                if (!req0)
                    next_state = IDLE;
            end

            GNT1: begin
                if (!req1)
                    next_state = IDLE;
            end
        endcase
    end

    // Output logic
    always @(*) begin
        grant0 = 0;
        grant1 = 0;

    if(state == GNT0 && req0)

       grant0 = 1'b1;

    else if (state == GNT1 && req1)

      grant1 = 1'b1; 

       
    end

endmodule
