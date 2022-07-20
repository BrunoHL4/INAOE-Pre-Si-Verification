//// time var 
`timescale 1ns/100ps
`include"PC.sv"
`include"adder.sv"
`include"ALU.sv"
`include"ALU_control.sv"
`include"Control.sv"
`include"DataMem.sv"
`include"InstMem.sv"
`include"mux2_1.sv"
`include"Mux4_1.sv"
`include"mux5b_2to1.sv"
`include"RegFile.sv"
`include"SignExt.sv"
`include"SimpleReg.sv"
`include"RegWe.sv"
`include"DoubleReg.sv"
/////////////////////////module////////////////////////
module Mips_machine_dut ();
reg clk;
reg rst;
//// assing to entity
Mips_machine DUT(clk,rst);
int i;

initial
begin
  $dumpvars;
  $dumpfile("dump.vcd");
  $display("buss");
  ////////////////////////////////////////
  rst=0;
  clk=0;
  #2
  rst=1;
  ////////////////Secuence////////////////
  while (i<50) begin
        i++;  
    	#2;
    end
    
  ////////////////////////////////////////
  $finish();
end 
  
  
always forever begin
    #1 clk=~clk;
end
  
endmodule