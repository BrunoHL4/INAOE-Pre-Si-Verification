// *********************************************************************************
// Project Name : Tristate
// Author       : Bruno Hernández López
// Email        : brunohlopez@hotmail.com
// Module Name  : testbenchc.sv
// Create Date  : 2022/07/19 7:33pm		
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

`include "tristate.sv"

module BHL_tb;
  
reg OEA;
  reg [7:0] ABus;
  reg [3:0]QA;


  BHL UUT (.OEA(OEA),.ABus(ABus),.QA(QA));

initial begin
  $dumpfile("BHL.vcd");
  $dumpvars(1,BHL_tb);
  
  OEA=1; QA=4'b0000;  
  #1
  OEA=1; QA=4'b0000;
  $display("OEA:%b QA:%4b ABus:%8b",OEA,QA,ABus);
  #1
  OEA=1; QA=4'b1000;
  $display("OEA:%b QA:%4b ABus:%8b",OEA,QA,ABus);
  #1
  OEA=0; QA=4'b1000;
  $display("OEA:%b QA:%4b ABus:%8b",OEA,QA,ABus);
  #1
  OEA=0; QA=4'b1000;
  $display("OEA:%b QA:%4b ABus:%8b",OEA,QA,ABus);
  #1
  OEA=0; QA=4'b1000;
  $display("OEA:%b QA:%4b ABus:%8b",OEA,QA,ABus);
  #1
  OEA=1; QA=4'b1000;
  $display("OEA:%b QA:%4b ABus:%8b",OEA,QA,ABus);
  #1
  OEA=1; QA=4'b1000;
  $display("OEA:%b QA:%4b ABus:%8b",OEA,QA,ABus);
  #1
  $finish();
  
  
end
  
  
//  always forever #1 clk=~clk;
  
endmodule