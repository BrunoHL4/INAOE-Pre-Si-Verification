module InstMem
(
	input [31:0] addr,
	output reg [31:0] q
);

  reg [31:0] rom[15:0];
	// Declare the ROM variable
	//reg [31:0] rom[15:0];
	// Initialize the ROM with $readmemb.  Put the memory contents
	// in the file single_port_rom_init.txt.  Without this file,
	// this design will not compile.

	initial
	begin
      	
		$readmemb("rom_init.bin", rom);
	end

	always @ (addr)
	begin
		q = {rom[addr]};
	end
	//
endmodule