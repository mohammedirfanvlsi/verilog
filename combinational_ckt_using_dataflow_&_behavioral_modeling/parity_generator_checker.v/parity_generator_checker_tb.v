module parity_generator_checker_tb;

reg [3:0]data;
wire parity_da;
wire parity_be;
wire error_da;
wire error_be;

parity_generator_checker_top dut(.data(data),.parity_da(parity_da),.parity_be(parity_be),.error_da(error_da),.error_be(error_be));

integer i;

initial begin 
    $dumpfile("parity_generator_checker.vcd");
    $dumpvars(0,parity_generator_checker_tb);

    $monitor("time=%0t | data=%b | parity_da=%b,parity_be=%b,error_da=%b,error_be=%b",$time,data,parity_da,parity_be,error_da,error_be);

    for(i=0;i<16;i=i+1)begin

        data=i;#10;

    end

$finish;

end
endmodule

