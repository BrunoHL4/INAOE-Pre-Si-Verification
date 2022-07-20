// *********************************************************************************
// Project Name : Codificador
// Author       : Bruno Hernández López
// Email        : brunohlopez@hotmail.com
// Module Name  : design.sv
// Create Date  : 2022/05/05 9:40am
// CopyRight(c) : All Rights Reserved
//
// *********************************************************************************
// Modification History:
// Date             By              Version                 Change Description
// -----------------------------------------------------------------------
// XXXX       		BHL4         	 1.0                        Original
//  
// *********************************************************************************

module Cod_BHL (A,B,C,a,b,c,d,e,f,g1,g2,h,i,j,k,l,m);
  input A,B,C;
  output a,b,c,d,e,f,g1,g2,h,i,j,k,l,m;

  SegmentoA U1 (A,B,C,a);
  SegmentoB U2 (A,B,C,b);
  SegmentoC U3 (A,B,C,c);
  SegmentoD U4 (A,B,C,d);
  SegmentoE U5 (A,B,C,e);
  SegmentoF U6 (A,B,C,f);
  SegmentoG1 U7 (A,B,C,g1);
  SegmentoG2 U8 (A,B,C,g2);
  SegmentoH U9 (A,B,C,h);
  SegmentoI U10 (A,B,C,i);
  SegmentoJ U11 (A,B,C,j);
  SegmentoK U12 (A,B,C,k);
  SegmentoL U13 (A,B,C,l);
  SegmentoM U14 (A,B,C,m);



endmodule