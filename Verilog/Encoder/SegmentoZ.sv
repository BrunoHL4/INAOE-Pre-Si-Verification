module SegmentoZ(D0,D1,D2,D3,D4,D5,D6,D7,x);
   input D0,D1,D2,D3,D4,D5,D6,D7;
  output x;
  
  assign x=D1|D3|D5|D7;
  
endmodule