// *********************************************************************************
// Project Name : Half Adder
// Author       : Bruno Hernández López
// Email        : brunohlopez@hotmail.com
// Module Name  : testbench.sv
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

module HA_TB;
    reg A_TB, B_TB;
    wire S_TB,Cout_TB;
    integer i;
//
HA U0 (.A(A_TB), .B(B_TB), .S(S_TB), .Cout(Cout_TB));
initial begin
    A_TB <= 0;
    B_TB <= 0;
    $monitor("A=%0b B=%0b S=%0b Cout=%0b", A_TB,B_TB,S_TB,Cout_TB);
    for (i=0; i < 4; i=i+1) begin
        {A_TB,B_TB} = i;
        #10;
    end
end
 initial begin
    $dumpvars;
    $dumpfile("dump.vcd");
  end
endmodule