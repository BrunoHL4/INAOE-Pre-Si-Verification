// *********************************************************************************
// Project Name : FileRegister
// Author       : Bruno Hernández López
// Email        : brunohlopez@hotmail.com
// Module Name  : testbench.sv
// Create Date  : 2022/05/19 12:21am			
// CopyRight(c) : All Rights Reserved
//
// *********************************************************************************
// Modification History:
// Date             By              Version                 Change Description
// -----------------------------------------------------------------------
// XXXX       		BHL4         	 1.0                        Original
//  
// *********************************************************************************

`timescale 1ns/1ps

`include "file_Reg.sv"

module BHL_tb;
  
  reg clk,rst;
  reg WriteEnable;
  reg [4:0] WriteAddr;
  reg [7:0] WriteData;
  reg [4:0] ReadAddr1,ReadAddr2;
  
  wire [7:0] Data1,Data2;
  
  BHL UUT (.clk(clk),.rst(rst),.WriteEnable(WriteEnable),.WriteAddr(WriteAddr),.WriteData(WriteData),.ReadAddr1(ReadAddr1),.ReadAddr2(ReadAddr2),.Data1(Data1),.Data2(Data2));
  
  initial
    begin
      
      $dumpfile("BHL.vcd");
  	  $dumpvars(1,BHL_tb);
      
      $monitor("CLK:%b RST:%d WE:%d WR_A:%8b WR_D:%8b RA1:%5b RA2:%5b Data1:%8b Data2:%8b", clk,rst,WriteEnable,WriteAddr,WriteData,ReadAddr1,ReadAddr2,Data1,Data2);
      
      clk=0; rst=0;
      
      #1 
      rst=1;
      
      #1
      
      WriteEnable=0; WriteAddr=5'b00000; WriteData=8'b00000111;
      
      #1
      WriteEnable=1;
      
      #1
      WriteEnable=0;
      
      #1
      WriteEnable=0;ReadAddr1=5'b00000;
      
      #1
      WriteEnable=0;
      #1
      
      
      #1
      
      WriteEnable=0; WriteAddr=5'b00001; WriteData=8'b00001001;
      
      #1
      WriteEnable=1;
      
      #1
      WriteEnable=0;
      
      #1
      WriteEnable=0;ReadAddr2=5'b00001;
      
      #1
      WriteEnable=0;
      #1
      
      
      
 /*     #1
      WriteEnable=0; WriteAddr=5'b00000; WriteData=8'b00000000; ReadAddr1=5'b00000; ReadAddr2=5'b00001;
      
      #1
      WriteEnable=0; WriteAddr=5'b00000; WriteData=8'b00000111; ReadAddr1=5'b00000; ReadAddr2=5'b00001;
      
      #1
      WriteEnable=1; WriteAddr=5'b00000; WriteData=8'b00000111; ReadAddr1=5'b00000; ReadAddr2=5'b00001;
      
      #1
      WriteEnable=0; WriteAddr=5'b00000; WriteData=8'b00000111; ReadAddr1=5'b00000; ReadAddr2=5'b00001;
      
      #1
      WriteEnable=0; WriteAddr=5'b00000; WriteData=8'b00000111; ReadAddr1=5'b00000; ReadAddr2=5'b00001;*/
      
      $finish();
      
      
    end
  
   always forever #1 clk=~clk;
  
endmodule