// *********************************************************************************
// Project Name : DataTransfer2
// Author       : Bruno Hernández López
// Email        : brunohlopez@hotmail.com
// Module Name  : design.sv
// Create Date  : 2022/05/18 11:07pm			
// CopyRight(c) : All Rights Reserved
//
// *********************************************************************************
// Modification History:
// Date             By              Version                 Change Description
// -----------------------------------------------------------------------
// XXXX       		BHL4         	 1.0                        Original
//  
// *********************************************************************************

module DataTransfer(
  
  input clk,rst,
  
  
  input WriteEnable,
  input reg [4:0] WriteAddr,
  input reg[7:0] WriteData,
  input reg[4:0] ReadAddr1,ReadAddr2,
  output reg [7:0] Data1,Data2,
  
  input LD_A,LD_B,LD_C,
 /* input reg [3:0] RA,RB,RC,
  output reg [3:0] QRA,QRB,QRC,*/
  
  input OEA,OEB,OEC,
  
  output reg [7:0] ABus,
  
/*  input reg [3:0] RA,
  input SelA,SelB,SelC*/
  
  input [1:0] SelMux,
  input [2:0] opcode,
  
  input enableALU
  
);
  
  
  wire [7:0] OutputData1, OutputData2;
  wire [7:0] ABusOUT;
  wire [3:0] QA,QB,QC;
  wire [3:0] TriA_Out,TriB_Out,TriC_Out;
  
  
  
  file_Reg R1 (clk,rst,WriteEnable,WriteAddr,WriteData,ReadAddr1,OutputData1,ReadAddr2,OutputData2);
  
	assign Data1=OutputData1;
	assign Data2=OutputData2;
    assign ABus=ABusOUT;
  
  REG U1 (clk,rst,LD_A,OutputData1,QA);
  tristate U2 (OEA,QA,TriA_Out);
  
  
  REG U3 (clk,rst,LD_B,OutputData2,QB);
  tristate U4 (OEB,QB,TriB_Out);
  
  
  REGC U5 (clk,rst,LD_C,ABusOUT,QC);
  tristateC U6 (OEC,QC,TriC_Out);
  
  
  mux U7(TriA_Out,TriB_Out,TriC_Out,1'bZ,SelMux,ABusOut);
  
  ALU U8(ABusOut,TriA_Out,TriB_Out,opcode,enableALU);
    
  
         