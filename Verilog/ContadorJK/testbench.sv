// *********************************************************************************
// Project Name : ContadorJK
// Author       : Bruno Hernández López
// Email        : brunohlopez@hotmail.com
// Module Name  : testbench.sv
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

`timescale 1ns/1ps

`include "And_Gate2.sv"
`include "And_Gate3.sv"
`include "And_Gate4.sv"
`include "Or_Gate"
`include "FFJK.sv"

module JKCounter_tb;
  reg clk, reset;
  wire [3:0] Count;
  JKCounter UUT(.clk(clk),.reset(reset),.Count(Count));
  initial
    begin
      $dumpfile("UpCpunter.vcd");
      $dumpvars(1,JKCounter_tb);
      $monitor("Count: %4b",Count);
     reset = 1'b1; clk=1'b0;
      #1
      reset=1'b0;
      #16
      $finish();
    end
  always forever #1 clk=~clk;
    endmodule



