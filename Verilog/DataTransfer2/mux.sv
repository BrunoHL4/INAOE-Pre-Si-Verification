module mux(
  
      input wire [4:0]a,b,
      input wire [7:0]c,
      input wire d,
      input wire [1:0] Sel
      output wire [7:0] f
);
  begin
    
always @*
  if (Sel=2'b00) 
f=a;
    else if (Sel=2'b01) 
f =c ;
    else if (Sel=2'b10) 
f =b ;
    else if (Sel=2'b11)
f =d ;
else  
Z = 8'bXXXXXXXX;
    
end 
endmodule