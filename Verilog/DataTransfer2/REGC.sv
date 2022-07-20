module REGC(
	input clk,
	input rst,
	input enable,
  input [7:0] D,
  output [7: 0] Q
);

  reg  [3:0] Reg_Q;


assign Q = Reg_Q;

always@(posedge clk or negedge rst) begin
  if(rst == 1'b1) 
		Reg_Q <= 0;
	else 
      if(enable == 1'b1)
			Reg_Q <= D;
end

endmodule