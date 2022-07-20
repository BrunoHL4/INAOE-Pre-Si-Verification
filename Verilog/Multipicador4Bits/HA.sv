module HA (
    input A, B,
    output reg S, Cout
 );
 always @ ( A or B)
 begin
     {Cout, S} = A + B;
 end
 endmodule