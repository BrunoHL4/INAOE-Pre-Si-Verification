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

module Control(
  
  input [5:0] Instruction,
  output reg RegDst,
  output reg Jump,
  output reg BEQ, 
  output reg BNE,
  output reg MemRead, 
  output reg MemToReg,
  output reg MemWrite,
  output reg [1:0] ALUop,
  output reg ALUsrc,
  output reg RegWrite  
  
);
  
  always @(Instruction)
    if (Instruction==6'b000000)//R Type Instruction
    begin
      $display("R Type Instruction ");
      RegDst=1;
      Jump=0;
      BEQ=0;
      BNE=0;
      MemRead=0;
      MemToReg=0;
      MemWrite=0;
      ALUop=2'b10;
      ALUsrc=0;
      RegWrite=1;
      
    end
  
  else if (Instruction==6'b100011)//LW Instruction
    begin
      $display("LW Instruction ");
      RegDst=0;
      Jump=0;
      BEQ=0;
      BNE=0;
      MemRead=1;
      MemToReg=1;
      MemWrite=0;
      ALUop=2'b00;
      ALUsrc=1;
      RegWrite=1;
      
    end
  
  else if (Instruction==6'b101011)//SW Instruction
    begin
      $display("SW Instruction ");
      Jump=0;
      BEQ=0;
      BNE=0;
      MemRead=0;
      MemWrite=1;
      ALUop=2'b00;
      ALUsrc=1;
      RegWrite=0;
      
    end
  
  else if (Instruction==6'b000100)//BEQ Instruction
    begin
      $display("BEQ Instruction ");
      Jump=0;
      BEQ=1;
      BNE=0;
      MemRead=0;
      MemWrite=0;
      ALUop=2'b01;
      ALUsrc=0;
      RegWrite=0;
      
    end
  
  else if (Instruction==6'b000101)//BNE Instruction
    begin
      $display("BNE Instruction ");
      Jump=0;
      BEQ=0;
      BNE=1;
      MemWrite=0;
      ALUop=2'b01;
      ALUsrc=0;
      RegWrite=0;
      
    end
  
  else if (Instruction==6'b000010)//Jump Instruction
    begin
      $display("Jump Instruction ");
      Jump=1;
      BEQ=0;
      BNE=0;
      MemWrite=0;
      RegWrite=0;
      
    end
  
  
  else 
    begin
    $display("Opcode Incorrecto ");
  	  RegDst=0;
      Jump=0;
      BEQ=0;
      BNE=0;
      MemRead=0;
      MemToReg=0;
      MemWrite=0;
      ALUop=2'b00;
      ALUsrc=0;
      RegWrite=0;
    end
  
endmodule