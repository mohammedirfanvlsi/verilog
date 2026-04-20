module clock_freq #(parameter clk_freq = 10, freq = 3); 
 (input clk ,rst_n,output clk1)


localparam integer clk_gen = clk_freq / freq;

reg [15:0]count;

always @ (posedge clk or negedge rst_n)begin

    if (!rst_n)

        clk_gen <= 0;
        count <= 0;

        else begin

            if (count == clk_gen - 1)

                clk1 <= 1'b1;

                count < =1'b0;

            else 

                count <= count + 1;
                clk1 <= 1'b0;

            end
        end
        endmodule


