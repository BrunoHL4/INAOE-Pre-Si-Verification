// Code your design here
module SimpleReg (    //// WIDTH=#INSTRUCTIONS 
	input [31:0] DataIn, 
	input clk,reset,    // Clock
	output reg [31:0] DataOut
);
  always @ (posedge clk) begin   
        	if(reset == 1'b0) 
			DataOut <= 32'b0;
		else 
			DataOut=DataIn;
         
           
      end 
endmodule 