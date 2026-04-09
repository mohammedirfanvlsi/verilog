module single_port_ram #(parameter depth=8,width=8)(input [width-1:0]din,input rst_n,clk,input wr_en,re_en,input [2:0]addr,output reg [width-1:0]dout);

reg [width-1:0] mem[0:depth-1];

always @(posedge clk or negedge rst_n)begin

    if (!rst_n)begin

        dout <= 8'b0;

    end

    else if(wr_en)begin

        mem[addr] <= din;

    end

    else if (re_en)begin

        dout <= mem[addr];

    end

end

endmodule



