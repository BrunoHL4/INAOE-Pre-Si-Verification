module SegmentoF(a,b,c,d,x);
   input a,b,c,d;
  output x;
  wire w1,w2,w3,w4,w5,w6,w7,w8;
  
  Not U1 (b,w1);
  Not U2 (c,w2);
  Not U3 (d,w3);
  
  And U4 (w1,c,w4);
  And U5 (b,w2,w5);
  And U6 (c,w3,w6);
  
  
  Or U7 (w4,w5,w7);
  Or U8 (w6,w7,w8);
  Or U9 (a,w8,x);
  
endmodule