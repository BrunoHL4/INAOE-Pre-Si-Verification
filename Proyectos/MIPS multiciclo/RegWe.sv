
////////////////////////////////////////////////////////////////////////////////
// Description - 32-Bit program counter (PC) register.
////////////////////////////////////////////////////////////////////////////////

module RegWe (PCNext, PCResult, reset, clk,PCWrite);
  
    input               reset;                  // Reset: 1-Bit input control signal.
    input               clk;                    // Clk: 1-Bit input clock signal.
    input               PCWrite;                // PCWrite: 1-Bit input write enable.
  
    input       [31:0]  PCNext;                 // Address: 32-Bit address input port.

    output reg  [31:0]  PCResult;               // PCResult: 32-Bit registered output port.

  
    always @(posedge clk)
    begin
      
      if (!reset)PCResult <= 32'h00000000;           // INITIALIZE OUTPUT IN ZERO

      else if (PCWrite)PCResult <= PCNext;             // ASSIGN THE INPUT VALUE TO OUTPUT

    end

endmodule