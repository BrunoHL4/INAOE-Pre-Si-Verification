module SegmentoV(D0,D1,D2,D3,x);
   input D0,D1,D2,D3;
  output x;
  
  assign x=D0|D1|D2|D3;
  
endmodule