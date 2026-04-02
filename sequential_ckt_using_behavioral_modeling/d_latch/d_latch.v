module d_latch(input d,input rst_n,input en,output reg q);

always @(*)begin
   
     if(!rst_n)
          
         q=1'b0;
     else if (en)
         q=d;

 end
 endmodule
