module mux5b_2to1 (Z,Sel,X,Y);   //////sel=1,z=X    sel=0,z=Y
  parameter WID = 5;
  input wire [WID-1:0] X, Y;
  input wire Sel;
  output wire [WID-1:0] Z;
  
  assign Z= Sel ? X:Y;
endmodule