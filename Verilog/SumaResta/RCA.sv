module RCA (
  input [3:0] A, B,  
  input Sub,
  output Cout,CFout,
 
  output [3:0] S
);
wire wc1,wc2,wc3;
wire wx0,wx1,wx2,wx3;
  wire wN;
  
  xor xor0 (wx0,B[0],Sub);
  FA FA0 (.A(A[0]),.B(wx0),.Cin(Sub),.S(S[0]),.Cout(wc1));
  
  xor xor1 (wx1,B[1],Sub);
  FA FA1 (.A(A[1]),.B(wx1),.Cin(wc1),.S(S[1]),.Cout(wc2));
  
  xor xor2 (wx2,B[2],Sub);
  FA FA2 (.A(A[2]),.B(wx2),.Cin(wc2),.S(S[2]),.Cout(wc3));
  
  xor xor3 (wx3,B[3],Sub); 
  FA FA3 (.A(A[3]),.B(wx3),.Cin(wc3),.S(S[3]),.Cout(Cout));
  
  not (wN,Sub);
  and (CFout,wN,Cout);
  

  
endmodule