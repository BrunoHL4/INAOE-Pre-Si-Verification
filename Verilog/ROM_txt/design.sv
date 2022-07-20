// *********************************************************************************
// Project Name : ROM_TXT
// Author       : Bruno Hernández López
// Email        : brunohlopez@hotmail.com
// Module Name  : design.sv
// Create Date  : 2022/06/01 12:38pm			
// CopyRight(c) : All Rights Reserved
//
// *********************************************************************************
// Modification History:
// Date             By              Version                 Change Description
// -----------------------------------------------------------------------
// XXXX       		BHL4         	 1.0                        Original
//  
// *********************************************************************************

module ROM_BHL(
  input reg [2:0] addr,
  output reg [13:0] dout
);
  
  reg[13:0] mem [7:0];
  
  initial
    begin
      $readmemb("data.txt",mem);
      assign dout=mem[addr];
    end
  
endmodule