 module atm_withdrawal_fsm (input card_in,input pin_ok,input withdraw_req,input bal_ok,input dispense,input clk,input rst_n,output cash_out);
 
 localparam idle = 3'd0,card = 3'd1,pin = 3'd2,menu = 3'd3,check = 3'd4,dispense_n = 3'd5;

reg [2:0]state,next_state;

always @(posedge clk or negedge rst_n)begin


if(!rst_n)

    state <= idle;
else
    state <= next_state;

end

always @(*)begin

    next_state = state;

    if(state == idle)begin

        if (card_in)

        next_state = card;
    else 
        next_state = idle;
end

else if (state == card)begin

    next_state = pin;

end

else if(state == pin)begin

    if(pin_ok)

        next_state = menu;
    else
        next_state = idle;
end

else if(state == menu)begin

    if(withdraw_req)
        next_state = check;
    else
        next_state = menu;
end

else if (state == check)begin

    if(bal_ok)
        next_state = dispense_n;
    else 
        next_state = menu;
end

else if(state == dispense_n)begin

    if(dispense)

    next_state = idle;
    
      else

          next_state=idle;

end
end

assign cash_out = (state == dispense_n) ? 1'b1:1'b0;

endmodule


    


