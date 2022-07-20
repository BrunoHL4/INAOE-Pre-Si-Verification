module mux2_1 (Z,Sel,X,Y);
  parameter WID = 32;
  input wire [WID-1:0] X, Y;
  input wire Sel;
  output wire [WID-1:0] Z;
  
  assign Z= Sel ? X:Y;
  
endmodule