module mod_n_counter (input [3:0]mod_n,input clk,input rst_n,input en,input load,input  [3:0] load_val,output reg [3:0] count);
 


always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        count <= 4'd0;                    
    else if (load)
        count <= load_val;                 
    else if (en) begin                 
        if (count == mod_n -1)
            count <= 0;                 
        else
            count <= count + 1;
    end
    else
        count <= count;                    
end
endmodule
