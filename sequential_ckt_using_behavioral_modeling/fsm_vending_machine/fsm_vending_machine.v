module fsm_vending_machine (input coin5,input coin10,input rst_n,input clk,output reg dispense,output reg change);

localparam s0=2'd0,s1=2'd1,s2=2'd2;

reg [1:0] state,next_state;

always @(posedge clk or negedge rst_n)begin

    if (!rst_n)

        state <= s0;

    else 

        state <= next_state;

end

always @(*)begin

    if(state == s0)begin

        if(coin5)

            next_state = s1;

        else 

            next_state=s0;
    end

    else if(state == s1)begin

        if(coin5 || coin10)

            next_state = s2;

        else

            next_state =s1;
    end

    else if(state == s2)


            next_state = s0;

        else 

            next_state=s0;
    end



    always @(*)begin

        dispense = 0;
        change = 0;

        if (state == s2)
             
           dispense = 1;

         else

            dispense =0; 


          if(state == s1)begin


              if(coin10)
                
                 change = 1;
            else

               change = 0;   
       end
   end
endmodule

  
