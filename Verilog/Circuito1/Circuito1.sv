// *********************************************************************************
// Project Name : CTO1
// Author       : Bruno Hernández López
// Email        : brunohlopez@hotmail.com
// Module Name  : design.sv
// Create Date  : 2022/05/04 9:04am
// CopyRight(c) : All Rights Reserved
//
// *********************************************************************************
// Modification History:
// Date             By              Version                 Change Description
// -----------------------------------------------------------------------
// XXXX       		BHL4         	 1.0                        Original
//  
// *********************************************************************************

module Circuito1(a,b,c,s);
  input a,b,c;
  output s;
  wire w1,w2,w3;
  
  Not U1 (b,w1);
  And U2 (a,w1,w2);
  And U3 (b,c,w3);
  Or U4 (w2,w3,s);

endmodule