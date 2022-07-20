//-------------------------------------------------------------------------
//						mem_seq_item - www.verificationguide.com 
//-------------------------------------------------------------------------

class mem_seq_item extends uvm_sequence_item;
  //---------------------------------------
  //data and control fields
  //---------------------------------------
  rand bit [4:0] rd;
  rand bit [4:0] rs;
  rand bit [4:0] rt;
  rand bit [5:0] addr;
  rand bit [5:0] funct;
  rand bit [25:0] JTA;
  rand bit [15:0] imm;
  rand bit [31:0] instruction;
  
  bit [4:0] shamt = 5'b0;
  bit [31:0] PC_In;
  bit [31:0] mux5_out;
  bit [31:0] A;
  bit [31:0] B;
  bit [31:0] rd2;
  bit [31:0] PCOut;
  bit [31:0] datamem_out;
  bit [31:0] mux2_outt;
  
  //---------------------------------------
  //Utility and Field macros
  //---------------------------------------
  `uvm_object_utils_begin(mem_seq_item)
    `uvm_field_int(rd,UVM_ALL_ON)
    `uvm_field_int(rs,UVM_ALL_ON)
    `uvm_field_int(rt,UVM_ALL_ON)
    `uvm_field_int(addr,UVM_ALL_ON)
  	`uvm_field_int(funct,UVM_ALL_ON)
    `uvm_field_int(JTA,UVM_ALL_ON)
    `uvm_field_int(imm,UVM_ALL_ON)
    `uvm_field_int(instruction,UVM_ALL_ON)
  	`uvm_field_int(shamt,UVM_ALL_ON)
  `uvm_object_utils_end
  
  //---------------------------------------
  //Constructor
  //---------------------------------------
  function new(string name = "mem_seq_item");
    super.new(name);
  endfunction
  
  //---------------------------------------
  //constaints
  //---------------------------------------
  constraint op_available {addr inside {0, 2, 4, 5, 35, 43};}
  constraint rd_value {rd inside {[8:25]};}
  constraint rs_value {rs inside {[8:25]};}
  constraint rt_value {rt inside {[8:25]};}
  constraint JTA_value {JTA inside {[0:31]};}
  //constraint imm_value {(imm)<16;}
  constraint imm_value {(imm+rs)<32;}
  
  //Se crean rangos dependiendo del opcode de cada una de las instrucciones
  constraint funct_range{
    (addr == 0) -> funct inside {32,34,36,37,42};
  }
  
  typedef enum {r, i, j} AddrType;
  rand AddrType atype;
  constraint optype_range{
    (addr == 0) -> instruction [31:0] == {addr,rs,rt,rd,shamt,funct};
    (addr inside {4,5,35,43}) -> instruction [31:0] == {addr,rs,rt,imm};
    (addr == 2) -> instruction [31:0] == {addr,JTA};
  }
  constraint addr_range
  {
    (atype == r) -> addr == 0;
    (atype == i) -> addr inside {4,5,35,43};
    (atype == j) -> addr == 2;
  }
  
endclass