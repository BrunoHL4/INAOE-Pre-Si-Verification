

module Mips_machine (
  input [31:0] ins_in,
  	input clk,    // Clock
	input rst,  // Asynchronous reset active low/
  output [31:0] mux5_out,PCIn,PCOut,Ai,Bi,rd2,datamem_out,
  output [31:0] mux2_outt
);


//// pc
wire [31:0] PC_In,PC_Out,Adder1_out,Adder2_out,InstMem_Out,Reg1; //pc+4

////control
wire RegDst,Jump,BeQ,BnE,MemRead,MemToReg,MemWrite,ALUSrcA,RegWrite,IRWrite,PCWrite;
wire[1:0] ALUop,PCSrc,ALUSrcB;
///// file register 
wire [4:0] mux1_out;
wire [31 : 0]Read_Data_1,Read_Data_2,A,B,mux2_out;
///////sign exten
wire [31:0] sign_out;
/////// ALU control
wire [3:0]ALUci;
////// ALU
wire [31:0] mux3_out,ALU_out,ALU_Result,mux4_out;
wire zero;
////// DataMem Out
  wire [31:0] Ram_Out,Reg2;


 assign InstMem_Out=ins_in;
 assign mux5_out=ALU_out;
 assign PCIn = PC_In;
 assign Ai = A;
 assign Bi = B;
 assign PCOut=PC_Out;
 assign rd2=Read_Data_2;
 assign datamem_out=Ram_Out;
  assign mux2_outt=mux2_out;
////instruction
PC pc(PC_In,PC_Out,rst,clk,(BeQ&&zero)|(BnE&&~zero)|PCWrite);
//InstMem InsMem(PC_Out,InstMem_Out);
  
RegWe reg1(InstMem_Out,Reg1,rst,clk,IRWrite);

////data mem
DataMem DataMem(clk,B,ALU_out,MemWrite,Ram_Out);
SimpleReg reg2(Ram_Out,clk,rst,Reg2);


///Registers mem
mux2_1 mux2(mux2_out,MemToReg,Reg2,ALU_out);
mux5b_2to1 mux1(mux1_out,RegDst,Reg1[15:11],Reg1[20:16]);
RegFile RegMem(clk,RegWrite,mux1_out,mux2_out,Reg1[25:21],Read_Data_1,Reg1[20:16],Read_Data_2);

DoubleReg reg3(Read_Data_1,Read_Data_2,clk,rst,A,B);

////aLU
SignExt sgnext(Reg1[15:0],sign_out);
mux_4to1 mux3(mux3_out,ALUSrcB,B,sign_out,32'b1,sign_out);
mux2_1 mux4(mux4_out,ALUSrcA,A,PC_Out);
ALU ALU1(ALUci,mux4_out,mux3_out,zero,ALU_Result);
SimpleReg reg4(ALU_Result,clk,rst,ALU_out);
mux_4to1 mux5(PC_In,PCSrc,ALU_Result,{PC_Out[31:26],Reg1[25:0]},ALU_out,32'bz);

ALU_control ALUCtrl(Reg1[5:0],ALUop,ALUci);
Control C1(Reg1[31:26],rst,clk,MemWrite,IRWrite,RegDst,MemToReg,RegWrite,ALUSrcA,ALUSrcB,ALUop,BeQ,BnE,PCWrite,PCSrc);


endmodule 