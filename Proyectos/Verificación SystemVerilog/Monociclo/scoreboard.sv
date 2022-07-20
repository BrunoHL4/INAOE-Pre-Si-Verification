//-------------------------------------------------------------------------
//						www.verificationguide.com
//-------------------------------------------------------------------------
//gets the packet from monitor, Generated the expected result and compares with the //actual result recived from Monitor

class scoreboard;
   
  //creating mailbox handle
  mailbox mon2scb;
  
  //used to count the number of transactions
  int no_transactions;
  
  //array to use as local memory
  bit [31:0] mem[4];
  
  //constructor
  function new(mailbox mon2scb);
    //getting the mailbox handles from  environment 
    this.mon2scb = mon2scb;
    foreach(mem[i]) mem[i] = 8'hFF;
  endfunction
  
  //stores wdata and compare rdata with stored data
  task main;
    transaction trans;
    forever begin
      #140;
      mon2scb.get(trans);
      if(trans.rd_en) begin
        $display("File Register port 1: ");
        if(mem[trans.addr] != trans.rdata) 
          $error("[SCB-FAIL] Addr = %h,\n \t   Data :: Expected = %h Actual = %h",trans.addr,mem[trans.addr],trans.rdata);
        else 
          $display("[SCB-PASS] Addr = %h,\n \t   Data :: Expected = %h Actual = %0h",trans.addr,mem[trans.addr],trans.rdata);
        $display("----------------------------------------------------");
        
        $display("File Register port 2: ");
        if(mem[trans.addr] != trans.rdata2) 
          $error("[SCB-FAIL] Addr = %h,\n \t   Data :: Expected = %h Actual = %h",trans.addr,mem[trans.addr],trans.rdata2);
        else 
          $display("[SCB-PASS] Addr = %h,\n \t   Data :: Expected = %h Actual = %0h",trans.addr,mem[trans.addr],trans.rdata2);
        $display("----------------------------------------------------");
      end
      else if(trans.wr_en)
        mem[trans.addr] = trans.wdata;
      

      no_transactions++;
    end
  endtask
  
endclass