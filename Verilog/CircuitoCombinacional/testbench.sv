// *********************************************************************************
// Project Name : COMB_M
// Author       : Bruno Hernández López
// Email        : brunohlopez@hotmail.com
// Module Name  : testbench.sv
// Create Date  : 2022/05/02 12:24pm
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

module COMB_M_tb;
  reg a,b,c;
  wire m;
  
  COMB_M UUT(.a(a), .b(b), .c(c), .m (m));
  
  initial 
  	begin
      $dumpfile("COMB_M.vcd");
      $dumpvars(1,COMB_M_tb);
      
      a= 1'b0; b= 1'b0; c= 1'b0; 
	  #1 
      a= 1'b0; b= 1'b0; c= 1'b1;
      #1 
      a= 1'b0; b= 1'b1; c= 1'b0;
      #1 
      a= 1'b0; b= 1'b1; c= 1'b1;
      #1 
      a= 1'b1; b= 1'b0; c= 1'b0;
      #1 
      a= 1'b1; b= 1'b0; c= 1'b1;
      #1 
      a= 1'b1; b= 1'b1; c= 1'b0;
      #1 
      a= 1'b1; b= 1'b1; c= 1'b1;
      #1
      	$finish;
      
    end
		endmodule
