module SegmentoK(a,b,c,x);
   input a,b,c;
  output x;
  
  assign x=(b&c)|(~a&~b);
  
endmodule