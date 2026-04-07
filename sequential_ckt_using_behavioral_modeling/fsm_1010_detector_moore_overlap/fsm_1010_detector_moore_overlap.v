module fsm_seq_detector(input din,input rst_n,input clk,output reg detect);

localparam s0=3'd0,s1=3'd1,s2=3'd2,s3=3'd3,s4=3'd4;

reg [2:0] state,next_state;

always @(posedge clk or negedge rst_n)begin

    if(!rst_n)

        state <= s0;

    else 

        state <= next_state;
end

always @(*)begin

    if (state == s0)begin

        if (din == 1)

            next_state = s1;
        else
            next_state = s0;

    end

 if (state == s1)begin

        if (din == 0)

            next_state = s2;
        else
            next_state = s1;

    end

 if (state == s2)begin

        if (din == 1)

            next_state = s3;
        else
            next_state = s0;

    end

 if (state == s3)begin

        if (din == 0)

            next_state = s4;
        else
            next_state = s1;

    end

 if (state == s4)begin

        if (din == 1)

            next_state = s3;
        else
            next_state = s0;

    end
end

always @(*)begin

    if(state == s4)

        detect = 1;
    else 
        detect =0;
end

endmodule
