// *********************************************************************************
// Project Name : Multiplicador4bits
// Author       : Bruno Hernández López
// Email        : brunohlopez@hotmail.com
// Module Name  : testbench.sv
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

module MUL_TB;
wire [7:0] P_TB;
reg [3:0] A_TB,B_TB;
integer i;
MUL mMUL (.a(A_TB),.b(B_TB),.P(P_TB));
initial begin
  $monitor("Decimal= AxB [%0d]x[%0d] = %0d",A_TB,B_TB,P_TB);
    
  for (i= 1; i <16; i= i+1)
    begin
    A_TB = i-1;
      B_TB = i;
    #10;

      $display ("Binario= AxB [%4b]x[%4b] = %0b",A_TB,B_TB,P_TB);
            $display ("----");
    end
    #10;
    $finish();
    end
initial begin
    $dumpvars(1,MUL_TB);
    $dumpfile("dump.vcd");
  end
  endmodule