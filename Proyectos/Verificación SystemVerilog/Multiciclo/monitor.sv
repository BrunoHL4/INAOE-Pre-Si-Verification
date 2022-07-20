class monitor;
  
  //creating virtual interface handle
  virtual intf vif;
  
  //creating mailbox handle
  mailbox mon2scb;
  
  //constructor
  function new(virtual intf vif,mailbox mon2scb);
    //getting the interface
    this.vif = vif;
    //getting the mailbox handles from  environment 
    this.mon2scb = mon2scb;
  endfunction
  
  //Samples the interface signal and send the sample packet to scoreboard

  task main;
    forever begin
      transaction trans;
      trans = new();
      wait(vif.instruction);
      @(posedge vif.clk);
      trans.rd   = vif.rd;
      trans.rs   = vif.rs;
      trans.rt   = vif.rt;
      trans.addr   = vif.addr;
      trans.funct   = vif.funct;
      trans.JTA   = vif.JTA;
      trans.imm   = vif.imm;
      trans.shamt   = vif.shamt;

      @(posedge vif.clk);
      if(trans.addr==0)begin// R TYPE
        @(negedge vif.clk);
        trans.B = vif.B;
      	trans.A= vif.A;
        @(negedge vif.clk);
		trans.mux5_out = vif.mux5_out;
      end
      else if(trans.addr==4)begin//Beq
        
        @(negedge vif.clk);
        trans.B = vif.B;
      	trans.A= vif.A;
        trans.PCOut = vif.PCOut;
        
        
      end
      else if(trans.addr==5)begin//Bne
        @(negedge vif.clk);
        trans.B = vif.B;
      	trans.A= vif.A;
        trans.PCOut = vif.PCOut;
        trans.PC_In = vif.PC_In;
      end
      else if(trans.addr==35)begin//Load Word
        @(negedge vif.clk);
        trans.B = vif.B;
      	trans.A= vif.A;
        trans.mux5_out=vif.mux5_out;
        trans.rd2=vif.rd2;
        trans.datamem_out  = vif.datamem_out;
        @(negedge vif.clk);
        
        
      end
      else if(trans.addr==43)begin//Store Word
        @(negedge vif.clk);
        trans.B = vif.B;
      	trans.A= vif.A;
        trans.datamem_out  = vif.datamem_out;
        trans.rd2=vif.rd2;
        @(negedge vif.clk);
      end
      else if(trans.addr==2)begin	//J-Type
        @(negedge vif.clk);
        trans.PC_In = vif.PC_In;
        trans.PCOut = vif.PCOut;
      end
      
      @(posedge vif.clk);
      if(trans.addr==5||trans.addr==4)
      	trans.PC_In = vif.PC_In;
      trans.datamem_out = vif.datamem_out;
      trans.mux2_outt=vif.mux2_outt;
      trans.rd2 = vif.rd2;
      mon2scb.put(trans);
      trans.display("[ Monitor ]");
      trans.instruction   = vif.instruction;
    end
  endtask
  
endclass