module SegmentoB(a,b,c,d,x);
   input a,b,c,d;
  output x;
  wire w1,w2,w3,w4,w5,w6;
  
  Not U1 (b,w1);
  Not U2 (c,w2);
  Not U3 (d,w3);
  And U4 (w2,w3,w4);
  And U5 (c,d,w5);
  Or U6 (w4,w5,w6);
  Or U7 (w6,b,x);
  
endmodule