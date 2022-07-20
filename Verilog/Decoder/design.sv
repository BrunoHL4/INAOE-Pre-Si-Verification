// *********************************************************************************
// Project Name : Decoder
// Author       : Bruno Hernández López
// Email        : brunohlopez@hotmail.com
// Module Name  : design.sv
// Create Date  : 2022/05/04 9:26am
// CopyRight(c) : All Rights Reserved
//
// *********************************************************************************
// Modification History:
// Date             By              Version                 Change Description
// -----------------------------------------------------------------------
// XXXX       		BHL4         	 1.0                        Original
//  
// *********************************************************************************

module decoder1(x,y,z,d0,d1,d2,d3,d4,d5,d6,d7);
  
  input x,y,z;
  output d0,d1,d2,d3,d4,d5,d6,d7;
  wire w1,w2,w3;
  
  Not U1 (x,w1);
  Not U2 (y,w2);
  Not U3 (z,w3);
  And U4 (w1,w2,w3,d0);
  And U5 (z,w2,w3,d1);
  And U6 (w1,y,w3,d2);
  And U7 (z,y,w3,d3);
  And U8 (w1,w2,x,d4);
  And U9 (z,w2,x,d5);
  And U10 (w1,y,x,d6);
  And U11 (z,y,x,d7);  
  
endmodule