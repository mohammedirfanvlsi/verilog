module t_latch(input t,input rst_n,input en,output reg q);

always @(*)begin
   
     if(!rst_n)
          
         q=1'b0;
     else if (en)begin
         if(t)
         q=~q;
 end

 end
 endmodule
