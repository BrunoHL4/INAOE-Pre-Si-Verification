// *********************************************************************************
// Project Name : EJ2
// Author       : Bruno Hernández López
// Email        : brunohlopez@hotmail.com
// Module Name  : design.sv
// Create Date  : 2022/05/02 5:36pm
// CopyRight(c) : All Rights Reserved
//
// *********************************************************************************
// Modification History:
// Date             By              Version                 Change Description
// -----------------------------------------------------------------------
// XXXX       		BHL4          1.0                        Original
//  
// *********************************************************************************

module EJ2(x,s,y,m);
  input x,s,y;
  output m;
  wire w1,w2,w3;
  
  Not U1 (s,w1);
  And U2 (x,w1,w2);
  And U3 (s,y,w3);
  Or U4 (w2,w3,m);

endmodule