// *********************************************************************************
// Project Name : RegistersWithEnable
// Author       : Bruno Hernández López
// Email        : brunohlopez@hotmail.com
// Module Name  : design.sv
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

`include "REG.sv"

module BHL_tb;
  
reg clk,rst;
//reg SelA;
//  reg [7:0] ABus;
  reg LD_A;
  reg [3:0]RA,QA;


  BHL UUT (.clk(clk),.rst(rst),.LD_A(LD_A),.QA(QA),.RA(RA));

initial begin
  $dumpfile("BHL.vcd");
  $dumpvars(1,BHL_tb);
  
  rst=0; clk=0; RA=4'b0000; LD_A=0;
  #1
  rst=1;
  
  #1
  rst=0; RA=4'b0010; LD_A=0;
  $display("CLK:%b RA:%4b LD_A:%b QA:%4b",clk,RA,LD_A,QA);
  #1
  RA=4'b0010;LD_A=1;
  $display("CLK:%b RA:%4b LD_A:%b QA:%4b",clk,RA,LD_A,QA);
  #1
  RA=4'b0010;LD_A=1;
  $display("CLK:%b RA:%4b LD_A:%b QA:%4b",clk,RA,LD_A,QA);
  #1
  RA=4'b1111;LD_A=1;
  $display("CLK:%b RA:%4b LD_A:%b QA:%4b",clk,RA,LD_A,QA);
  #1
  RA=4'b1111;LD_A=1;
  $display("CLK:%b RA:%4b LD_A:%b QA:%4b",clk,RA,LD_A,QA);
  
  #1
  RA=4'b0101;LD_A=0;
  $display("CLK:%b RA:%4b LD_A:%b QA:%4b",clk,RA,LD_A,QA);
  #1
  RA=4'b0101;LD_A=0;
  $display("CLK:%b RA:%4b LD_A:%b QA:%4b",clk,RA,LD_A,QA);
  #1
  RA=4'b0101;LD_A=1;
  $display("CLK:%b RA:%4b LD_A:%b QA:%4b",clk,RA,LD_A,QA);
  #1
  RA=4'b0101;LD_A=1;
  $display("CLK:%b RA:%4b LD_A:%b QA:%4b",clk,RA,LD_A,QA);
 #1
  $finish();
  
end
  
  
  always forever #1 clk=~clk;
  

  
    endmodule