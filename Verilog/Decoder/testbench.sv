// *********************************************************************************
// Project Name : Decoder
// Author       : Bruno Hernández López
// Email        : brunohlopez@hotmail.com
// Module Name  : testbench.sv
// Create Date  : 2022/05/04 9:26am
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

`include "Not.sv"
`include "And.sv"

module decoder1_tb;
  wire s_p;
  reg x_p,y_p,z_p;
  
  decoder UUT (.x(x_p),.y(y_p),.z(z_p),.d0(d0_p),.d1(d1_p),.d2(d2_p),.d3(d3_p),.d4(d4_p),.d5(d5_p),.d6(d6_p),.d7(d7_p));
           
	initial
      begin
        
        $dumpfile("decoder1.vcd");
        $dumpvars(1,decoder1_tb);

		x_p=1'b0; y_p=1'b0; z_p=1'b0;
		#1
        x_p=1'b0; y_p=1'b0; z_p=1'b1;
        #1
        x_p=1'b0; y_p=1'b1; z_p=1'b0;
        #1
        x_p=1'b0; y_p=1'b1; z_p=1'b1;
        #1
        x_p=1'b1; y_p=1'b0; z_p=1'b0;
        #1
        x_p=1'b1; y_p=1'b0; z_p=1'b1;
        #1
        x_p=1'b1; y_p=1'b1; z_p=1'b0;
        #1
        x_p=1'b1; y_p=1'b1; z_p=1'b1;
      #1
      	$finish;
      
    end
		endmodule