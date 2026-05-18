module second_largest (input [3:0]a,b,c,d,output reg  [3:0]second_max);

reg [3:0] max1,max2;


always @(*)begin

   max1=a;
   max2=0;

   if(b>max1)begin

       max2=max1;
       max1=b;
   end

   else if(b>max2)begin

       max2=b;
   end

   if(c>max1)begin

       max2=max1;
       max1=c;
   end

   else if(c>max2)begin

       max2=c;
   end

   if(d>max1)begin

       max2=max1;
       max1=d;
   end

   else if(d>max2)begin
       max2=d;
   end

   second_max = max2;

   end  

   endmodule
       
    
