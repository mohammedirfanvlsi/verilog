module rca_adder_tb;


reg [3:0]a,b;
reg cin;

wire [3:0]sum;
wire  carry;

rca_adder dut (.a(a),.b(b),.cin(cin),.sum(sum),.carry(carry));

integer i;

initial begin

    $dumpfile("rca_adder.vcd");
    $dumpvars(0,rca_adder_tb);

    $monitor("time=%0t | a=%b,b=%b,cin=%b | sum=%b,carry=%b",$time,a,b,cin,sum,carry);

    for (i=0;i<16;i=i+1)begin


        cin =i[0];
        a=i;
        b=i;#10;

    end

    $finish;
end
    endmodule
