// *********************************************************************************
// Project Name : Contador 3 Bits UP
// Author       : Bruno Hernández López
// Email        : brunohlopez@hotmail.com
// Module Name  : testbench.sv
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

`timescale 1ns/1ps

`include "Not_Gate.sv"
`include "And_Gate.sv"
`include "Xor_Gate.sv"
`include "FFD.sv"

module UpCounter_tb;
  reg clk, reset;
  wire [2:0] Count;
  UpCounter UUT(clk,reset,Count);
  initial
    begin
      $dumpfile("UpCpunter.vcd");
      $dumpvars(1,UpCounter_tb);
      $monitor("Count: %3d",Count);
     reset = 1'b1; clk=1'b0;
      #1
      reset=1'b0;
      #1
      #1
      #1
      #1
      #1
      #1
      #1
      #1
      #1
      #1
      #1
      #1
      #1
        $finish();
    end
  always forever #1 clk=~clk;
  
    endmodule