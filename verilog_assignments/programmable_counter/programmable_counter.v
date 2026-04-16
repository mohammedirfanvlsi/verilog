module programmable_counter#(parameter width = 4)(input load,input [width-1:0]load_val,input en,input [width-1:0]max_val,input rst_n,clk,output [width-1:0]count,output done);

reg[width-1:0]q;

always @(posedge clk or negedge rst_n)begin

    if (!rst_n)begin

        q <= 4'b0;

    end

        else if (load)begin

            q <= load_val;

    end
        
    else if (en)begin

        if(q == max_val)

            q <= 0;

        else 

            q <= q + 1;

    end

        else begin

            q <= q;

        end
    end

    assign count = q;
    assign done = (q == max_val) ? 1'b1 : 1'b0;

    endmodule



