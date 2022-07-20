//-------------------------------------------------------------------------
//						mem_interface - www.verificationguide.com
//-------------------------------------------------------------------------

interface mem_if(input logic clk,reset);
  
  //---------------------------------------
  //declaring the signals
  //---------------------------------------
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
  logic [31:0] InstMem_Out;
  logic [31:0] mux2_outt;
  
  //---------------------------------------
  //driver clocking block
  //---------------------------------------
  clocking driver_cb @(posedge clk);
    default input #5 output #0;
    input mux5_out;
    input PC_In;
    input PCOut;
    input A;
    input B;
    input rd2;
    input mux2_outt;
    output rd;
    output rs;
    output rt;
    output addr;
    output funct;
    output JTA;
    output imm;
    output shamt;
    output instruction;
    input datamem_out;
    output  InstMem_Out;
  endclocking
  
  //---------------------------------------
  //monitor clocking block
  //---------------------------------------
  clocking monitor_cb @(posedge clk);
    default input #10 output #10;
    input mux5_out;
    input PC_In;
    input PCOut;
    input A;
    input B;
    input mux2_outt;
    input rd2;
    input rd;
    input rs;
    input rt;
    input addr;
    input funct;
    input JTA;
    input imm;
    input shamt;
    input instruction;
    input datamem_out;
    input  InstMem_Out;
  endclocking
  
  //---------------------------------------
  //driver modport
  //---------------------------------------
  modport DRIVER  (clocking driver_cb,input clk,reset);
  
  //---------------------------------------
  //monitor modport  
  //---------------------------------------
  modport MONITOR (clocking monitor_cb,input clk,reset);
  
endinterface