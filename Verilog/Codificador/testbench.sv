// *********************************************************************************
// Project Name : Codificador
// Author       : Bruno Hernández López
// Email        : brunohlopez@hotmail.com
// Module Name  : testbench.sv
// Create Date  : 2022/05/05 9:40am
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


`include "SegmentoA.sv"
`include "SegmentoB.sv"
`include "SegmentoC.sv"
`include "SegmentoD.sv"
`include "SegmentoE.sv"
`include "SegmentoF.sv"
`include "SegmentoG1.sv"
`include "SegmentoG2.sv"
`include "SegmentoH.sv"
`include "SegmentoI.sv"
`include "SegmentoJ.sv"
`include "SegmentoK.sv"
`include "SegmentoL.sv"
`include "SegmentoM.sv"



module Cod_BHL_tb;
  wire a_p,b_p,c_p,d_p,e_p,f_p,g1_p,g2_p,h_p,i_p,j_p,k_p,l_p,m_p;
  reg A_p,B_p,C_p;
  
  Cod_BHL UUT (.A(A_p),.B(B_p),.C(C_p),.a(a_p),.b(b_p),.c(c_p),.d(d_p),.e(e_p),.f(f_p),.g1(g1_p),.g2(g2_p),.h(h_p),.i(i_p),.j(j_p),.k(k_p),.l(l_p),.m(m_p));
           
	initial
      begin
        
        $dumpfile("Cod_BHL.vcd");
        $dumpvars(1,Cod_BHL_tb);
        
        A_p=1'b0; B_p=1'b0; C_p=1'b0;
		#1
        A_p=1'b0; B_p=1'b0; C_p=1'b1;
        #1
        A_p=1'b0; B_p=1'b1; C_p=1'b0;
        #1
        A_p=1'b0; B_p=1'b1; C_p=1'b1;
        #1
        A_p=1'b1; B_p=1'b0; C_p=1'b0;
        #1
        A_p=1'b1; B_p=1'b0; C_p=1'b1;
        #1
        A_p=1'b1; B_p=1'b1; C_p=1'b0;
        #1
        A_p=1'b1; B_p=1'b1; C_p=1'b1;
      #1
        $finish();
      
    end
		endmodule