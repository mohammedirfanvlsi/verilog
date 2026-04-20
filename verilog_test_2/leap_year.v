module leap_year(input feb,input date29,output reg leap_year );
 

always @(*)begin

    if(feb)begin

        if(date29)

            leap_year = 1'b1;
    end

    else

        leap_year = 1'b0;
end
endmodule



