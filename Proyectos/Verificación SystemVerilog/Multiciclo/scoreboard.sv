//-------------------------------------------------------------------------
//            www.verificationguide.com
//-------------------------------------------------------------------------
//gets the packet from monitor, Generated the expected result and compares with the //actual result recived from Monitor

class scoreboard;
  
  int countR,countI,countJ,errorR,errorI,errorJ,succR,succI,succJ;
   
  //creating mailbox handle
  
  mailbox mon2scb;
  
  //used to count the number of transactions
  int no_transactions;
  
  //constructor
  function new(mailbox mon2scb);
    //getting the mailbox handles from  environment 
    this.mon2scb = mon2scb;
  endfunction
  
  //Compares the Actual result with the expected result
  task main;
    transaction trans;
    forever begin
      mon2scb.get(trans);
      //$display("------------------------------------------");
      trans.display("[ Scoreboard ]");
      case (trans.addr)
        
      0: begin 											//R TYPE
        countR=countR+1;
        case (trans.funct)  
          
          32:begin											// add
            $display("Operation: add");
            if((trans.A+trans.B) == trans.mux5_out)begin
              $display("- [ Test passed ]");
              $display("Result is as Expected\n %0d + %0d = %0d",trans.A,trans.B,trans.mux5_out);
            end
            else begin
              $error("Wrong Result.\n\t%0d + %0d\n\tExpeced: %0d Actual: %0d",trans.A,trans.B,(trans.A+trans.B),trans.mux5_out);
            	errorR=errorR+1;
            end
             end
          
          34:begin											// sub
            $display("Operation: sub");
            if((trans.A-trans.B) == trans.mux5_out)begin
              if(trans.A>trans.B)begin
              	$display("- [ Test passed ]");
           	    $display("Result is as Expected\n %0d - %0d = %0d",trans.A,trans.B,trans.mux5_out);
              end
              else begin
                $display("- [ Test passed ]");
                $display("Result is as Expected\n%b - \n%b = \n%b",trans.A,trans.B,trans.mux5_out);
              end
            end
            else 
              if(trans.A>trans.B)begin
              $error("Wrong Result.\n\t%0d - %0d\n\tExpeced: %0d Actual: %0d",trans.A,trans.B,(trans.A-trans.B),trans.mux5_out);
                errorR=errorR+1;
              end
            else begin
              $error("Wrong Result.\n\t%32b - %32b\n\tExpeced: %32b Actual: %32b",trans.A,trans.B,(trans.A-trans.B),trans.mux5_out);
              errorR=errorR+1;
              
            end
             end
          
          36:begin											// and
            $display("Operation: and");
            if((trans.A&trans.B) == trans.mux5_out)begin
              $display("- [ Test passed ]");
              $display("Result is as Expected %32b &\n\t\t\t%32b =\n\t\t\t%32b",trans.A,trans.B,trans.mux5_out);
            end
            else 
              begin
              $error("Wrong Result.\n\t%32b & %32b\n\tExpeced: %0b Actual: %0b",trans.A,trans.B,(trans.A&trans.B),trans.mux5_out);
            errorR=errorR+1;
              end
             end
          
          37:begin											// or
            $display("Operation: or");
            if((trans.A|trans.B) == trans.mux5_out)begin
              $display("- [ Test passed ]");
              $display("Result is as Expected %32b |\n\t\t\t%32b =\n\t\t\t%32b",trans.A,trans.B,trans.mux5_out);
            end
            else begin
              $error("Wrong Result.\n\t%32b | %32b\n\tExpeced: %0b Actual: %0b",trans.A,trans.B,(trans.A|trans.B),trans.mux5_out);
              errorR=errorR+1;
            end
             end
          
          42:begin											// set less than
            $display("Operation: slt");
            if((trans.A<trans.B) == trans.mux5_out)begin
              $display("- [ Test passed ]");
              $display("Result is as Expected %0d < %0d = %0b",trans.A,trans.B,trans.mux5_out);
            end
            else begin
              $error("Wrong Result.\n\t%0d < %0d\n\tExpeced: %0d Actual: %0d",trans.A,trans.B,(trans.A<trans.B),trans.mux5_out);
           	  errorR=errorR+1;
            end
             end
          default: begin
            $error("invalid Rtype option");
            errorR=errorR+1;
          end
        endcase
        no_transactions++;

    end
        
    2:begin
      $display("JUMP INSTRUCTION");									//J TYPE
      countJ=countJ+1;
      if (trans.PC_In==trans.JTA)begin
        $display("- [ Test passed ]");
        $display("Result is as Expected\nJTA = %0d PC = %0d",trans.JTA,trans.PC_In);
      end
      else begin
        $error("Wrong Result.\n\t PC Expeced: %0d PC Actual: %0d",trans.JTA,trans.PC_In);
      	errorJ=errorJ+1;
      end
	no_transactions++;
    end
        
    4:begin 											//BEQ
      $display("BEQ INSTRUCTION");
      countI=countI+1;
      if(trans.A==trans.B)begin
        $display("%h = %h",trans.A,trans.B);
        if(trans.PC_In==trans.imm+trans.PCOut+1)begin
          $display("- [ Test passed ]");
          $display("Result is as Expected \nPCIn:    %h\nPCOut:   %h\nimm:     %h",trans.PC_In,trans.PCOut,trans.imm);
        end
        else 
          begin
          	$error("Wrong Result.\nPCIn:    %0d\nPCOut:   %0d\nimm:     %0d\n\tPC Expeced: %0d PC Actual: %0d",trans.PC_In,trans.PCOut,trans.imm,(trans.imm+trans.PCOut+1),trans.PC_In);
        	errorI=errorI+1;
          end
      end
      else if (trans.PC_In==trans.PCOut+1)begin
        $display("%h != %h",trans.A,trans.B);
        $display("- [ Test passed ]");
        $display("Result is as Expected \nPC In:   %h\nPC Out:  %h",trans.PC_In,trans.PCOut);
      end
      else begin
        $display("%h != %h",trans.A,trans.B);
        $error("Wrong Result.\nPCIn:    %0d\nPCOut:   %0d\n\tPC Expeced: %0d PC Actual: %0d",trans.PC_In,trans.PCOut,(trans.PCOut+1),trans.PC_In);
        errorI=errorI+1;
      end
      no_transactions++;

    end
    
    5:begin 											//BNE
      $display("BNE INSTRUCTION");
      countI=countI+1;
      if(trans.A!=trans.B)begin
        $display("%h != %h",trans.A,trans.B);
        if(trans.PC_In==trans.imm+trans.PCOut+1)begin
          $display("- [ Test passed ]");
          $display("Result is as Expected \nPCIn:    %h\nPCOut:   %h\nimm:     %h",trans.PC_In,trans.PCOut,trans.imm);
        end
        else begin
          $error("Wrong Result.\nPCIn:    %0d\nPCOut:   %0d\nimm:     %0d\n\tPC Expeced: %0d PC Actual: %0d",trans.PC_In,trans.PCOut,trans.imm,(trans.imm+trans.PCOut+1),trans.PC_In);
        	errorI=errorI+1;
        end
      end
      else if (trans.PC_In==trans.PCOut+1)begin
        $display("%h == %h",trans.A,trans.B);
        $display("- [ Test passed ]");
        $display("Result is as Expected \nPC In:   %h\nPC Out:  %h",trans.PC_In,trans.PCOut);
      end
      else begin
        $error("Wrong Result.\nPCIn:    %0d\nPCOut:   %0d\n\tPC Expeced: %0d PC Actual: %0d",trans.PC_In,trans.PCOut,(trans.PCOut+1),trans.PC_In);
        errorI=errorI+1;
      end
      no_transactions++;

    end
    
    35:begin 											//LW
      $display("LW INSTRUCTION");
      countI=countI+1;
      if(trans.mux2_outt==trans.datamem_out)begin
        $display("- [ Test passed ]");
        $display("Result is as Expected \nDataMem:        %0d  \nRegMem address: %0d  \nRegMem  Data:   %0d ",trans.datamem_out,trans.rt,trans.mux2_outt);
      end
      else begin
        $error("Wrong Result.\n\tAddress: %b\n\tExpeced: %0d Actual: %0d",trans.rt,trans.datamem_out,trans.mux2_outt);
        errorI=errorI+1;
      end
      no_transactions++;
    end
    
    43:begin 											//SW
      $display("SW INSTRUCTION");
      countI=countI+1;
      if(trans.datamem_out==trans.rd2)begin
        $display("- [ Test passed ]");
        $display("Result is as Expected \nRegister: %0d \nData Reg: %0d  \nData Mem: %0d",trans.rt,trans.rd2,trans.datamem_out);
      end
      else begin
        $error("Wrong Result.\n\tAddress: %b\n\tExpeced: %0d \n\tActual: %0d",trans.rt,trans.rd2,trans.datamem_out);
        errorI=errorI+1;
      end
    end
    default: $error("invalid option");
    endcase
      $display("------------------------------------------");
      succR=(((countR-errorR)*100)/countR);
      succI=(((countI-errorI)*100)/countI);
      succJ=(((countJ-errorJ)*100)/countJ);
    
    end
    
  endtask
  task count;
    $display ("RESUME");
    $display("R types Functions generated:",countR);
    $display("I types Functions generated:",countI);
    $display("J types Functions generated:",countJ);
    $display ("\nERRORS");
    $display("R types Functions errors:",errorR);
    $display("I types Functions errors:",errorI);
    $display("J types Functions errors:",errorJ);
    $display ("\nSUCCESFUL");
    $display("R types Functions succeful:",succR,"%%");
    $display("I types Functions succeful:",succI,"%%");
    $display("J types Functions succeful:",succJ,"%%");
    $display ("-----VERIFICATION COMPLITED-----");
   endtask 
endclass