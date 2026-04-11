module dual_port_ram #(parameter depth =8,width =8)(input [width-1:0]din,input clk1,clk2,input rst_n,input wr_en,re_en, input [2:0]wr_addr,input [2:0]re_addr,output reg [width-1:0]dout);

reg[width-1:0] mem[0:depth-1];

always @(posedge clk1 or negedge rst_n)begin

    if(!rst_n)

        dout <= 8'b0;

    else if (wr_en)

        mem[wr_addr] <= din;

end

always @(posedge clk2 or negedge rst_n)begin

    if(!rst_n)

        dout <= 8'b0;

    else if(re_en)

            dout <= mem[re_addr];

end

endmodule




