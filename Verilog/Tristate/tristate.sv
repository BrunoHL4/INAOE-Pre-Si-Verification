// *********************************************************************************
// Project Name : Tristate
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

module tristate (
  input wire OE,
  input wire [3:0] I,
  output reg [7:0] O
            );
  
always @(OE or I)
begin
    if (~OE)
        O = I;
    else
        O = 8'bZZZZZZZZ;
end
endmodule
