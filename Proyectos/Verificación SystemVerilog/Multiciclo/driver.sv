//-------------------------------------------------------------------------
//						www.verificationguide.com
//-------------------------------------------------------------------------
//gets the packet from generator and drive the transaction paket items into interface (interface is connected to DUT, so the items driven into interface signal will get driven in to DUT) 
`define DRIV_IF vif.PC_In
class driver;
  
  //used to count the number of transactions
  int no_transactions;
  
  //creating virtual interface handle
  virtual intf vif;
  
  //creating mailbox handle
  mailbox gen2driv;
  
  //constructor
  function new(virtual intf vif,mailbox gen2driv);
    //getting the interface
    this.vif = vif;
    //getting the mailbox handles from  environment 
    this.gen2driv = gen2driv;
  endfunction
  
  //Reset task, Reset the Interface signals to default/initial values
  task reset;
    wait(!vif.reset);
    $display("[ DRIVER ] ----- Reset Started -----");
    vif.rd <= 0;
    vif.rs <= 0;
    vif.rt <= 0;
    vif.addr <= 0;
    vif.funct <= 0;
    vif.JTA <= 0;
    vif.imm <= 0;
    vif.shamt <= 0;
    vif.instruction <=0;
    vif.valid <= 0;
    vif.mux2_outt<=0;
    wait(vif.reset);
    $display("[ DRIVER ] ----- Reset Ended   -----");
  endtask
  
  //drivers the transaction items to interface signals
  task main;
    begin
      @(posedge vif.clk);
      @(posedge vif.clk);
      @(posedge vif.clk);
    end
    forever begin
      transaction trans;
      gen2driv.get(trans);
      vif.valid <= 1;
      vif.rd <= trans.rd;
      vif.rs <= trans.rs;
      vif.rt <= trans.rt;
      vif.addr <= trans.addr;
      vif.funct <= trans.funct;
      vif.JTA <= trans.JTA;
      vif.imm <= trans.imm;
      vif.shamt <= trans.shamt;
      trans.PCOut = vif.PCOut;
      vif.instruction <= trans.instruction;
      @(posedge vif.clk);
      @(posedge vif.clk);
      if(trans.addr==0)begin	// R TYPE

        @(negedge vif.clk);
        trans.B = vif.B;
      	trans.A= vif.A;
        @(negedge vif.clk);


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
        @(negedge vif.clk);
        trans.datamem_out  = vif.datamem_out;
        
      end
      else if(trans.addr==43)begin//Store Word
        @(negedge vif.clk);
        trans.B = vif.B;
      	trans.A= vif.A;
        trans.datamem_out  = vif.datamem_out;
        trans.rd2=vif.rd2;
        @(negedge vif.clk);
      end
      else if(trans.addr==2)begin//J-Type
        @(negedge vif.clk);
        trans.PC_In = vif.PC_In;
        trans.PCOut = vif.PCOut;
      end
        
        
      @(posedge vif.clk);
      trans.mux5_out = vif.mux5_out;
      trans.mux2_outt=vif.mux2_outt;
      vif.valid <= 0;  
      trans.display("[ Driver ]");
      no_transactions++;
    end
  endtask
  
endclass