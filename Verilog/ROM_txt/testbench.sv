// *********************************************************************************
// Project Name : ROM_TXT
// Author       : Bruno Hernández López
// Email        : brunohlopez@hotmail.com
// Module Name  : testbench.sv
// Create Date  : 2022/06/01 12:38pm			
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

module ROM_BHL_tb;
  
  integer i;
  reg [2:0] addr_tb;
  wire[13:0] dout_tb;
  
  ROM_BHL UUT (addr_tb,dout_tb);
  
  initial
    begin
      $dumpfile("ROM_BHL.vcd");
      $dumpvars(1,ROM_BHL_tb);
      for (i=0; i<8; i=i+1)
        begin
          addr_tb=i;
          #1
          $display("add: %3b %b %b %b %b %b %b %b %b %b %b %b %b %b %b",addr_tb,dout_tb[13],dout_tb[12],dout_tb[11],dout_tb[10],dout_tb[9],dout_tb[8],dout_tb[7],dout_tb[6],dout_tb[5],dout_tb[4],dout_tb[3],dout_tb[2],dout_tb[1],dout_tb[0]);
        end
    end
endmodule