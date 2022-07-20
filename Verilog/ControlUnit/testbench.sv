// *********************************************************************************
// Project Name : ControlUnit
// Author       : Bruno Hernández López
// Email        : brunohlopez@hotmail.com
// Module Name  : design.sv
// Create Date  : 2022/06/09 3:40pm			
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

module Control_tb();

  reg [5:0] Instruction;
  wire RegDst,Jump,BEQ,BNE,MemRead,MemToReg,MemWrite,ALUsrc,RegWrite;
  wire [1:0] ALUop;
  
  Control UUT (Instruction,RegDst,Jump,BEQ,BNE,MemRead,MemToReg,MemWrite,ALUop,ALUsrc,RegWrite);
           
	initial
      begin
        
        $dumpfile("Control.vcd");
        $dumpvars(1,Control_tb);
        

    //    $monitor("RegDst:%b Jump:%b BEQ:%b BNE:%b MemRead:%b MemToReg:%b MemWrite:%b ALUop:%b ALUsrc:%b RegWrite:%b ",RegDst,Jump,BEQ,BNE,MemRead,MemToReg,MemWrite,ALUop,ALUsrc,RegWrite);
        
       Instruction=6'b000000;
        #1;
         Instruction=6'b100011;
        #1;
         Instruction=6'b101011;
        #1;
         Instruction=6'b000100;
        #1;
         Instruction=6'b000101;
        #1;
         Instruction=6'b000010;
        #1;
         Instruction=6'b111111;
        #1;
         Instruction=6'b101011;
        #1;
         Instruction=6'b000000;
      
    end
		endmodule