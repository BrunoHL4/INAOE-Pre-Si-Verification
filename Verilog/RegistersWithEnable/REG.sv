// *********************************************************************************
// Project Name : RegistersWithEnable
// Author       : Bruno Hernández López
// Email        : brunohlopez@hotmail.com
// Module Name  : design.sv
// Create Date  : 2022/07/19 7:33pm		
// CopyRight(c) : All Rights Reserved
//
// *********************************************************************************
// Modification History:
// Date             By              Version                 Change Description
// -----------------------------------------------------------------------
// XXXX       		BHL4         	 1.0                        Original
//  
// *********************************************************************************

module REG(
	input clk,
	input rst,
	input enable,
  input [3:0] D,
  output [3: 0] Q
);

  reg  [3:0] Reg_Q;


assign Q = Reg_Q;

always@(posedge clk or negedge rst) begin
  if(rst == 1'b1) 
		Reg_Q <= 0;
	else 
      if(enable == 1'b1)
			Reg_Q <= D;
end

endmodule