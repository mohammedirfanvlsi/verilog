module t_flipflop_sync_en(input t,input rst,input clk,input en,output reg q);

always @(posedge clk)begin
   
     if(rst)
          
         q<=1'b0;
     else if(en)begin
         if(t)
         q<=~q;
         
        else
            q<=q;
 end

      else

          q<=q;
 end
 endmodule
