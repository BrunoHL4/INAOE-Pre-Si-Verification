// *********************************************************************************
// Project Name : Multiplicador4bits
// Author       : Bruno Hernández López
// Email        : brunohlopez@hotmail.com
// Module Name  : design.sv
// Create Date  : 2022/05/06 4:51pm
// CopyRight(c) : All Rights Reserved
//
// *********************************************************************************
// Modification History:
// Date             By              Version                 Change Description
// -----------------------------------------------------------------------
// XXXX       		BHL4         	 1.0                        Original
//  
// *********************************************************************************

`include "HA.sv"
`include "FAgates02.sv"

module MUL (
    input [3:0] a,b,
    output [7:0] P
);
wire Co11,Co21,Co22,Co31,Co32,Co33,Co41,Co42,Co43,Co51,Co52,Co61;
//wire Co2a,Co3a,Co3b,Co4a;
wire SUP20,SUP30,SUP31,SUP40,SUP41,SP50,SUP51;
wire SP00,SP01,SP02,SP03,SP10,SP11,SP12,SP13,SP20,SP21,SP22,SP23,SP30,SP31,SP32,SP33;
//Subproducts
//----------row0----------------
assign SP00 = a[0]&b[0];
assign SP01 = a[1]&b[0];
assign SP02 = a[2]&b[0];
assign SP03 = a[3]&b[0];
//----------row1----------------
assign SP10 = a[0]&b[1];
assign SP11 = a[1]&b[1];
assign SP12 = a[2]&b[1];
assign SP13 = a[3]&b[1];
//----------row2----------------
assign SP20 = a[0]&b[2];
assign SP21 = a[1]&b[2];
assign SP22 = a[2]&b[2];
assign SP23 = a[3]&b[2];
//----------row3----------------
assign SP30 = a[0]&b[3];
assign SP31 = a[1]&b[3];
assign SP32 = a[2]&b[3];
assign SP33 = a[3]&b[3];
//--------------------------
// Product
//...........P0.............
assign P[0] = SP00;
//...........P1.............
HA p0 (.A(SP01),.B(SP10),.S(P[1]),.Cout(Co11));
//...........P2.............
FA p21 (.A(SP02),.B(SP11),.Cin(Co11),.S(SUP20),.Cout(Co21));
HA p22 (.A(SP20),.B(SUP20) ,.S(P[2]),.Cout(Co22));
//...........P3.............
FA p31 (.A(SP03),.B(Co21), .Cin(Co22),.S(SUP30),.Cout(Co31));
FA p32 (.A(SP12),.B(SP21),.Cin(SP30),.S(SUP31),.Cout(Co32));
HA p33 (.A(SUP30),.B(SUP31),.S(P[3]),.Cout(Co33));
//...........P4.............
FA p41 (.A(Co31),.B(Co32),.Cin(Co33),.S(SUP40),.Cout(Co41));
FA p42 (.A(SP13),.B(SP22),.Cin(SP31),.S(SUP41),.Cout(Co42));
HA p43 (.A(SUP40),.B(SUP41),.S(P[4]),.Cout(Co43));
//...........P5.............
FA p51 (.A(Co41),.B(Co42),.Cin(Co43),.S(SUP50),.Cout(Co51));
FA p52 (.A(SP23),.B(SP32),.Cin(SUP50),.S(P[5]),.Cout(Co52)); 
//...........P6.............
FA p61 (.A(SP33),.B(Co51),.Cin(Co52),.S(P[6]),.Cout(Co61));
//...........P7.............
assign P[7] = Co61;
endmodule
