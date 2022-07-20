// *********************************************************************************
// Project Name : AndGate
// Author       : Bruno Hernández López
// Email        : brunohlopez@hotmail.com
// Module Name  : design.sv
// Create Date  : 2022/05/02 11:19am
// CopyRight(c) : All Rights Reserved
//
// *********************************************************************************
// Modification History:
// Date             By              Version                 Change Description
// -----------------------------------------------------------------------
// XXXX       		BHL4          1.0                        Original
//  
// *********************************************************************************

module ANDgate(
  
  input IN_a,
  input IN_b,
  output OUT_x
);
  
  assign OUT_x = IN_a & IN_b;
  
endmodule