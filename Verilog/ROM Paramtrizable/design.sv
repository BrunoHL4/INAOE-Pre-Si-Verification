// *********************************************************************************
// Project Name : ROM Parametrizable
// Author       : Bruno Hernández López
// Email        : brunohlopez@hotmail.com
// Module Name  : design.sv
// Create Date  : 2022/05/06 5:34pm
// CopyRight(c) : All Rights Reserved
//
// *********************************************************************************
// Modification History:
// Date             By              Version                 Change Description
// -----------------------------------------------------------------------
// XXXX       		BHL4         	 1.0                        Original
//  
// *********************************************************************************

module ROM_BHL(addr,dout);
  parameter ADDR=2;//Bits de direcciones
  parameter DOUT=14;// Tamaño de palabra (en bits)
  parameter MEM=4;// Numero de direcciones de la memoria
  
  input reg [ADDR-1:0] addr;
  output reg [DOUT-1:0] dout;

  
  reg[DOUT-1:0] mem [MEM-1:0];
  
  initial
    begin
      $readmemb("data.txt",mem);
      assign dout=mem[addr];
    end
  
endmodule




