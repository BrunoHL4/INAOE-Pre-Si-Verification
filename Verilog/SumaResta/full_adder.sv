module full_adder (
    input A, B, Cin,
    output  S, Cout
 );
 wire w1,w2,w3; 
   xor  (w3, A, B);
   xor  (S,w3,Cin);
   and  (w1,A , B);
   and  (w2,w3 , Cin);
   or (Cout, w1,w2);
 endmodule