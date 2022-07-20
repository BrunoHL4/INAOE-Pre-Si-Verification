// *********************************************************************************
// Project Name : Decodificador BCD
// Author       : Bruno Hernández López
// Email        : brunohlopez@hotmail.com
// Module Name  : design.sv
// Create Date  : 2022/05/04 11:11am
// CopyRight(c) : All Rights Reserved
//
// *********************************************************************************
// Modification History:
// Date             By              Version                 Change Description
// -----------------------------------------------------------------------
// XXXX       		BHL4         	 1.0                        Original
//  
// *********************************************************************************

module BCD (A,B,C,D,a,b,c,d,e,f,g);
  input A,B,C,D;
  output a,b,c,d,e,f,g;

  SegmentoA U1 (A,B,C,D,a);
  SegmentoB U2 (A,B,C,D,b);
  SegmentoC U3 (A,B,C,D,c);
  SegmentoD U4 (A,B,C,D,d);
  SegmentoE U5 (A,B,C,D,e);
  SegmentoF U6 (A,B,C,D,f);
  SegmentoG U7 (A,B,C,D,g);



endmodule