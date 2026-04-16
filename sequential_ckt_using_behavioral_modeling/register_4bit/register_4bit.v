module register_4bit(input [3:0]d,input rst_n,input clk,input en,output reg [3:0]q);

always @(posedge clk or negedge rst_n)begin
   
     if(!rst_n)
          
         q<=4'b0000;
     else if (en)

         q<=d;
        
     else 
        
        q <=q;   

 end
 endmodule
