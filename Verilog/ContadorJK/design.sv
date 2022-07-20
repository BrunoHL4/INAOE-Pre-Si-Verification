// *********************************************************************************
// Project Name : ContadorJK
// Author       : Bruno Hernández López
// Email        : brunohlopez@hotmail.com
// Module Name  : design.sv
// Create Date  : 2022/05/13 6:13pm		
// CopyRight(c) : All Rights Reserved
//
// *********************************************************************************
// Modification History:
// Date             By              Version                 Change Description
// -----------------------------------------------------------------------
// XXXX       		BHL4         	 1.0                        Original
//  
// *********************************************************************************

module JKCounter(
input clk, reset,
  output [3:0] Count
);
  
  wire JA,KA,JB,KB,JC,KC,JD,KD,w1,w2,QA,QAN,QB,QBN,QC,QCN,QD,QDN;
  
  FFJK FFA (clk,reset,JA,KA,QA,QAN);
  FFJK FFB (clk,reset,JB,KB,QB,QBN);
  FFJK FFC (clk,reset,JC,KC,QC,QCN);
  FFJK FFD (clk,reset,JD,KD,QD,QDN);
  
 
  And_Gate4 U1(QAN,QB,QC,QD,JA);
  And_Gate3 U2(QB,QCN,QD,KA);
  And_Gate3 U3(QBN,QC,QD,JB);
  And_Gate3 U4(QAN,QC,QD,w1);
  And_Gate4 U5(QA,QB,QCN,QD,w2);
  Or_Gate U6(w1,w2,KB);
  And_Gate2 U7(QAN,QD,JC);
  And_Gate3 U8(QBN,QC,QD,KC);
  And_Gate3 U9(QAN,QBN,QCN,JD);
  And_Gate4 U10(QA,QB,QCN,QD,KD);
  
  
  assign Count={QA,QB,QC,QD};
  
endmodule