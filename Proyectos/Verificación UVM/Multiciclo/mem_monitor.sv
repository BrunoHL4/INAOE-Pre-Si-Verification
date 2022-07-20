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
      wait(vif.monitor_cb.instruction);
      @(posedge vif.clk);
      trans_collected.rd   = vif.rd;
      trans_collected.rs   = vif.rs;
      trans_collected.rt   = vif.rt;
      trans_collected.addr   = vif.addr;
      trans_collected.funct   = vif.funct;
      trans_collected.JTA   = vif.JTA;
      trans_collected.imm   = vif.imm;
      trans_collected.shamt   = vif.shamt;
      if(trans_collected.addr==0)begin// R TYPE
        @(posedge vif.clk);
        @(negedge vif.clk);
        trans_collected.B = vif.B;
      	trans_collected.A = vif.A;
        @(negedge vif.clk);
        trans_collected.mux5_out = vif.mux5_out;
      end
      else if(trans_collected.addr==4)begin//Beq
        trans_collected.PCOut = vif.PCOut;
        @(posedge vif.clk);
        @(negedge vif.clk);
        trans_collected.B = vif.B;
      	trans_collected.A = vif.A;
      end
      else if(trans_collected.addr==5)begin//Bne
        trans_collected.PCOut = vif.PCOut;
        @(posedge vif.clk);
      	@(negedge vif.clk);
        trans_collected.B = vif.B;
      	trans_collected.A = vif.A;
        trans_collected.PC_In = vif.PC_In;
      end
      else if(trans_collected.addr==35)begin//Load Word
        @(posedge vif.clk);
        @(negedge vif.clk);
        trans_collected.B = vif.B;
      	trans_collected.A = vif.A;
        trans_collected.mux5_out = vif.mux5_out;
        trans_collected.rd2 = vif.rd2;
        trans_collected.datamem_out = vif.datamem_out;
        @(negedge vif.clk);
      end
      else if(trans_collected.addr==43)begin//Store Word
        @(posedge vif.clk);
        @(negedge vif.clk);
        trans_collected.B = vif.B;
      	trans_collected.A = vif.A;
        trans_collected.rd2 = vif.rd2;
        @(negedge vif.clk);
      end
      else if(trans_collected.addr==2)begin	//J-Type
        @(posedge vif.clk);
        trans_collected.PCOut = vif.PCOut;
        trans_collected.PC_In = vif.PC_In;
        @(negedge vif.clk);
      end
      @(posedge vif.clk);
      if(trans_collected.addr==4)
      	trans_collected.PC_In = vif.PC_In;
      trans_collected.datamem_out = vif.datamem_out;
      trans_collected.mux2_outt = vif.mux2_outt;
	  item_collected_port.write(trans_collected);
      end 
  endtask : run_phase

endclass : mem_monitor
