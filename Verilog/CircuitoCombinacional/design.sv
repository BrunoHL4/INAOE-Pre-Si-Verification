// *********************************************************************************
// Project Name : COMB_M
// Author       : Bruno Hernández López
// Email        : brunohlopez@hotmail.com
// Module Name  : design.sv
// Create Date  : 2022/05/02 12:24pm
// CopyRight(c) : All Rights Reserved
//
// *********************************************************************************
// Modification History:
// Date             By              Version                 Change Description
// -----------------------------------------------------------------------
// XXXX       		BHL4          1.0                        Original
//  
// *********************************************************************************

module COMB_M(
  input a,b,c,
  output m);
  
  assign m = (~a&~b&~c)|(~a&b&c)|(a&~b&c);
  
endmodule