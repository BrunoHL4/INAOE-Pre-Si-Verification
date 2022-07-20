module Mips_machine (
	input clk,    // Clock
	input rst  // Asynchronous reset active low
);

wire [31:0] PC_In,PC_Out,Adder1_out,Adder2_out,mux1_out,InstMem_Out; //pc+4
////control
wire RegDst,Jump,BeQ,BnE,MemRead,MemToReg,MemWrite,ALUsrc,RegWrite;
wire[1:0] ALUop;
///// file register 
wire [4:0] mux3_out;
wire [31 : 0]Read_Data_1,Read_Data_2;
///////sign exten
wire [31:0] signext_out;
/////// ALU control
wire [3:0]ALUci;
////// ALU
wire [31:0] mux4_out,ALU_out;
wire zero;
////// DataMem Out
wire [31:0] Ram_Out,mux5_out;

PC pc(PC_In,clk,rst,PC_Out);
Adder Adder_1(PC_Out,32'd1,Adder1_out);
Adder Adder_2(Adder1_out, signext_out ,Adder2_out);

mux2_1 mux1(mux1_out,(zero&&BeQ)|(~zero&&BnE),Adder2_out,Adder1_out);
mux2_1 mux2(PC_In,Jump,{Adder1_out[31:26],InstMem_Out[25:0]},mux1_out);

InstMem InstMem(PC_Out,InstMem_Out);
Control Control(InstMem_Out[31:26],RegDst,Jump,BeQ,BnE,MemRead,MemToReg,MemWrite,ALUop,ALUsrc,RegWrite);

mux5b_2to1 mux3(mux3_out,RegDst,InstMem_Out[15:11],InstMem_Out[20:16]);

RegFile registers(clk,RegWrite,mux3_out,mux5_out,InstMem_Out[25:21],Read_Data_1,InstMem_Out[20:16],Read_Data_2);

SignExt SignExt(InstMem_Out[15:0],signext_out);
ALU_control ALUcontrol(InstMem_Out[5:0],ALUop,ALUci);

mux2_1 mux4(mux4_out,ALUsrc,signext_out,Read_Data_2);
ALU ALU(ALUci,Read_Data_1,mux4_out,zero,ALU_out);

DataMem DataMem(clk,Read_Data_2,ALU_out,MemWrite,Ram_Out);

mux2_1 mux5(mux5_out,MemToReg,Ram_Out,ALU_out);

endmodule 