module SegmentoA(a,b,c,d,x);
   input a,b,c,d;
  output x;
  wire w1,w2,w3,w4,w5,w6;
  
  Not U1 (b,w1);
  Not U2 (d,w2);
  And U3 (w1,w2,w3);
  And U4 (b,d,w4);
  Or U5 (w3,w4,w5);
  Or U6 (w5,c,w6);
  Or U7 (w6,a,x);
  
endmodule