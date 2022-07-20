module Adder (  ////WIDTH=#INSTRUCTIONS
	input [31:0]SrcA,    // Clock 
	input [31:0]SrcB, // Clock Enable
	output reg [31:0] Result  // PC+4
);

 always @ ( SrcA or SrcB)
 begin
     Result = SrcA + SrcB;
 end

endmodule 