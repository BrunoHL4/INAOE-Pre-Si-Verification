module SegmentoF(a,b,c,d,x);
   input a,b,c,d;
  output x;
  wire w1,w2,w3,w4,w5,w6,w7,w8;
  
  Not U1 (c,w1);
  Not U2 (d,w2);
  And U3 (w1,w2,w3);
  And U4 (b,w1,w4);
  And U5 (b,w2,w5);
  Or U6 (w3,w4,w6);
  Or U7 (w6,w5,w7);
  Or U8 (a,w7,w8);
  
endmodule