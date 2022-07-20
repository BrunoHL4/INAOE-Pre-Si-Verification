module SegmentoC(a,b,c,d,x);
   input a,b,c,d;
  output x;
  wire w1,w2;
  
  Not U1 (c,w1);
  Or U2 (b,d,w2);
  Or U3 (w1,w2,x);
  
endmodule