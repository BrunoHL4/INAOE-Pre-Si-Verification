// *********************************************************************************
// Project Name : Encoder
// Author       : Bruno Hernández López
// Email        : brunohlopez@hotmail.com
// Module Name  : design.sv
// Create Date  : 2022/05/06 9:21am
// CopyRight(c) : All Rights Reserved
//
// *********************************************************************************
// Modification History:
// Date             By              Version                 Change Description
// -----------------------------------------------------------------------
// XXXX       		BHL4         	 1.0                        Original
//  
// *********************************************************************************

module Enc_BHL (D0,D1,D2,D3,D4,D5,D6,D7,x,y,z);
  input D0,D1,D2,D3,D4,D5,D6,D7;
  output x,y,z;

  SegmentoX U1 (D0,D1,D2,D3,D4,D5,D6,D7,x);
  SegmentoY U2 (D0,D1,D2,D3,D4,D5,D6,D7,y);
  SegmentoZ U3 (D0,D1,D2,D3,D4,D5,D6,D7,z);




endmodule