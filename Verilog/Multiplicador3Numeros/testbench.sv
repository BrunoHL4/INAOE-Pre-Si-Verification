// *********************************************************************************
// Project Name : Multiplicador 3 números
// Author       : Bruno Hernández López
// Email        : brunohlopez@hotmail.com
// Module Name  : testbench.sv
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

module MUL_TB;
  wire [7:0] P1_TB;
  wire [13:0] P2_TB;
  reg [3:0] A_TB,B_TB;
  reg [7:0] C_TB;
integer i;
  MUL mMUL (.a(A_TB),.b(B_TB),.c(C_TB),.P1(P1_TB),.P2(P2_TB));
initial begin
  $monitor("Decimal= AxBxC [%0d]x[%0d]x[%0d] = %0d",A_TB,B_TB,C_TB,P2_TB);
    
  for (i= 1; i <16; i= i+1)
    begin
    A_TB = i-1;
      B_TB = i;
      C_TB=i;
    #10;

      $display ("Binario= AxBxC [%0b]x[%0b]x[%0b] = %0b",A_TB,B_TB,C_TB,P2_TB);
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