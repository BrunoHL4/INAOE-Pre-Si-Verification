module BHL(
  
  input clk,rst,
  input LD_A,
  input reg [3:0] RA,
  output reg [3:0] QA
 
  
);



  REG U1 (clk,rst,LD_A,RA,QA);



endmodule