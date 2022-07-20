// *********************************************************************************
// Project Name : Sub_sum
// Author       : Bruno Hernández López
// Email        : brunohlopez@hotmail.com
// Module Name  : design.sv
// Create Date  : 2022/05/06 1:08pm
// CopyRight(c) : All Rights Reserved
//
// *********************************************************************************
// Modification History:
// Date             By              Version                 Change Description
// -----------------------------------------------------------------------
// XXXX       		BHL4         	 1.0                        Original
//  
// *********************************************************************************
module sumres3_tb;
  reg [3:0] a_tb, b_tb, c_tb;
  reg sub_tb;
  wire [1:0] Cout_tb;
  wire [5:0] S1_tb, S2_tb;
  integer i;
  sumres3 UUT (.a(a_tb),.b(b_tb),.c(c_tb),.sub(sub_tb),.S1(S1_tb),.S2(S2_tb),.Cout(Cout_tb));
  initial 
    begin
      a_tb <= 0;
      b_tb <= 0;
      c_tb <= 0;
      sub_tb <= 0;
      $monitor("A=%0d B=%0d C=%0d Sub=%0b S2=%d Cout=%0b", a_tb, b_tb, c_tb,sub_tb,S2_tb,Cout_tb);
      for (i=0; i < 15; i=i+1) 
        begin
          a_tb = i;
          b_tb = i+1;
          c_tb = i;
          #1;
          end
      sub_tb <= 1;
      for (i=3; i < 8; i=i+1) 
        begin
          a_tb = i+6;
          b_tb = i-2;
          c_tb = i-1;
          #1;
          end
      #1;
      $finish();
      end
endmodule