module mux ( 
  input [4:0] X,
  input [4:0] Y,
  input Sel,
  output [4:0] Z
);
  reg [4:0]Mux_Out;
  

  always @(Sel,X,Y)
  begin
if (Sel == 1'b0 ) 
Mux_Out= X;
else if (Sel == 1'b1 ) 
Mux_Out=Y ;
else  
Mux_Out= 1'bX;
end 
  
  assign Z=Mux_Out;
  
endmodule