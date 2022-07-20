module CTO3_Clase (a,b,c,s);
  
  input a,b,c;
  output s;
  wire w1,w2,w3,w4,w5,w6;
  
  Circuito1 U1(a,b,c,s,w1);
  Circuito2 U2(a,b,c,w2);
  Or U4(w1,w2,s);
  
endmodule