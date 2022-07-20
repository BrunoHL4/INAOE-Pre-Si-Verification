module SegmentoJ(a,b,c,x);
   input a,b,c;
  output x;
  
  assign x=(~a&~b)|(a&b&c);
  
endmodule