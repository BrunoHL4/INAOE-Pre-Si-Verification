module ALU #(parameter M=32)
(
           input  [M-1:0] A,B,  	// ALU 32-bit Inputs                 
           input  [3:0] ALU_Sel,	// ALU Selection
           output [M-1:0] ALU_Out); // ALU 32-bit Output
	 
    reg  	[31:0] ALU_Result;
    assign 	ALU_Out = ALU_Result; // ALU out
    always @(*)
    begin
        case(ALU_Sel)
        4'b0000: 									// Addition
           ALU_Result = A + B ; 
        4'b0001: 									// Subtraction
           ALU_Result = A - B ;
        4'b0010: 								   // Multiplication
           ALU_Result = A * B;
        4'b0011: 								   // Division
           ALU_Result = A/B;
        4'b0100: 									// Logical shift left
           ALU_Result = A<<1;
        4'b0101: 									// Logical shift right
           ALU_Result = A>>1;
        4'b0110: 									//  Logical and 
           ALU_Result = A & B;
        4'b0111: 									//  Logical or
           ALU_Result = A | B;
        4'b1000: 									//  Logical xor 
           ALU_Result = A ^ B;
        4'b1001: 									//  Logical nor
           ALU_Result = ~(A | B);
        4'b1010: 									// Logical nand 
           ALU_Result = ~(A & B);
        4'b1011: 									// Logical xnor
           ALU_Result = ~(A ^ B); 
          default: ALU_Result = A + B ; 
        endcase
    end

endmodule
