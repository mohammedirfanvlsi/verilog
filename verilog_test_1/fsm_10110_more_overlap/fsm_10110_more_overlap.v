module fsm_10110_detector(input d,input rst_n,clk,output detect);

localparam s0=3'd0,s1=3'd1,s2=3'd2,s3=3'd3,s4=3'd4,s5=3'd5;

reg [2:0] state,next_state;

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

        if(d == 0)

            next_state = s2;

        else

            next_state = s1;

    end

    else if(state == s2)begin

        if(d == 1)

        next_state = s3;

    else 

        next_state = s0;

end

    else if(state == s3)begin

        if(d == 1)

        next_state = s4;

    else 

        next_state = s0;

end

    else if(state == s4)begin

        if(d == 0)

        next_state = s5;

    else 

        next_state = s1;
end

    else if(state == s5)begin

        if(d == 1)

        next_state = s3;

    else 

        next_state = s0;

end
end

assign detect = (state == s5)  ? 1'b1 : 1'b0;


endmodule


 
