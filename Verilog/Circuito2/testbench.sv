// *********************************************************************************
// Project Name : CTO2
// Author       : Bruno Hernández López
// Email        : brunohlopez@hotmail.com
// Module Name  : testbench.sv
// Create Date  : 2022/05/03 12:12pm	
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

`include "Not.sv"
`include "And.sv"
`include "Or.sv"

module CTO2_tb;
  wire s_p;
  reg a_p,b_p,c_p;
  
  CTO2 UUT (.a(a_p),.b(b_p),.c(c_p),.s(s_p));
           
	initial
      begin
        
        $dumpfile("CTO2.vcd");
        $dumpvars(1,CTO2_tb);

		a_p=1'b0; b_p=1'b0; c_p=1'b0;
		#1
        a_p=1'b0; b_p=1'b0; c_p=1'b1;
        #1
        a_p=1'b0; b_p=1'b1; c_p=1'b0;
        #1
        a_p=1'b0; b_p=1'b1; c_p=1'b1;
        #1
        a_p=1'b1; b_p=1'b0; c_p=1'b0;
        #1
        a_p=1'b1; b_p=1'b0; c_p=1'b1;
        #1
        a_p=1'b1; b_p=1'b1; c_p=1'b0;
        #1
        a_p=1'b1; b_p=1'b1; c_p=1'b1;
      #1
        $finish();
      
    end
		endmodule