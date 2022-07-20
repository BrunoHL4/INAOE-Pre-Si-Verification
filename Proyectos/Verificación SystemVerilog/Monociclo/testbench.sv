//-------------------------------------------------------------------------
//				www.verificationguide.com   testbench.sv
//-------------------------------------------------------------------------
//tbench_top or testbench top, this is the top most file, in which DUT(Design Under Test) and Verification environment are connected. 
//-------------------------------------------------------------------------

//including interfcae and testcase files
`include "interface.sv"

//-------------------------[NOTE]---------------------------------
//Particular testcase can be run by uncommenting, and commenting the rest
//`include "random_test.sv"
`include "wr_rd_test.sv"
//`include "default_rd_test.sv"
//----------------------------------------------------------------


module tbench_top;
  
  //clock and reset signal declaration
  bit clk;
  bit reset;
  
  //clock generation
  always #5 clk = ~clk;
  
  //reset Generation
  initial begin
    reset = 1;
    #5 reset =0;
  end
  
  
  //creatinng instance of interface, inorder to connect DUT and testcase
  mem_intf intf(clk,reset);
  
  //Testcase instance, interface handle is passed to test as an argument
  test t1(intf);
  
  //DUT instance, interface signals are connected to the DUT ports
 RegFile DUT (
    .clk(intf.clk),
    //.reset(intf.reset),
    .FR_Waddr(intf.addr),
   .FR_RAddr_1(intf.addr),
   .FR_RAddr_2(intf.addr),
   
    .FR_WE(intf.wr_en),
    //.rd_en(intf.rd_en),
    .FR_Wdata(intf.wdata),
   .FR_Rdata_1(intf.rdata),
   .FR_Rdata_2(intf.rdata2)
   );
  
  //enabling the wave dump
  initial begin 
    $dumpfile("dump.vcd"); $dumpvars;
  end
endmodule