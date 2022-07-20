// *********************************************************************************
// Project Name : AndGate
// Author       : Bruno Hernández López
// Email        : brunohlopez@hotmail.com
// Module Name  : testbench.sv
// Create Date  : 2022/05/02 11:19am
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

module ANDgate_tb;
  reg IN_a, IN_b;
  wire OUT_x;
  
  ANDgate UUT(.IN_a(IN_a), .IN_b(IN_b), .OUT_x(OUT_x));
  
  initial 
  	begin
      $dumpfile("ANDgate.vcd");
      $dumpvars(1,ANDgate_tb);
      
      IN_a= 1'b0; IN_b= 1'b0;
      #1
      IN_a= 1'b0; IN_b= 1'b1;
      #1
      IN_a= 1'b1; IN_b= 1'b0;
      #1
      IN_a= 1'b1; IN_b= 1'b1;
      #1
      	$finish;
      
    end
		endmodule