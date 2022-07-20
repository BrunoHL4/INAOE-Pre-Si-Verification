// *********************************************************************************
// Project Name : CTO2
// Author       : Bruno Hernández López
// Email        : brunohlopez@hotmail.com
// Module Name  : design.sv
// Create Date  : 2022/05/03 12:12pm	
// CopyRight(c) : All Rights Reserved
//
// *********************************************************************************
// Modification History:
// Date             By              Version                 Change Description
// -----------------------------------------------------------------------
// XXXX       		BHL4          1.0                        Original
//  
// *********************************************************************************

module CTO2(a,b,c,s);
  input a,b,c;
  output s;
  wire w1,w2,w3,w4,w5,w6;
  
  Not U1 (a,w1);
  Not U2 (b,w2);
  Not U3 (c,w3);
  And U4 (w1,w2,c,w4);
  And U5 (w1,b,c,w5);
  And U6 (a,w2,w3,w6);
  Or U7 (w4,w5,w6,s);
  
endmodule