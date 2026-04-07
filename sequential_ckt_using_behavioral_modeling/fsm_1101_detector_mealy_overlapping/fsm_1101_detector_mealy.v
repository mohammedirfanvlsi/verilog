module fsm_seq_detector(input din,input rst_n,input clk,output reg detect);

localparam s0=2'b00,s1=2'b01,s2=2'b10,s3=2'b11;

reg [1:0] state,next_state;

always @(posedge clk or negedge rst_n)begin

    if(!rst_n)

        state <= s0;

    else

        state <= next_state;

end

always @(*)begin

    if(state==s0)begin

        if(din == 1)

            next_state = s1;

        else 

            next_state = s0;
    end

    if(state==s1)begin

        if(din == 1)

            next_state = s2;

        else 

            next_state = s0;
    end

    if(state==s2)begin

        if(din == 0)

            next_state = s3;

        else 

            next_state = s2;
    end

    if(state==s3)begin

        if(din == 1)

            next_state = s1;

        else 

            next_state = s0;
    end
end 

always @(*)begin

    if (state == s3 && din==1 )

        detect = 1;
    
    else 

        detect = 0;

end

endmodule













