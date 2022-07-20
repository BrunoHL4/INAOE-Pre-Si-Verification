// *********************************************************************************
// Project Name : Sub_sum
// Author       : Bruno Hernández López
// Email        : brunohlopez@hotmail.com
// Module Name  : design.sv
// Create Date  : 2022/05/06 1:08pm
// CopyRight(c) : All Rights Reserved
//
// *********************************************************************************
// Modification History:
// Date             By              Version                 Change Description
// -----------------------------------------------------------------------
// XXXX       		BHL4         	 1.0                        Original
//  
// *********************************************************************************

`include "full_adder.sv"
`include "RCA.sv"

module sumres3(a,b,c,sub,CFout,Cout,S1,S2);
 
  input [3:0]a,b,c;
 	input sub;
  output [1:0] Cout,CFout;
  output [5:0] S1, S2;
  
 
  RCA RCA0 (.A(A), .B(B), .sub(sub), .S(S1[4:0]), .Cout(Cout[0]),.CFout(CFout[0]));
  RCA RCA1 (.A(S1[3:0]),.B(C),.sub(sub),.S(S2[4:0]),.Cout(Cout[1]),.CFout(CFout[1]));

  full_adder FA0 (.A(CFout[0]),.B(CFout[1]),.Cin(1'b0),.S(S2[4]),.Cout(S2[5]));
 
endmodule