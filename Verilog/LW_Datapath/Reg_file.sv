module Reg_file #(parameter M = 32, N = 5)

(	input clk,we_fr,
	input [N-1:0] ra1, ra2, wa_fr,
	input [M-1:0] wd_fr,
	output[M-1:0] rd1, rd2);
	
  reg [M-1:0] reg_file [0:M-1];
	
	always @(posedge clk)
		begin
          $readmemb("Reg_file.dat", reg_file);
		
		if(we_fr) 
  			reg_file[ra2] <= wd_fr;
          $writememb("Reg_file.dat", reg_file);
		end
		
	assign rd1 = (ra1 != 1'b0) ? reg_file[ra1] : 1'b0;
	assign rd2 = (ra2 != 1'b0) ? reg_file[ra2] : 1'b0;
	
endmodule