module synchronous_fifo #(parameter depth =8,width = 8)(input [width-1:0]din,input rst_n,clk,wr_en,re_en,output reg[width-1:0]dout,output  full,empty);

reg [width-1:0] mem [0:depth-1];
reg [2:0] wr_ptr = 0,re_ptr = 0;

always @(posedge clk or negedge rst_n)begin

    if(!rst_n)begin
         wr_ptr <= 3'b000;
         re_ptr <= 3'b000;
         dout <= 8'b0;
         
     end

     else begin

       if(wr_en && !full)begin

           mem[wr_ptr] <= din;
           wr_ptr <= wr_ptr + 1;

       end

        if(re_en && !empty)begin

            dout <= mem[re_ptr];
            re_ptr <= re_ptr + 1;

        end
    end
end
       
            assign full = ((wr_ptr + 1'b1) == re_ptr) ? 1'b1 : 1'b0;
            assign empty = (wr_ptr == re_ptr) ? 1'b1 : 1'b0;

     

endmodule







