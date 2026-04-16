module universal_shift_register(input din,input [3:0]pload,input rst_n,input clk,input [1:0]mode,output [3:0]dout);

reg [3:0]q;

always @(posedge clk or negedge rst_n)begin
   
     if(!rst_n)
          
         q<=4'b0000;

     else begin
     case(mode)
         2'b00:q<=q;
          2'b01:q<=(q>>1)| (din<<3);
          2'b10:q<=(q<<1) | din;
          2'b11:q<=pload;

       endcase
   end  
end

assign dout = q;

 endmodule
