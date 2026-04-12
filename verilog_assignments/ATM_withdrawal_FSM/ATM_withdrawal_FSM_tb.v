module atm_withdrawal_fsm_tb;

reg card_in,pin_ok,withdraw_req,bal_ok,dispense;
reg rst_n,clk;

wire cash_out;

atm_withdrawal_fsm dut (.card_in(card_in),.pin_ok(pin_ok),.withdraw_req(withdraw_req),.bal_ok(bal_ok),.dispense(dispense),.rst_n(rst_n),.clk(clk),.cash_out(cash_out));

always #5 clk = ~clk;

initial begin

    $dumpfile("atm_withdrawal_fsm.vcd");
    $dumpvars(0,atm_withdrawal_fsm_tb);

    $monitor("time =%0t |card_in=%b,pin_ok=%b,withdraw_req=%b,bal_ok=%b,dispense=%b,rst_n=%b,clk=%b | cash_out=%b",$time,card_in,pin_ok,withdraw_req,bal_ok,dispense,rst_n,clk,cash_out);

end

initial begin

    clk =0;
    card_in=0;
    pin_ok=0;
    withdraw_req=0;
    bal_ok=0;
    dispense=0;
    rst_n=0;

    @(posedge clk);
    rst_n=1;

    card_in=1;
    @(posedge clk);
  

    pin_ok=1;
    @(posedge clk);

     withdraw_req=1;
     @(posedge clk);

     bal_ok=1;
     @(posedge clk);

     dispense=1;
     @(posedge clk);


    repeat(3)@(posedge clk);





    

    $finish;

end

endmodule
