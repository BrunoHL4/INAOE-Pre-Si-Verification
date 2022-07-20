// *********************************************************************************
// Project Name : EJ2
// Author       : Bruno Hernández López
// Email        : brunohlopez@hotmail.com
// Module Name  : testbench.sv
// Create Date  : 2022/05/02 5:36pm
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

module EJ2_tb;
  wire m_p;
  reg x_p,s_p,y_p;
  
  EJ2 UUT (.x(x_p),.s(s_p),.y(y_p),.m(m_p));
           
	initial
      begin
        
        $dumpfile("EJ2.vcd");
        $dumpvars(1,EJ2_tb);

x_p=1'b0; s_p=1'b0; y_p=1'b0;
		#1
        x_p=1'b0; s_p=1'b0; y_p=1'b1;
        #1
        x_p=1'b0; s_p=1'b1; y_p=1'b0;
        #1
        x_p=1'b0; s_p=1'b1; y_p=1'b1;
        #1
        x_p=1'b1; s_p=1'b0; y_p=1'b0;
        #1
        x_p=1'b1; s_p=1'b0; y_p=1'b1;
        #1
        x_p=1'b1; s_p=1'b1; y_p=1'b0;
        #1
        x_p=1'b1; s_p=1'b1; y_p=1'b1;
      #1
      	$finish;
      
    end
		endmodule