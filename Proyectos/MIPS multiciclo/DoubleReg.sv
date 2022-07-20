// Code your design here
module DoubleReg (    //// WIDTH=#INSTRUCTIONS 
  input [31:0] DataIn1,DataIn2,
  input clk,reset,    // Clock
  output reg [31:0] DataOut1,DataOut2
);
  always @ (posedge clk) begin 
    
    if(reset == 1'b0) begin
      DataOut1 <= 32'b0;
        DataOut2 <= 32'b0;
    end
    else begin
          
              DataOut1=DataIn1;
            DataOut2=DataIn2;
        end
           
      end 
endmodule 