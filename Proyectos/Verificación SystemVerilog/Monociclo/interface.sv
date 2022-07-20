//-------------------------------------------------------------------------
//						www.verificationguide.com
//-------------------------------------------------------------------------
interface mem_intf(input logic clk,reset);
  
  //declaring the signals
  logic [31:0] addr;
  logic wr_en;
  logic rd_en;
  logic [31:0] wdata;
  logic [31:0] rdata;
  logic [31:0] rdata2;
  
  
  //driver clocking block
  clocking driver_cb @(posedge clk);
    default input #1 output #1;
    output addr;
    output wr_en;
    output rd_en;
    output wdata;
    input  rdata;
    input rdata2;
  endclocking
  
  //monitor clocking block
  clocking monitor_cb @(posedge clk);
    default input #1 output #1;
    input addr;
    input wr_en;
    input rd_en;
    input wdata;
    input rdata;  
    input rdata2; 
  endclocking
  
  //driver modport
  modport DRIVER  (clocking driver_cb,input clk,reset);
  
  //monitor modport  
    modport MONITOR (clocking monitor_cb,input clk,reset);
  
endinterface