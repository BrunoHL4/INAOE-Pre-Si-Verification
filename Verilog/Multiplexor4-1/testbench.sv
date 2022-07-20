// *********************************************************************************
// Project Name : MUXmulti
// Author       : Bruno Hernández López
// Email        : brunohlopez@hotmail.com
// Module Name  : testbench.sv
// Create Date  : 	2022/05/03 3:42pm
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

module MUXmulti_tb();
  
  
  reg a_tb,b_tb,c_tb,d_tb,x_tb,y_tb;
  wire f_tb;
  integer i;
  
  
  Lab2 UUT(din_tb, dout_tb);
  
  initial 
  	begin
      
      for (i=0;i<16;i=i+1)
        begin
          a_tb=i;
          #1
        end
      $finish();
    end
  
  
  initial begin
      
    $dumpvars(1,MUXmulti_tb);  
    $dumpfile("MUXmulti_tb.vcd");
    
      
    end
		endmodule