// *********************************************************************************
// Project Name : DataTransfer2
// Author       : Bruno Hernández López
// Email        : brunohlopez@hotmail.com
// Module Name  : testbench.sv
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

`timescale 1ns/1ps

`include "file_Reg.sv"
`include "REG.sv"
`include "tristate.sv"
`include "tristateC.sv"
`include "REGC.sv"
`include "mux.sv"
`include "ALU.sv"

module DataTransfer_tb;
  
  reg clk,rst;
  reg WriteEnable;
  reg [4:0] WriteAddr;
  reg [7:0] WriteData;
  reg [4:0] ReadAddr1,ReadAddr2; 
  wire [7:0] Data1,Data2;
  
  reg LD_A,LD_B,LD_C;
  reg OEA,OEB,OEC;
  
  reg [7:0] ABus;
  
  reg [1:0] SelMux
  reg [2:0] opcode
  
  reg enableALU
  
  DataTransfer UUT (.clk(clk),.rst(rst),.WriteEnable(WriteEnable),.WriteAddr(WriteAddr),.WriteData(WriteData),.ReadAddr1(ReadAddr1),.ReadAddr2(ReadAddr2),.Data1(Data1),.Data2(Data2),.LD_A(LD_A),.LD_B(LD_B),.LD_C(LD_C),.OEA(OEA),.OEB(OEB),.OEC(OEC),.ABus(ABus),.SelMux(SelMux),.opcode(opcode),.enableALU(enableALU));
  
  initial
    begin
      
      $dumpfile("DataTransfer.vcd");
      $dumpvars(1,DataTransfer_tb);
      
      $monitor("CLK:%b RST:%d WE:%d WR_A:%8b WR_D:%8b RA1:%5b RA2:%5b Data1:%8b Data2:%8b", clk,rst,WriteEnable,WriteAddr,WriteData,ReadAddr1,ReadAddr2,Data1,Data2);
      
      clk=0; rst=0; OEA=1;OEB=1;OEC=1;
      
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
      
      LD_A=1;LD_B=1;
      #1
      OEA=0;OEAB=0;
      #1
      enableALU=1;
      #1
      opcode=3'b001 //SUMA
      #1
      opcode=3'b010 //Resta
      #1
      opcode=3'b011 //Multiplicación
      #1
      LD_C=1;
      #1
      OEC=0;
      #1
      Sel_Mux=2'b00//Valor de Registro A hacia ABus
      
       $finish();
      
      
    end
  
   always forever #1 clk=~clk;
  
endmodule