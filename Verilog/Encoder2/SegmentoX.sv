module SegmentoX(D0,D1,D2,D3,x);
   input D0,D1,D2,D3;
  output x;
  
  assign x=D3|D2;
  
endmodule