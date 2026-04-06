module comparator_4bit_tb;

    reg  [3:0] a;
    reg  [3:0] b;

    wire gt_da,lt_da,eq_da;
     wire gt_be,lt_be,eq_be;

 comparator_4bit_top dut (.a(a),.b(b),.gt_da(gt_da),.lt_da(lt_da),.eq_da(eq_da),.gt_be(gt_be),.lt_be(lt_be),.eq_be(eq_be));

    integer i;

    initial begin
   $dumpfile("comparator_4bit.vcd");
   $dumpvars(0,comparator_4bit_tb);

        $monitor("time=%0t | a=%b b=%b |  gt_da=%b lt_da=%b eq_da=%b | gt_be=%b lt_be=%b eq_be=%b",
                 $time, a, b, gt_da, lt_da, eq_da, gt_be, lt_be, eq_be);

    for(i=0;i<16;i=i+1)begin
     
      {a,b}=i;#10;

    end
$finish;
end

endmodule
