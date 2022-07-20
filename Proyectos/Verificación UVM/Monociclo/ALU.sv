module ALU
  (
    input [3:0]ALUOp,
    input [31:0]inA,inB,
    output reg Zero, 
    output reg [31:0]Result
  );
  
  always @ (ALUOp,inA,inB) begin
	case (ALUOp)
      	4'b0000: Result = inA&inB;
      
      	4'b0001: Result = inA|inB;
      
        4'b0010: Result = inA+inB;
      
      	4'b0110: 
      			 Result = inA-inB;

      	4'b0111: begin
          		if(inA<inB)
                  Result = 32'b1;
          		else
                  Result = 32'b0;	
                end
      
      	default: Result = 32'bZ;
    endcase
  	
    if(Result==0)
        Zero=1;
     else
       Zero=0;
  end
  

endmodule