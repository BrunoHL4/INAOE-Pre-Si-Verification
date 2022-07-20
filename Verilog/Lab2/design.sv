// *********************************************************************************
// Project Name : Lab2
// Author       : Bruno Hernández López
// Email        : brunohlopez@hotmail.com
// Module Name  : design.sv
// Create Date  : 2022/05/03 10:32am	
// CopyRight(c) : All Rights Reserved
//
// *********************************************************************************
// Modification History:
// Date             By              Version                 Change Description
// -----------------------------------------------------------------------
// XXXX       		BHL4          1.0                        Original
//  
// *********************************************************************************

module Lab2(
  input [0:3] din,
  output [0:1] dout
);
  
  
  assign dout[0]=(~din[0]&~din[1]&~din[2]&~din[3])+(din[0]&~din[1]&din[2]&din[3])+(din[0]&din[1]&~din[2]&~din[3])+(din[0]&din[1]&~din[2]&din[3]);
  assign dout[1]=(~din[0]&~din[1]&din[2]&~din[3])+(din[0]&din[1]&~din[2]&din[3])+(din[0]&din[1]&din[2]&~din[3])+(din[0]&din[1]&din[2]&din[3]);
  
endmodule

