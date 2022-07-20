//-------------------------------------------------------------------------
//						mem_scoreboard - www.verificationguide.com 
//-------------------------------------------------------------------------

class mem_scoreboard extends uvm_scoreboard;
  
  //---------------------------------------
  // declaring pkt_qu to store the pkt's recived from monitor
  //---------------------------------------
  mem_seq_item pkt_qu[$];
  
  //---------------------------------------
  // sc_mem 
  //---------------------------------------
  //bit [7:0] sc_mem [4];

  //---------------------------------------
  //port to recive packets from monitor
  //---------------------------------------
  uvm_analysis_imp#(mem_seq_item, mem_scoreboard) item_collected_export;
  `uvm_component_utils(mem_scoreboard)

  //---------------------------------------
  // new - constructor
  //---------------------------------------
  function new (string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new
  //---------------------------------------
  // build_phase - create port and initialize local memory
  //---------------------------------------
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
      item_collected_export = new("item_collected_export", this);
      //foreach(sc_mem[i]) sc_mem[i] = 8'hFF;
  endfunction: build_phase
  
  //---------------------------------------
  // write task - recives the pkt from monitor and pushes into queue
  //---------------------------------------
  virtual function void write(mem_seq_item pkt);
    //pkt.print();
    pkt_qu.push_back(pkt);
  endfunction : write

  //---------------------------------------
  // run_phase - compare's the read data with the expected data(stored in local memory)
  // local memory will be updated on the write operation.
  //---------------------------------------
  virtual task run_phase(uvm_phase phase);
    mem_seq_item mem_pkt;
    
    forever begin
      wait(pkt_qu.size() > 0);
      mem_pkt = pkt_qu.pop_front();
      case (mem_pkt.addr)
        
      0: begin 											//R TYPE
        //countR=countR+1;
        //$display("R TYPE");
        case (mem_pkt.funct)  
          
          32:begin											// add
            `uvm_info(get_type_name(),$sformatf("------ :: ADD INSTRUCTION  :: ------"),UVM_LOW)
            if((mem_pkt.A+mem_pkt.B) == mem_pkt.mux5_out)begin
              
              `uvm_info(get_type_name(),$sformatf("- [ Test passed ]"),UVM_LOW)
              `uvm_info(get_type_name(),$sformatf("Result is as Expected\n %0d + %0d = %0d",mem_pkt.A,mem_pkt.B,mem_pkt.mux5_out),UVM_LOW)              
              `uvm_info(get_type_name(),"------------------------------------",UVM_LOW)
            end
            else begin
              `uvm_error(get_type_name(),"------ :: Wrong Result :: ------")
              `uvm_info(get_type_name(),$sformatf("%0d + %0d\n\tExpeced: %0d Actual: %0d",mem_pkt.A,mem_pkt.B,(mem_pkt.A+mem_pkt.B),mem_pkt.mux5_out),UVM_LOW)
            	//errorR=errorR+1;
            end
             end
          
          34:begin											// sub
            `uvm_info(get_type_name(),$sformatf("------ :: SUB INSTRUCTION  :: ------"),UVM_LOW)
            if((mem_pkt.A-mem_pkt.B) == mem_pkt.mux5_out)begin
              if(mem_pkt.A>mem_pkt.B)begin
              `uvm_info(get_type_name(),$sformatf("- [ Test passed ]"),UVM_LOW)
                `uvm_info(get_type_name(),$sformatf("Result is as Expected\n %0d - %0d = %0d",mem_pkt.A,mem_pkt.B,mem_pkt.mux5_out),UVM_LOW)              
              end
              else begin
              `uvm_info(get_type_name(),$sformatf("- [ Test passed ]"),UVM_LOW)
                `uvm_info(get_type_name(),$sformatf("Result is as Expected\n %0b - %0b = %0b",mem_pkt.A,mem_pkt.B,mem_pkt.mux5_out),UVM_LOW)              
              end
            end
            else 
              if(mem_pkt.A>mem_pkt.B)begin
              `uvm_error(get_type_name(),"------ :: Wrong Result :: ------")
                `uvm_info(get_type_name(),$sformatf("%0d - %0d\n\tExpeced: %0d Actual: %0d",mem_pkt.A,mem_pkt.B,(mem_pkt.A-mem_pkt.B),mem_pkt.mux5_out),UVM_LOW)
                //errorR=errorR+1;
              end
            else begin
              `uvm_info(get_type_name(),$sformatf("%32b - %32b\n\tExpeced: %0d Actual: %0d",mem_pkt.A,mem_pkt.B,(mem_pkt.A-mem_pkt.B),mem_pkt.mux5_out),UVM_LOW)
              //errorR=errorR+1;
              
            end
             end
          
          36:begin											// and
            `uvm_info(get_type_name(),$sformatf("------ :: AND INSTRUCTION  :: ------"),UVM_LOW)
            if((mem_pkt.A&mem_pkt.B) == mem_pkt.mux5_out)begin
              `uvm_info(get_type_name(),$sformatf("- [ Test passed ]"),UVM_LOW)
              `uvm_info(get_type_name(),$sformatf("Result is as Expected\n %b & %b = %b",mem_pkt.A,mem_pkt.B,mem_pkt.mux5_out),UVM_LOW)              
            end
            else 
              begin
              `uvm_error(get_type_name(),"------ :: Wrong Result :: ------")
                `uvm_info(get_type_name(),$sformatf("%b & %b\n\tExpeced: %b Actual: %b",mem_pkt.A,mem_pkt.B,(mem_pkt.A&mem_pkt.B),mem_pkt.mux5_out),UVM_LOW)
            //errorR=errorR+1;
              end
             end
          
          37:begin											// or
            `uvm_info(get_type_name(),$sformatf("------ :: OR INSTRUCTION  :: ------"),UVM_LOW)
            if((mem_pkt.A|mem_pkt.B) == mem_pkt.mux5_out)begin
              `uvm_info(get_type_name(),$sformatf("- [ Test passed ]"),UVM_LOW)
              `uvm_info(get_type_name(),$sformatf("Result is as Expected\n %b | %b = %b",mem_pkt.A,mem_pkt.B,mem_pkt.mux5_out),UVM_LOW)              
            end
            else begin
              `uvm_error(get_type_name(),"------ :: Wrong Result :: ------")
              `uvm_info(get_type_name(),$sformatf("%b | %b\n\tExpeced: %b Actual: %b",mem_pkt.A,mem_pkt.B,(mem_pkt.A|mem_pkt.B),mem_pkt.mux5_out),UVM_LOW)             
              //errorR=errorR+1;
            end
             end
          
          42:begin											// set less than
            `uvm_info(get_type_name(),$sformatf("------ :: SLT INSTRUCTION  :: ------"),UVM_LOW)
            if((mem_pkt.A<mem_pkt.B) == mem_pkt.mux5_out)begin
              `uvm_info(get_type_name(),$sformatf("- [ Test passed ]"),UVM_LOW)
              `uvm_info(get_type_name(),$sformatf("Result is as Expected\n %0b < %0b = %0d",mem_pkt.A,mem_pkt.B,mem_pkt.mux5_out),UVM_LOW)              
            end
            else begin
			  `uvm_error(get_type_name(),"------ :: Wrong Result :: ------")
              `uvm_info(get_type_name(),$sformatf("%0d < %0d\n\tExpeced: %0d Actual: %0d",mem_pkt.A,mem_pkt.B,(mem_pkt.A<mem_pkt.B),mem_pkt.mux5_out),UVM_LOW)   
              //errorR=errorR+1;
            end
             end
          default: begin
            //`uvm_error(get_type_name(),"------ :: Invalid Rtype Option :: ------")
            //errorR=errorR+1;
          end
        endcase
        //no_transactions++;

    end
        
    2:begin														//J TYPE
      `uvm_info(get_type_name(),$sformatf("------ :: JUMP INSTRUCTION  :: ------"),UVM_LOW)
      //countJ=countJ+1;
      if (mem_pkt.PC_In==mem_pkt.JTA)begin
        `uvm_info(get_type_name(),$sformatf("- [ Test passed ]"),UVM_LOW)
        `uvm_info(get_type_name(),$sformatf("PC Expeced: %0d PC Actual: %0d",mem_pkt.JTA,mem_pkt.PC_In),UVM_LOW)
      end
      else begin
        `uvm_error(get_type_name(),"------ :: Wrong Result :: ------")
        `uvm_info(get_type_name(),$sformatf("PC Expeced: %0d PC Actual: %0d",mem_pkt.JTA,mem_pkt.PC_In),UVM_LOW)
      	//errorJ=errorJ+1;
      end
	//no_transactions++;
    end
        
    4:begin 											//BEQ
      `uvm_info(get_type_name(),$sformatf("------ :: BEQ INSTRUCTION  :: ------"),UVM_LOW)
      //countI=countI+1;
      if(mem_pkt.A==mem_pkt.B)begin
        `uvm_info(get_type_name(),$sformatf("%h = %h",mem_pkt.A,mem_pkt.B),UVM_LOW)
        if(mem_pkt.PC_In==mem_pkt.imm+mem_pkt.PCOut+1)begin
          `uvm_info(get_type_name(),$sformatf("- [ Test passed ]"),UVM_LOW)
          `uvm_info(get_type_name(),$sformatf("Result is as Expected \nPCIn:    %h\nPCOut:   %h\nimm:     %h",mem_pkt.PC_In,mem_pkt.PCOut,mem_pkt.imm),UVM_LOW)

        end
        else 
          begin
            `uvm_error(get_type_name(),"------ :: Wrong Result :: ------")
            `uvm_info(get_type_name(),$sformatf("Wrong Result.\nPCIn:    %0d\nPCOut:   %0dimm:     %0dPC Expeced: %0d PC Actual: %0d",mem_pkt.PC_In,mem_pkt.PCOut,mem_pkt.imm,(mem_pkt.imm+mem_pkt.PCOut+1),mem_pkt.PC_In),UVM_LOW) 
        	//errorI=errorI+1;
        	//errorI=errorI+1;
          end
      end
      else if (mem_pkt.PC_In==mem_pkt.PCOut+1)begin
        `uvm_info(get_type_name(),$sformatf("%h !=  %h",mem_pkt.A,mem_pkt.B),UVM_LOW)              
        `uvm_info(get_type_name(),$sformatf("- [ Test passed ]"),UVM_LOW)
        `uvm_info(get_type_name(),$sformatf("Result is as Expected \nPC In:   %h\nPC Out:  %h",mem_pkt.PC_In,mem_pkt.PCOut),UVM_LOW)
      end
      else begin
        `uvm_info(get_type_name(),$sformatf("%h !=  %h",mem_pkt.A,mem_pkt.B),UVM_LOW)
        `uvm_error(get_type_name(),"------ :: Wrong Result :: ------")
        `uvm_info(get_type_name(),$sformatf("PCIn:    %0d\nPCOut:   %0d\n\tPC Expeced: %0d PC Actual: %0d",mem_pkt.PC_In,mem_pkt.PCOut,(mem_pkt.PCOut+1),mem_pkt.PC_In),UVM_LOW)  
        //errorI=errorI+1;
      end
      //no_transactions++;

    end
    
    5:begin 											//BNE
      `uvm_info(get_type_name(),$sformatf("------ :: BNE INSTRUCTION  :: ------"),UVM_LOW)
      //countI=countI+1;
      if(mem_pkt.A!=mem_pkt.B)begin
        `uvm_info(get_type_name(),$sformatf("%h !=  %h",mem_pkt.A,mem_pkt.B),UVM_LOW)              
        if(mem_pkt.PC_In==mem_pkt.imm+mem_pkt.PCOut+1)begin
          `uvm_info(get_type_name(),$sformatf("- [ Test passed ]"),UVM_LOW)
          `uvm_info(get_type_name(),$sformatf("Result is as Expected \nPCIn:    %h\nPCOut:   %h\nimm:     %h",mem_pkt.PC_In,mem_pkt.PCOut,mem_pkt.imm),UVM_LOW)              
        end
        else begin
          `uvm_error(get_type_name(),"------ :: Wrong Result :: ------")
          `uvm_info(get_type_name(),$sformatf("PCIn:    %0d\nPCOut:   %0d\nimm:     %0d\n\tPC Expeced: %0d PC Actual: %0d",mem_pkt.PC_In,mem_pkt.PCOut,mem_pkt.imm,(mem_pkt.imm+mem_pkt.PCOut+1),mem_pkt.PC_In),UVM_LOW)  
        	//errorI=errorI+1;
        end
      end
      else if (mem_pkt.PC_In==mem_pkt.PCOut+1)begin
        `uvm_info(get_type_name(),$sformatf("%h == %h",mem_pkt.A,mem_pkt.B),UVM_LOW)              
        `uvm_info(get_type_name(),$sformatf("- [ Test passed ]"),UVM_LOW)
        `uvm_info(get_type_name(),$sformatf("Result is as Expected \nPC In:   %h\nPC Out:  %h",mem_pkt.PC_In,mem_pkt.PCOut),UVM_LOW)
      end
      else begin
        `uvm_error(get_type_name(),"------ :: Wrong Result :: ------")
        `uvm_info(get_type_name(),$sformatf("PCIn:    %0d\nPCOut:   %0d\n\tPC Expeced: %0d PC Actual: %0d",mem_pkt.PC_In,mem_pkt.PCOut,(mem_pkt.PCOut+1),mem_pkt.PC_In),UVM_LOW)  
        //errorI=errorI+1;
      end
      //no_transactions++;

    end
    
    35:begin 											//LW
      `uvm_info(get_type_name(),$sformatf("------ :: LW INSTRUCTION  :: ------"),UVM_LOW)
      //countI=countI+1;
      if(mem_pkt.mux2_outt==mem_pkt.datamem_out)begin
        `uvm_info(get_type_name(),$sformatf("- [ Test passed ]"),UVM_LOW)
        `uvm_info(get_type_name(),$sformatf("Result is as Expected \nDataMem:        %0d  \nRegMem address: %0d  \nRegMem  Data:   %0d",mem_pkt.datamem_out,mem_pkt.rt,mem_pkt.mux2_outt),UVM_LOW)

      end
      else begin
        `uvm_error(get_type_name(),"------ :: Wrong Result :: ------")
        `uvm_info(get_type_name(),$sformatf("Wrong Result.\n\tAddress: %b\n\tExpeced: %0d \n\tActual: %0d",mem_pkt.rt,mem_pkt.datamem_out,mem_pkt.mux2_outt),UVM_LOW)  
        //errorI=errorI+1;
      end
      //no_transactions++;
    end
    
    43:begin 											//SW
      `uvm_info(get_type_name(),$sformatf("------ :: SW INSTRUCTION  :: ------"),UVM_LOW)
      //countI=countI+1;
      if(mem_pkt.datamem_out==mem_pkt.rd2)begin
        `uvm_info(get_type_name(),$sformatf("- [ Test passed ]"),UVM_LOW)
        `uvm_info(get_type_name(),$sformatf("Result is as Expected \nRegister: %0d \nData Reg: %0d  \nData Mem: %0d",mem_pkt.rt,mem_pkt.rd2,mem_pkt.datamem_out),UVM_LOW)
      end
      else begin
		`uvm_error(get_type_name(),"------ :: Wrong Result :: ------")
        `uvm_info(get_type_name(),$sformatf("Wrong Result.\n\tAddress: %b\n\tExpeced: %0d \n\tActual: %0d",mem_pkt.rt,mem_pkt.rd2,mem_pkt.datamem_out),UVM_LOW)           
        //errorI=errorI+1;
      end
    end
    default: $error("invalid option");
    endcase

    end
  endtask : run_phase
endclass : mem_scoreboard