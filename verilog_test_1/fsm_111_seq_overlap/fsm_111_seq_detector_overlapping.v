module fsm_111_detector(input d,input rst_n,clk,output detect);

localparam s0=2'b00,s1=2'b01,s2=2'b10;

reg [1:0] state,next_state;

always @(posedge clk or negedge rst_n)begin

    if(!rst_n)

        state <= s0;
    else

        state <= next_state;

end

always @(*)begin

    if(state == s0)begin

        if(d == 1)

            next_state = s1;
        else

            next_state = s0;
    end

    else if (state == s1)begin

        if(d == 1)

            next_state = s2;

        else

            next_state = s0;

    end

    else if(state == s2)begin

        if(d == 1)

        next_state = s1;

    else 

        next_state = s0;

end
end

assign detect = ((state == s2) && (d == 1)) ? 1'b1 : 1'b0;


endmodule



