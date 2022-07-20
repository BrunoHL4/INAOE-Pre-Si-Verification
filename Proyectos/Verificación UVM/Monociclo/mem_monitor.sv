//-------------------------------------------------------------------------
//						mem_monitor - www.verificationguide.com 
//-------------------------------------------------------------------------

class mem_monitor extends uvm_monitor;

  //---------------------------------------
  // Virtual Interface
  //---------------------------------------
  virtual mem_if vif;

  //---------------------------------------
  // analysis port, to send the transaction to scoreboard
  //---------------------------------------
  uvm_analysis_port #(mem_seq_item) item_collected_port;
  
  //---------------------------------------
  // The following property holds the transaction information currently
  // begin captured (by the collect_address_phase and data_phase methods).
  //---------------------------------------
  mem_seq_item trans_collected;

  `uvm_component_utils(mem_monitor)

  //---------------------------------------
  // new - constructor
  //---------------------------------------
  function new (string name, uvm_component parent);
    super.new(name, parent);
    trans_collected = new();
    item_collected_port = new("item_collected_port", this);
  endfunction : new

  //---------------------------------------
  // build_phase - getting the interface handle
  //---------------------------------------
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual mem_if)::get(this, "", "vif", vif))
       `uvm_fatal("NOVIF",{"virtual interface must be set for: ",get_full_name(),".vif"});
  endfunction: build_phase
  
  //---------------------------------------
  // run_phase - convert the signal level activity to transaction level.
  // i.e, sample the values on interface signal ans assigns to transaction class fields
  //---------------------------------------
  virtual task run_phase(uvm_phase phase);
    forever begin
      @(posedge vif.MONITOR.clk);
      trans_collected.rd   = vif.monitor_cb.rd;
      trans_collected.rs   = vif.monitor_cb.rs;
      trans_collected.rt   = vif.monitor_cb.rt;
      trans_collected.addr   = vif.monitor_cb.addr;
      trans_collected.funct   = vif.monitor_cb.funct;
      trans_collected.JTA   = vif.monitor_cb.JTA;
      trans_collected.imm   = vif.monitor_cb.imm;
      trans_collected.shamt   = vif.monitor_cb.shamt;
      trans_collected.instruction   = vif.monitor_cb.instruction;
      //$display("%b-%b",vif.monitor_cb.A,trans_collected.A);
      @(posedge vif.MONITOR.clk);
      //$display("%b-%b",vif.monitor_cb.A,trans_collected.A);
      trans_collected.B = vif.monitor_cb.B;
      trans_collected.A = vif.monitor_cb.A;
      trans_collected.PC_In = vif.monitor_cb.PC_In;
      trans_collected.PCOut = vif.monitor_cb.PCOut;
      trans_collected.mux5_out = vif.monitor_cb.mux5_out;
      @(posedge vif.MONITOR.clk);
      //$display("%b-%b",vif.monitor_cb.A,trans_collected.A);
      trans_collected.datamem_out = vif.monitor_cb.datamem_out;
      trans_collected.rd2 = vif.monitor_cb.rd2;

	  item_collected_port.write(trans_collected);
      end 
  endtask : run_phase

endclass : mem_monitor
