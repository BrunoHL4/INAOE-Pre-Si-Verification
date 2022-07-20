module SegmentoY(D0,D1,D2,D3,D4,D5,D6,D7,x);
   input D0,D1,D2,D3,D4,D5,D6,D7;
  output x;
  
  assign x=D2|D3|D6|D7;
  
endmodule