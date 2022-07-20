module Circuito2(a,b,c,s);
  input a,b,c;
  output s;
  wire w1,w2,w3,w4,w5,w6;
  
  Not U1 (a,w1);
  Not U2 (b,w2);
  Not U3 (c,w3);
  And_3 U4 (w1,w2,c,w4);
  And_3 U5 (w1,b,c,w5);
  And_3 U6 (a,w2,w3,w6);
  Or_3 U7 (w4,w5,w6,s);
  
endmodule