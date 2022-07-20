// *********************************************************************************
// Project Name : Decodificador BCD
// Author       : Bruno Hernández López
// Email        : brunohlopez@hotmail.com
// Module Name  : testbench.sv
// Create Date  : 2022/05/04 11:11am
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
`include "Or.sv"

`include "SegmentoA.sv"
`include "SegmentoB.sv"
`include "SegmentoC.sv"
`include "SegmentoD.sv"
`include "SegmentoE.sv"
`include "SegmentoF.sv
`include "SegmentoG.sv"



module BCD_tb;
  wire a_p,b_p,c_p,d_p,e_p,f_p,g_p;
  reg A_p,B_p,C_p,D_p;
  
  BCD UUT (.A(A_p),.B(B_p),.C(C_p),.D(D_p),.a(a_p),.b(b_p),.c(c_p),.d(d_p),.e(e_p),.f(f_p),.g(g_p));
           
	initial
      begin
        
        $dumpfile("BCD.vcd");
        $dumpvars(1,BCD_tb);
        
        A_p=1'b0; B_p=1'b0; C_p=1'b0; D_p=1'b0;
		#1
        A_p=1'b0; B_p=1'b0; C_p=1'b0; D_p=1'b1;
        #1
        A_p=1'b0; B_p=1'b0; C_p=1'b1; D_p=1'b0;
        #1
        A_p=1'b0; B_p=1'b0; C_p=1'b1; D_p=1'b1;
        #1
        A_p=1'b0; B_p=1'b1; C_p=1'b0; D_p=1'b0;
        #1
        A_p=1'b0; B_p=1'b1; C_p=1'b0; D_p=1'b1;
        #1
        A_p=1'b0; B_p=1'b1; C_p=1'b1; D_p=1'b0;
        #1
        A_p=1'b0; B_p=1'b1; C_p=1'b1; D_p=1'b1;
        #1
        A_p=1'b1; B_p=1'b0; C_p=1'b0; D_p=1'b0;
        #1
        A_p=1'b1; B_p=1'b0; C_p=1'b0; D_p=1'b1;
        #1
        A_p=1'b1; B_p=1'b0; C_p=1'b1; D_p=1'b0;
        #1
        A_p=1'b1; B_p=1'b0; C_p=1'b1; D_p=1'b1;
        #1
        A_p=1'b1; B_p=1'b1; C_p=1'b0; D_p=1'b0;
        #1
        A_p=1'b1; B_p=1'b1; C_p=1'b0; D_p=1'b1;
        #1
        A_p=1'b1; B_p=1'b1; C_p=1'b1; D_p=1'b0;
        #1
        A_p=1'b1; B_p=1'b1; C_p=1'b1; D_p=1'b1;

      #1
        $finish();
      
    end
		endmodule