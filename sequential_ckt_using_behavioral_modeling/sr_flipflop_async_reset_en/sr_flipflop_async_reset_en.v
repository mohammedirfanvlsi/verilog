module sr_flipflop_async_en(input s,input r,input rst_n,input clk,input en,output reg q);

always @(posedge clk or negedge rst_n)begin
   
     if(!rst_n)
          
         q<=1'b0;
     else if(en)begin
         case({s,r})
            
             2'b00:q<=q;
             2'b01:q<=1'b0;
             2'b10:q<=1'b1;
             2'b11:q<=q;
    
          endcase
      end   

        else
            q<=q;

  end
 endmodule
