// *********************************************************************************
// Project Name : Detector111
// Author       : Bruno Hernández López
// Email        : brunohlopez@hotmail.com
// Module Name  : testbench.sv
// Create Date  : 2022/05/13 9:58am	
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

`include "And_Gate3.sv"
`include "And_Gate4.sv"
`include "Or_Gate.sv"
`include "FFD.sv"

module Detector_tb;
  reg clk, reset;
  wire Salida;
  reg QD;
  Detector UUT(.clk(clk),.reset(reset),.Salida(Salida),.QD(QD));
  initial
    begin
      $dumpfile("<Detector.vcd");
      $dumpvars(1,Detector_tb);
      $monitor("Salida: %d",Salida);
     reset = 1'b1; clk=1'b0;
      #1
      reset=1'b0;
      		QD=1;
      	#1
        QD=0;
      	#1
        QD=1;
      	#1
        
        QD=1;
      	#1
        QD=1;
      	#1
        QD=1;
      	#1
      	$finish;
    end
  always forever #1 clk=~clk;
    endmodule
               
               