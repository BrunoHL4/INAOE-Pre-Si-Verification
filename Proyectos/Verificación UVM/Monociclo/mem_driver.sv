//-------------------------------------------------------------------------
//						mem_driver - www.verificationguide.com
//-------------------------------------------------------------------------

`define DRIV_IF vif.DRIVER.driver_cb

class mem_driver extends uvm_driver #(mem_seq_item);

  //--------------------------------------- 
  // Virtual Interface
  //--------------------------------------- 
  virtual mem_if vif;
  `uvm_component_utils(mem_driver)
    
  //--------------------------------------- 
  // Constructor
  //--------------------------------------- 
  function new (string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new

  //--------------------------------------- 
  // build phase
  //---------------------------------------
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
     if(!uvm_config_db#(virtual mem_if)::get(this, "", "vif", vif))
       `uvm_fatal("NO_VIF",{"virtual interface must be set for: ",get_full_name(),".vif"});
  endfunction: build_phase

  //---------------------------------------  
  // run phase
  //---------------------------------------  
  virtual task run_phase(uvm_phase phase);
    forever begin
      seq_item_port.get_next_item(req);
      drive();
      seq_item_port.item_done();
    end
  endtask : run_phase
  
  //---------------------------------------
  // drive - transaction level to signal level
  // drives the value's from seq_item to interface signals
  //---------------------------------------
  virtual task drive();
    `DRIV_IF.rd <= 0;
    `DRIV_IF.rs <= 0;
    `DRIV_IF.rt <= 0;
    `DRIV_IF.addr <= 0;
    `DRIV_IF.funct <= 0;
    `DRIV_IF.JTA <= 0;
    `DRIV_IF.imm <= 0;
    `DRIV_IF.shamt <= 0;
    `DRIV_IF.instruction <=0;
    @(posedge vif.DRIVER.clk);
      `DRIV_IF.rd <= req.rd;
      `DRIV_IF.rs <= req.rs;
      `DRIV_IF.rt <= req.rt;
      `DRIV_IF.addr <= req.addr;
      `DRIV_IF.funct <= req.funct;
      `DRIV_IF.JTA <= req.JTA;
      `DRIV_IF.imm <= req.imm;
      `DRIV_IF.shamt <= req.shamt;
    `DRIV_IF.instruction <= req.instruction;
      
      @(posedge vif.DRIVER.clk);
    `DRIV_IF.instruction <= req.instruction;
    `DRIV_IF.InstMem_Out <= req.instruction;
      req.B <= `DRIV_IF.B;
      req.A<= `DRIV_IF.A;
      req.PC_In<= `DRIV_IF.PC_In;
      req.PCOut <= `DRIV_IF.PCOut;
      req.mux5_out<= `DRIV_IF.mux5_out;
      @(posedge vif.DRIVER.clk);
	  req.rd2 <= `DRIV_IF.rd2;
      req.datamem_out <= `DRIV_IF.datamem_out;
    //$display("%b-%b",`DRIV_IF.A,req.A);
      @(posedge vif.DRIVER.clk);
    //$display("%b-%b",`DRIV_IF.instruction,req.instruction);
//$display("%b-%b",`DRIV_IF.A,req.A);

    
  endtask : drive
endclass : mem_driver