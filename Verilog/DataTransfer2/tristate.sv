module tristate (
  input wire OE,
  input wire [3:0] I,
  output reg [7:0] O
            );
  
always @(OE or I)
begin
    if (~OE)
        O = I;
    else
        O = 8'bZZZZZZZZ;
end
endmodule