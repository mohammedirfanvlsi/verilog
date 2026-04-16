module pipo_shift_register(input [3:0] din,input rst_n,input clk,input load,output [3:0]dout);
 
reg [3:0]q;
 
always @(posedge clk or negedge rst_n)begin
   
     if(!rst_n)
          
         q<=4'b0000;
     else if (load)

         q<=din;
     else 
         q<=q;
        
 end 

 assign dout = q;

 endmodule
