interface intf(input logic clk,reset);
  
  
  //declaring the signals
  logic       valid;
  logic [4:0] rd;
  logic [4:0] rs;
  logic [4:0] rt;
  logic [5:0] addr;
  logic	[5:0] funct;
  logic	[25:0] JTA;
  logic	[15:0] imm;
  logic	[4:0] shamt;
  logic [31:0] PC_In;
  logic [31:0] PCOut;
  logic [31:0] mux5_out;
  logic [31:0] instruction;
  logic [31:0] A;
  logic [31:0] B;
  logic [31:0] rd2;
  logic [31:0] datamem_out;
  logic [31:0] mux2_outt;
  
endinterface