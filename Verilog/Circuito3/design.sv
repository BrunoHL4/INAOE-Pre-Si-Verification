// *********************************************************************************
// Project Name : CTO3
// Author       : Bruno Hernández López
// Email        : brunohlopez@hotmail.com
// Module Name  : design.sv
// Create Date  : 2022/05/03 12:54pm
// CopyRight(c) : All Rights Reserved
//
// *********************************************************************************
// Modification History:
// Date             By              Version                 Change Description
// -----------------------------------------------------------------------
// XXXX       		BHL4          1.0                        Original
//  
// *********************************************************************************

module hola(a,b,c,d,s1,s2);
  input a,b,c,d;
  output s1,s2;
  wire w1,w2,w3,w4,w5,w6;
  
  Not U1 (a,w1);
  Not U2 (b,w2);
  Not U3 (c,w3);
  Not U4 (d,w4);
  And U5 (a,b,1'b1,w3,w5);
  And U6 (w1,w2,w3,w4,w6);
  And U7 (a,w2,c,d,w7);
  Or U8 (w5,w6,w7,s1);
  
endmodule