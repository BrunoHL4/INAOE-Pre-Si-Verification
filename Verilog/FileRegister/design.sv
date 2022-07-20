module BHL(
  
  input clk,rst,
  
  
  input WriteEnable,
  input reg [4:0] WriteAddr,
  input reg[7:0] WriteData,
  
  input reg[4:0] ReadAddr1,ReadAddr2,

  
  output reg [7:0] Data1,Data2
  
);

  wire [7:0] OutputData1, OutputData2;

  file_Reg R1 (clk,rst,WriteEnable,WriteAddr,WriteData,ReadAddr1,OutputData1,ReadAddr2,OutputData2);
  
	assign Data1=OutputData1;
	assign Data2=OutputData2;


endmodule