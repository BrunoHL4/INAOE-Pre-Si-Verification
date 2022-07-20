module SegmentoE(a,b,c,d,x);
   input a,b,c,d;
  output x;
  wire w1,w2,w3,w4;
  
  Not U1 (b,w1);
  Not U2 (d,w2);
  And U3 (c,w2,w3);
  And U4 (w1,w2,w4);
  Or U5 (w3,w4,x);
  
endmodule