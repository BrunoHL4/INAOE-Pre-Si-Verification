// *********************************************************************************
// Project Name : Multiplicador 3 números
// Author       : Bruno Hernández López
// Email        : brunohlopez@hotmail.com
// Module Name  : design.sv
// Create Date  : 2022/05/09 3:07pm
// CopyRight(c) : All Rights Reserved
//
// *********************************************************************************
// Modification History:
// Date             By              Version                 Change Description
// -----------------------------------------------------------------------
// XXXX       		BHL4         	 1.0                        Original
//  
// *********************************************************************************

`include "mult.sv"
`include "mult2.sv"
`include "HA.sv"
`include "FAgates02.sv"

module MUL (
  input [3:0] a,b,
  input [7:0] c,
  output [7:0] P1,
  output [13:0]P2
);

  
  mult U1(a,b,P1);
  mult2 U2(P1,c,P2);
  
endmodule
  