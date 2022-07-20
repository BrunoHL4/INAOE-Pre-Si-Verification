module PC (    //// WIDTH=#INSTRUCTIONS 
	input [31:0] DataIn, //pc+4
	input clk,    // Clock
	input rst, // reset
	output reg [31:0] DataOut
);
      always @ (posedge clk ) begin   
           if(~rst) begin  
             	DataOut=32'h000000;
             end  
           else begin  
           		DataOut=DataIn;
           end  
      end 
endmodule 