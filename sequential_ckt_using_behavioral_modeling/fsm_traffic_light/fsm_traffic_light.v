module fsm_traffic_light(input rst_n,input clk,output reg red,output reg green,output reg yellow);

localparam red_n=2'b00,green_n=2'b01,yellow_n=2'b10;

reg [1:0] state,next_state;

always @(posedge clk or negedge rst_n)begin

    if (!rst_n)

        state <= red;


    else 

        state <= next_state;

end

always @(*)begin

    if(state == red_n)

        next_state = green_n;

    else if (state == green_n)

        next_state = yellow_n;

    else if (state == yellow_n)

        next_state = red_n;

    else 
         
        next_state = red_n;

end

always @(*)begin

    red=0;
    green=0;
    yellow=0;


     if(state == red_n)

        red = 1;

     if(state == green_n)

        green = 1; 

     if(state == yellow_n)

        yellow = 1;

end

endmodule






