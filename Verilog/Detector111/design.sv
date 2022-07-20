// *********************************************************************************
// Project Name : Detector111
// Author       : Bruno Hernández López
// Email        : brunohlopez@hotmail.com
// Module Name  : design.sv
// Create Date  : 2022/05/13 9:58am	
// CopyRight(c) : All Rights Reserved
//
// *********************************************************************************
// Modification History:
// Date             By              Version                 Change Description
// -----------------------------------------------------------------------
// XXXX       		BHL4         	 1.0                        Original
//  
// *********************************************************************************

module Detector(
input clk, reset,QD,
  output Salida
);
  
  wire w1,w2,DA,DB,QNC, QA,QB,QC;
  
  FFD FFA (clk,reset,DA,QA,QAN);
  FFD FFB (clk,reset,DB,QB,QBN);
  FFD FFC (clk,reset,DC,QC,QCN);
  
  
  
  And_Gate4 U1(QNA,QB,QC,QD,DA);
  And_Gate3 U2(QNA,QC,QD,DB);
  And_Gate3 U3(QNA,QNB,QD,w1);
  And_Gate3 U4(QB,QC,QD,w2);
  Or_Gate U5(w1,w2,DC);
  
  
  
  assign Salida=QA&QB&QC;
  
endmodule