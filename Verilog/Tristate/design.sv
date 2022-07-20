module BHL(
  
 // input clk,rst,
  input OEA,
  input reg [3:0] QA,
  output reg [7:0] ABus
 
  
);



  tristate U1 (OEA,QA,ABus);



endmodule




//Cuando OEA=1, envía Z, caundo es 0 envía el input