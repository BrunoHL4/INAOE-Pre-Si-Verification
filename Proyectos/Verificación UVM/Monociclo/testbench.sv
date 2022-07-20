//-------------------------------------------------------------------------
//				www.verificationguide.com   testbench.sv
//-------------------------------------------------------------------------
//---------------------------------------------------------------
//including interfcae and testcase files
`include "mem_interface.sv"
`include "mem_base_test.sv"
`include "mem_wr_rd_test.sv"

//---------------------------------------------------------------

module tbench_top;

  //---------------------------------------
  //clock and reset signal declaration
  //---------------------------------------
  bit clk;
  bit reset;
  
  //---------------------------------------
  //clock generation
  //---------------------------------------
  always #5 clk = ~clk;
  
  //---------------------------------------
  //reset Generation
  //---------------------------------------
  initial begin
    reset = 1;
    #5 reset =0;
  end
  
  //---------------------------------------
  //interface instance
  //---------------------------------------
  mem_if intf(clk,reset);
  
  //---------------------------------------
  //DUT instance
  //---------------------------------------
  Mips_machine DUT (
    .clk(intf.clk),
    .rst(intf.reset),
    .InstMem_Out(intf.InstMem_Out),
    .mux5_out(intf.mux5_out),
    .PC_In(intf.PC_In),
    .PCOut(intf.PCOut),
    .A(intf.A),
    .B(intf.B),
    .rd2(intf.rd2),
    .datamem_out(intf.datamem_out)
    
   );
  
  //---------------------------------------
  //passing the interface handle to lower heirarchy using set method 
  //and enabling the wave dump
  //---------------------------------------
  initial begin 
    uvm_config_db#(virtual mem_if)::set(uvm_root::get(),"*","vif",intf);
    //enable wave dump
    $dumpfile("dump.vcd"); 
    $dumpvars;
  end
  
  //---------------------------------------
  //calling test
  //---------------------------------------
  initial begin 
    run_test();
  end
  
endmodule