// *********************************************************************************
// Project Name : Lab2
// Author       : Bruno Hernández López
// Email        : brunohlopez@hotmail.com
// Module Name  : testbench.sv
// Create Date  : 2022/05/03 10:32am	
// CopyRight(c) : All Rights Reserved
//
// *********************************************************************************
// Modification History:
// Date             By              Version                 Change Description
// -----------------------------------------------------------------------
// XXXX       		BHL4          1.0                        Original
//  
// *********************************************************************************

`timescale 1ns/1ps

module Lab2_tb();
  
  
  reg [3:0] din_tb;
  wire [1:0] dout_tb;
  integer i;
  
  
  Lab2 UUT(din_tb, dout_tb);
  
  initial 
  	begin
      
      for (i=0;i<16;i=i+1)
        begin
          din_tb=i;
          #1;
        end
      $finish();
    end
  
  
  initial begin
      
    $dumpvars(1,Lab2_tb);  
    $dumpfile("Lab2_tb.vcd");
    
      
    end
		endmodule