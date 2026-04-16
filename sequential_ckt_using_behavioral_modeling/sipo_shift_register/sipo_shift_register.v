module sipo_shift_register(input din,input rst_n,input clk,output [3:0]dout);
 
reg [3:0]q;
 
always @(posedge clk or negedge rst_n)begin
   
     if(!rst_n)
          
         q<=4'b0000;
     else 

         q<=(q<<1)|din;
        
 end
        
  assign dout= q[3:0];   

 endmodule
