module SegmentoG1(a,b,c,x);
   input a,b,c;
  output x;
  
  assign x=(~a&~b)|(a&b)|(a&c);
  
endmodule