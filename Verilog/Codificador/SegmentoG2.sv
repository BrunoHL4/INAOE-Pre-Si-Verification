module SegmentoG2(a,b,c,x);
   input a,b,c;
  output x;
  
  assign x=(a&b&~c)|(a&~b&c);
  
endmodule