module Imem #(parameter M = 32)
(
	input  [6:0] addr,
	output [M-1:0] RD);
		
		
	reg [M-1:0]mem[0:M-1];
	
	initial 
      $readmemb("Imem.dat", mem);
	
	assign RD = mem[addr];

endmodule
