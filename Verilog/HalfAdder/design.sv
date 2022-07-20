// *********************************************************************************
// Project Name : Half Adder
// Author       : Bruno Hernández López
// Email        : brunohlopez@hotmail.com
// Module Name  : design.sv
// Create Date  : 2022/05/03 5:10pm
// CopyRight(c) : All Rights Reserved
//
// *********************************************************************************
// Modification History:
// Date             By              Version                 Change Description
// -----------------------------------------------------------------------
// XXXX       		BHL4          1.0                        Original
//  
// *********************************************************************************

module HA (
    input A, B,
    output reg S, Cout
 );
 always @ ( A or B)
 begin
     {Cout, S} = A + B;
 end
 endmodule