// *********************************************************************************
// Project Name : Encoder
// Author       : Bruno Hernández López
// Email        : brunohlopez@hotmail.com
// Module Name  : testbench.sv
// Create Date  : 2022/05/06 9:21am
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


`include "SegmentoX.sv"
`include "SegmentoY.sv"
`include "SegmentoZ.sv"



module Enc_BHL_tb;
  reg D0_p,D1_p,D2_p,D3_p,D4_p,D5_p,D6_p,D7_p;
  wire x_p,y_p,z_p;
  
  Enc_BHL UUT (.D0(D0_p),.D1(D1_p),.D2(D2_p),.D3(D3_p),.D4(D4_p),.D5(D5_p),.D6(D6_p),.D7(D7_p),.x(x_p),.y(y_p),.z(z_p));
           
	initial
      begin
        
        $dumpfile("Enc_BHL.vcd");
        $dumpvars(1,Enc_BHL_tb);
        
        $monitor("Entrada: %b %b %b %b %b %b %b %b  Salida: %b %b %b", D0_p,D1_p,D2_p,D3_p,D4_p,D5_p,D6_p,D7_p, x_p,y_p,z_p);
        
        
        D0_p=1'b1; D1_p=1'b0;D2_p=1'b0;D3_p=1'b0;D4_p=1'b0;D5_p=1'b0;D6_p=1'b0;D7_p=1'b0;        
		#1
        D0_p=1'b0; D1_p=1'b1;D2_p=1'b0;D3_p=1'b0;D4_p=1'b0;D5_p=1'b0;D6_p=1'b0;D7_p=1'b0;
        #1
        D0_p=1'b0; D1_p=1'b0;D2_p=1'b1;D3_p=1'b0;D4_p=1'b0;D5_p=1'b0;D6_p=1'b0;D7_p=1'b0;
        #1
        D0_p=1'b0; D1_p=1'b0;D2_p=1'b0;D3_p=1'b1;D4_p=1'b0;D5_p=1'b0;D6_p=1'b0;D7_p=1'b0;
        #1
        D0_p=1'b0; D1_p=1'b0;D2_p=1'b0;D3_p=1'b0;D4_p=1'b1;D5_p=1'b0;D6_p=1'b0;D7_p=1'b0;
        #1
        D0_p=1'b0; D1_p=1'b0;D2_p=1'b0;D3_p=1'b0;D4_p=1'b0;D5_p=1'b1;D6_p=1'b0;D7_p=1'b0;
        #1
        D0_p=1'b0; D1_p=1'b0;D2_p=1'b0;D3_p=1'b0;D4_p=1'b0;D5_p=1'b0;D6_p=1'b1;D7_p=1'b0;
        #1
        D0_p=1'b0; D1_p=1'b0;D2_p=1'b0;D3_p=1'b0;D4_p=1'b0;D5_p=1'b0;D6_p=1'b0;D7_p=1'b1;
        

      #1
      	$finish;
      
    end
		endmodule