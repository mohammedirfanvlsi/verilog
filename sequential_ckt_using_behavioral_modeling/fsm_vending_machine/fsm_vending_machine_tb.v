module fsm_vending_machine_tb;

reg coin5;
reg coin10;
reg rst_n;
reg clk;

wire dispense;
wire change;

fsm_vending_machine dut (.coin5(coin5),.coin10(coin10),.rst_n(rst_n),.clk(clk),.dispense(dispense),.change(change));

always #5 clk = ~clk;

initial begin 

    $dumpfile("fsm_vending_machine.vcd");
    $dumpvars(0,fsm_vending_machine_tb);

    $monitor("time=%0t | coin5=%b,coin10=%b,rst_n=%b,clk=%b | dispense=%b,change=%b",$time,coin5,coin10,rst_n,clk,dispense,change);

    clk=0;
    rst_n=0;
    coin5=0;
    coin10=0;

    @(posedge clk);
    rst_n=1;

    coin5=1;
    @(posedge clk);
    coin5=0;

    coin10=1;
    @(posedge clk);
    coin10=0;

     
    repeat(4) @(posedge clk);

    $finish;

end

endmodule
