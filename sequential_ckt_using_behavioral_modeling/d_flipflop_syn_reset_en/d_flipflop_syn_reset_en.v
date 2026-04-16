module d_flipflop_sync_en(input d,input rst,input clk,input en,output reg q);

always @(posedge clk)begin
   
     if(rst)
          
         q<=1'b0;
     else if(en)
         q<=d;
      else

         q<=q;
 end
 endmodule
