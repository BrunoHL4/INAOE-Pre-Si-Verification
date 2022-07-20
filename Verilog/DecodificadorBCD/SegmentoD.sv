module SegmentoD(a,b,c,d,x);
   input a,b,c,d;
  output x;
  wire w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11;
  
  Not U1 (b,w1);
  Not U2 (c,w2);
  Not U3 (d,w3);
  And U4 (w1,w3,w4);
  And U5 (w1,c,w5);
  And U6 (w2,d,w6);
  And U7 (c,w3,w7);
  Or U8 (w4,w5,w8);
  And U9 (b,w6,w9);
  Or U10 (w8,w9,w10);
  Or U11 (w10,w7,w11);
  Or U12 (a,w11,x);
  
endmodule