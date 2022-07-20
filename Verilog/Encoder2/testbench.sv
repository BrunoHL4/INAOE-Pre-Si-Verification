// *********************************************************************************
// Project Name : Encoder2
// Author       : Bruno Hernández López
// Email        : brunohlopez@hotmail.com
// Module Name  : testbench.sv
// Create Date  : 2022/05/06 11:15am
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
`include "SegmentoV.sv"



module Enc_2_tb;
  reg D0_p,D1_p,D2_p,D3_p;
  wire x_p,y_p,V_p;
  
  Enc_2 UUT (.D0(D0_p),.D1(D1_p),.D2(D2_p),.D3(D3_p),.x(x_p),.y(y_p),.V(V_p));
           
	initial
      begin
        
        $dumpfile("Enc_2.vcd");
        $dumpvars(1,Enc_2_tb);
        
        $monitor("Entrada: %b %b %b %b  Salida: %b %b %b", D3_p,D2_p,D1_p,D0_p, x_p,y_p,V_p);
        
        
        D0_p=1'b0; D1_p=1'b0;D2_p=1'b0;D3_p=1'b0;        
		#1
        D0_p=1'b0; D1_p=1'b0;D2_p=1'b0;D3_p=1'b1;
        #1
        D0_p=1'b0; D1_p=1'b0;D2_p=1'b1;D3_p=1'b0;
        #1
        D0_p=1'b0; D1_p=1'b0;D2_p=1'b1;D3_p=1'b1;
        #1
        D0_p=1'b0; D1_p=1'b1;D2_p=1'b0;D3_p=1'b0;
        #1
        D0_p=1'b0; D1_p=1'b1;D2_p=1'b0;D3_p=1'b1;
        #1
        D0_p=1'b0; D1_p=1'b1;D2_p=1'b1;D3_p=1'b0;
        #1
        D0_p=1'b0; D1_p=1'b1;D2_p=1'b1;D3_p=1'b1;        
        #1
        D0_p=1'b1; D1_p=1'b0;D2_p=1'b0;D3_p=1'b0;        
		#1
        D0_p=1'b1; D1_p=1'b0;D2_p=1'b0;D3_p=1'b1;
        #1
        D0_p=1'b1; D1_p=1'b0;D2_p=1'b1;D3_p=1'b0;
        #1
        D0_p=1'b1; D1_p=1'b0;D2_p=1'b1;D3_p=1'b1;
        #1
        D0_p=1'b1; D1_p=1'b1;D2_p=1'b0;D3_p=1'b0;
        #1
        D0_p=1'b1; D1_p=1'b1;D2_p=1'b0;D3_p=1'b1;
        #1
        D0_p=1'b1; D1_p=1'b1;D2_p=1'b1;D3_p=1'b0;
        #1
        D0_p=1'b1; D1_p=1'b1;D2_p=1'b1;D3_p=1'b1;

      #1
      	$finish;
      
    end
		endmodule