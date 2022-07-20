// *********************************************************************************
// Project Name : Encoder2
// Author       : Bruno Hernández López
// Email        : brunohlopez@hotmail.com
// Module Name  : design.sv
// Create Date  : 2022/05/06 11:15am
// CopyRight(c) : All Rights Reserved
//
// *********************************************************************************
// Modification History:
// Date             By              Version                 Change Description
// -----------------------------------------------------------------------
// XXXX       		BHL4         	 1.0                        Original
//  
// *********************************************************************************

module Enc_2 (D0,D1,D2,D3,x,y,V);
  input D0,D1,D2,D3;
  output x,y,V;

  SegmentoX U1 (D0,D1,D2,D3,x);
  SegmentoY U2 (D0,D1,D2,D3,y);
  SegmentoV U3 (D0,D1,D2,D3,V);




endmodule