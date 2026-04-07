module ripple_counter(input rst_n,input clk,output reg [3:0]q);

always @(posedge clk or negedge rst_n)begin

    if(!rst_n)

        q[0] <= 1'b0;

    else 

        q[0] <= ~q[0];
end

always @( posedge q[0] or negedge rst_n)begin

    if(!rst_n)

        q[1] <= 1'b0;

    else 

        q[1] <= ~q[1];
end


always @( posedge q[1] or negedge rst_n)begin

    if(!rst_n)

        q[2] <= 1'b0;

    else 

        q[2] <= ~q[2];
end

always @( posedge q[2] or negedge rst_n)begin

    if(!rst_n)

        q[3] <= 1'b0;

    else 

        q[3] <= ~q[3];
end

endmodule
