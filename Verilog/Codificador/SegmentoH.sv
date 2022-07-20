module SegmentoH(a,b,c,x);
   input a,b,c;
  output x;
  
  assign x=~a&b&c;
  
endmodule