module tristate (
  input wire OE,
  input wire [4:0] I,
  output reg [4:0] O
            );
  
 // assign O = (~OE) ? I:1'bZ;
  
always @(OE or I)
begin
    if (~OE)
        O = I;
    else
        O = 4'bZZZZ;
end
endmodule

