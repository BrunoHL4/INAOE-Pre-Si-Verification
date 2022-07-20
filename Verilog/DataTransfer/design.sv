// *********************************************************************************
// Project Name : DataTransfer
// Author       : Bruno Hernández López
// Email        : brunohlopez@hotmail.com
// Module Name  : design.sv
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

module DataTransfer(
  input clk,rst,						//Reset y reloj
  input [4:0] FR_WADDR,
  input [7:0] FR_WDATA,   				//FileRegister Data y Direccion (Escritura)
  input FR_W,							//FileRegister Write (Escritura)
  
  input [4:0] DataA,DataB,
  input OEA,OEB,LD_A,LD_B,SEL_A,SEL_B,	//Señales de control
 
);
  wire [4:0] w1,w2,w3,w4;
  wire [7:0] QA,QB;
  wire [4:0] ABus;
  
  
  File_Reg U1	(.clk(clk),.rst(rst),.FR_WE(FR_W),.FR_Waddr(FR_WADDR),.FR_Wdata(FR_WDATA),.FR_RAddr_1(DataA),.FR_Rdata_1(QA),.FR_RAddr_2(DataB),.FR_Rdata_2(QB));
  
  mux 	   U2 	(ABus,QA,SEL_A,w1);  
  regX 	   U3	(clk,rst,LD_A,w1,w2);//PENDIENTE
  tristate U4	(OEA,w2,ABus);
  
  
  mux 	   U5 	(ABus,QB,SEL_B,w3);  
  regX 	   U6	(clk,rst,LD_B,w3,w4);//PENDIENTE
  tristate U7	(OEB,w4,ABus);
  
//  mux	   U8	(QA,QB,OEA,ABus);  
    
    
    endmodule