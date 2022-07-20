//-------------------------------------------------------------------------
`timescale 1ns/100ps
`include"PC.sv"
`include"adder.sv"
`include"ALU.sv"
`include"ALU_control.sv"
`include"Control.sv"
`include"DataMem.sv"
`include"InstMem.sv"
`include"mux2_1.sv"
`include"mux5b_2to1.sv"
`include"RegFile.sv"
`include"SignExt.sv"
`include"RegWe.sv"
`include"SimpleReg.sv"
`include"DoubleReg.sv"
`include"Mux4_1.sv"
//				www.verificationguide.com   testbench.sv
//-------------------------------------------------------------------------
//tbench_top or testbench top, this is the top most file, in which DUT(Design Under Test) and Verification environment are connected. 
//-------------------------------------------------------------------------

//including interfcae and testcase files
`include "interface.sv"

//-------------------------[NOTE]---------------------------------
//Particular testcase can be run by uncommenting, and commenting the rest
`include "random_test.sv"
//`include "directed_test.sv"
//----------------------------------------------------------------

module tbench_top;
  
  //clock and reset signal declaration
  bit clk;
  bit reset;
  
  //clock generation
  always #1 clk = ~clk;
  
  //reset Generation
  initial begin
    reset = 0;
    #2 reset =1;
  end
  
  
  //creatinng instance of interface, inorder to connect DUT and testcase
  intf i_intf(clk,reset);
  
  //Testcase instance, interface handle is passed to test as an argument
  test t1(i_intf);
  
  //DUT instance, interface signals are connected to the DUT ports
  
  Mips_machine DUT (
    .ins_in(i_intf.instruction),
    .clk(i_intf.clk),
    .rst(i_intf.reset),
    .mux5_out(i_intf.mux5_out),
    .PCIn(i_intf.PC_In),
    .PCOut(i_intf.PCOut),
    .Ai(i_intf.A),
    .Bi(i_intf.B),
    .rd2(i_intf.rd2),
    .datamem_out(i_intf.datamem_out),
    .mux2_outt(i_intf.mux2_outt)
    
   );
  
  //enabling the wave dump
  initial begin 
    $dumpfile("dump.vcd"); $dumpvars;
  end
endmodule