// *********************************************************************************
// Project Name : Contador 3 Bits UP
// Author       : Bruno Hernández López
// Email        : brunohlopez@hotmail.com
// Module Name  : design.sv
// Create Date  : 2022/05/11 11:05am
// CopyRight(c) : All Rights Reserved
//
// *********************************************************************************
// Modification History:
// Date             By              Version                 Change Description
// -----------------------------------------------------------------------
// XXXX       		BHL4         	 1.0                        Original
//  
// *********************************************************************************

module UpCounter(
input clk, reset,
  output [2:0] Count
);
  
  wire w1,DA,DB,QNC, QA,QB,QC;
  
  FFD FFA (clk,reset,DA,QA);
  FFD FFB (clk,reset,DB,QB);
  FFD FFC (clk,reset,QNC,QC);
  
  And_Gate U1(QB,QC,w1);
  Xor_Gate U2(QA,w1,DA);
  Xor_Gate U3(QB,QC,DB);
  
  Not_Gate U4(QC,QNC);
  
  assign Count={QA,QB,QC};
  
endmodule
  