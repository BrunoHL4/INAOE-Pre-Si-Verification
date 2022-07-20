// Code your design here
module mux_4to1 (Z,Sel,V,W,X,Y);
  parameter WID = 32;
  input wire [WID-1:0] V,W,X,Y;
  input wire [1:0] Sel;
  output wire [WID-1:0] Z;
  
  assign Z= Sel[0]? (Sel[1]? Y:X) : (Sel[1]? W:V);

  // 11 Y
  // 01 x
  // 10 w
  // 00 v
endmodule