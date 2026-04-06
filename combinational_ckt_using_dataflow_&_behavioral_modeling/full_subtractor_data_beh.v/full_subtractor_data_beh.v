module full_subtractor_dataflow (input a,b,bin,output diff,borrow);


assign diff=a^b^bin;
assign borrow=(~a&b)|(~a&bin)|(b&bin);

endmodule

module full_subtractor_behavioral (input a,b,bin,output reg diff,borrow);

always @(*)begin

  diff=a^b^bin;
  borrow=(~a&b)|(~a&bin)|(b&bin);

end
endmodule

module full_subtractor_top(input a,b,bin,output diff_da,borrow_da,output diff_be,borrow_be);

  full_subtractor_dataflow fs1(.a(a),.b(b),.bin(bin),.diff(diff_da),.borrow(borrow_da));

  full_subtractor_behavioral fs2 (.a(a),.b(b),.bin(bin),.diff(diff_be),.borrow(borrow_be));

   endmodule



