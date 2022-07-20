module DataMem(
	input clk,
	input [31:0] WD,	// 32bit data input word
	input [31:0] A,		// Address for 16 locations (2**4)
	input we,			// Active high
	output [31:0] RD	// 32bit output word
);

	// Declare A bidimensional Array for the RAM
  reg [31:0] ram [0:31];
	reg [31:0] addr_buff;
	
	// RAM's don't have reset
	// The default value from each location is X
	// The write is synchronous
	
	initial
	begin
      $readmemb("ram_init.txt", ram);
	end
	
	always @(posedge clk ) begin

		 begin  
			if(we) begin
				ram[A] <= WD;
              //$display("write %0d from dir %0d",ram[A],A);
             
              $writememb("ram_init.txt", ram);
			end

		end  	
        $writememb("ram_init.txt", ram);
      //for(int i=0;i<31;i++)$display("%b",ram[i]);
	end
	
	
	// The read is synchronous As the Address
	// was buffered on the clk using Addr_buff
	assign RD = ram[A];
  	
endmodule 