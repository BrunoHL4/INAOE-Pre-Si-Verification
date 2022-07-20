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
`include"mux5b_2to1.sv"
`include"RegFile.sv"
`include"SignExt.sv"
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
  #1
  rst=1;
  ////////////////Secuence////////////////
  while (i<25) begin
        i++;  
    	#1;
    end
    
  ////////////////////////////////////////
  $finish();
end 
  
  
always forever begin
    #1 clk=~clk;
end
  
endmodule