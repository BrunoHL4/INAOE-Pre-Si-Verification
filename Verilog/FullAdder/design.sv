// *********************************************************************************
// Project Name : Full Adder
// Author       : Bruno Hernández López
// Email        : brunohlopez@hotmail.com
// Module Name  : design.sv
// Create Date  : 2022/05/03 5:12pm
// CopyRight(c) : All Rights Reserved
//
// *********************************************************************************
// Modification History:
// Date             By              Version                 Change Description
// -----------------------------------------------------------------------
// XXXX       		BHL4          1.0                        Original
//  
// *********************************************************************************

module FA (
    input A, B, Cin,
    output  S, Cout
 );
 wire w1,w2,w3,w4,w5; 
   xor  (w4, A, B);
   xor  (S,w4,Cin);
   and  (w1,B , Cin);
   and  (w2,A , B);
   and  (w3,A , Cin);
   or (w5, w1,w2);
   or (Cout, w5,w3);
 endmodule