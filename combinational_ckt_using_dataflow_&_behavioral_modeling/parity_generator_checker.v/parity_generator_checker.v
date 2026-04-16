module parity_generator_dataflow(input [3:0]data,output parity);

assign parity=^data;

endmodule

module parity_generator_behavioral(input [3:0]data,output reg parity);

always @(*)begin

 parity=^data;

 end

endmodule

module parity_checker_dataflow(input [3:0]data,input parity,output error);

assign error=^{data,parity};

endmodule

module parity_checker_behavioral(input [3:0]data,input parity,output reg error);

always @(*)begin

 error=^{data,parity};

 end

 endmodule


 module parity_generator_checker_top(input [3:0]data,output parity_da,output parity_be,output error_da,output error_be);

 wire w1,w2;

 parity_generator_dataflow g2(.data(data),.parity(w1));
 parity_generator_behavioral g1(.data(data),.parity(w2));

parity_checker_dataflow c1(.data(data),.parity(w1),.error(error_da));
parity_checker_behavioral c2(.data(data),.parity(w2),.error(error_be));

assign parity_da=w1;
assign parity_be=w2;

endmodule








