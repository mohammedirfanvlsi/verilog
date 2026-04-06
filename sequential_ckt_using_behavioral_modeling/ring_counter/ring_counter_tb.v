module ring_counter_tb;
    reg clk;
    reg rst_n;
    wire [3:0] q;  


    ring_counter #(.width(4)) dut (.clk(clk),.rst_n(rst_n),.q(q));

  
    always #5 clk = ~clk;

    initial begin
    
        $dumpfile("ring_counter.vcd");
        $dumpvars(0, ring_counter_tb);

  
        $monitor("time=%0t | rst_n=%b clk=%b q=%b",
                  $time, rst_n, clk, q);

      
        clk   = 0;
        rst_n = 0;

        
        @(posedge clk);
        rst_n = 1;

        repeat (10) @(posedge clk);

        $finish;
    end

endmodule
