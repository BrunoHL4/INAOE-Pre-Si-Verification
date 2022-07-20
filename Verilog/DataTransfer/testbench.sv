// *********************************************************************************
// Project Name : DataTransfer
// Author       : Bruno Hernández López
// Email        : brunohlopez@hotmail.com
// Module Name  : testbench.sv
// Create Date  : 2022/05/17 3:07pm			
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

`include "regX.sv"
`include "mux.sv"
`include "tristate.sv"
`include "File_Reg.sv"

module DataTransfer_tb;

reg clk, rst;
reg OEA,OEB,LD_A,LD_B,SEL_A,SEL_B;

  reg [7:0] FR_WDATA;
  reg [4:0]FR_WADDR;
  reg FR_W;

  wire [7:0]QA;
  wire [7:0]QB;




  DataTransfer UUT (.clk(clk),.rst(rst),.SEL_A(SEL_A),.LD_A(LD_A),.OEA(OEA),.SEL_B(SEL_B),.LD_B(LD_B),.OEB(OEB),.FR_W(FR_W),.FR_WADDR(FR_WADDR),.FR_WDATA(FR_WDATA),.DataA(5'b00000),.DataB(5'b00001));


initial begin
  $dumpfile("DataTransfer.vcd");
  $dumpvars(1,DataTransfer_tb);
		clk = 0; rst = 1; SEL_A = 0;	LD_A = 0; OEA = 1; SEL_B = 0;	LD_B = 0; OEB = 1;
 
		#1 rst = 0; clk=~clk;
  #1 rst = 0; clk=~clk;
		//Cargar datos
		#1;FR_WDATA = 8'b00000110; FR_WADDR = 5'b00000;  clk=~clk;
		#1;FR_W = 1; clk=~clk;
		#1;FR_W = 0; clk=~clk;
		#1;FR_WDATA = 8'b00000101; FR_WADDR = 5'b00001; clk=~clk;
		#1;FR_W = 1; clk=~clk;
		#1;FR_W = 0;	 clk=~clk;
		
		//Cargar a
		#1;clk=~clk; SEL_A = 1;	LD_A = 1; OEA = 1; SEL_B = 0;	LD_B = 0; OEB = 1;
  $display("CLK:%b SEL_A:%d LOAD_A:%d OEA:%d SEL_B:%d LOAD_B:%d OEB:%d DataA:%8b DataB:%8b", clk, SEL_A,LD_A,OEA,SEL_B,LD_B,OEB,QA,QB);
 		#1; clk=~clk;SEL_A = 0;	LD_A = 0; OEA = 0; SEL_B = 0;	LD_B = 0; OEB = 1;
  $display("CLK:%b SEL_A:%d LOAD_A:%d OEA:%d SEL_B:%d LOAD_B:%d OEB:%d DataA:%8b DataB:%8b", clk, SEL_A,LD_A,OEA,SEL_B,LD_B,OEB,QA,QB);

		//Cargar b
  		#1; clk=~clk;SEL_A = 0;	LD_A = 0; OEA = 1; SEL_B = 1;	LD_B = 1; OEB = 1; clk=~clk;
  $display("CLK:%b SEL_A:%d LOAD_A:%d OEA:%d SEL_B:%d LOAD_B:%d OEB:%d DataA:%8b DataB:%8b", clk, SEL_A,LD_A,OEA,SEL_B,LD_B,OEB,QA,QB);
		#1;SEL_A = 0;	LD_A = 0; OEA = 1; SEL_B = 0;	LD_B = 0; OEB = 0;clk=~clk;
  $display("SEL_A:%d LOAD_A:%d OEA:%d SEL_B:%d LOAD_B:%d OEB:%d DataA:%8b DataB:%8b", SEL_A,LD_A,OEA,SEL_B,LD_B,OEB,QA,QB);
		//cargar lo que hay en b a a
 		#1;SEL_A = 0;	LD_A = 1; OEA = 1; SEL_B = 0;	LD_B = 0; OEB = 0;clk=~clk;
  $display("SEL_A:%d LOAD_A:%d OEA:%d SEL_B:%d LOAD_B:%d OEB:%d DataA:%8b DataB:%8b", SEL_A,LD_A,OEA,SEL_B,LD_B,OEB,QA,QB);
	end


endmodule