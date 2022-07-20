module ALU_control(input [5:0]funct,
                   input [1:0]ALUOp,
                   output [3:0]ALUci);
 
  assign ALUci[3]=1'b0;
  
  assign ALUci[2]=~ALUOp[1]&ALUOp[0] | ALUOp[1]&~ALUOp[0]&funct[5]&~funct[4]&~funct[3]&~funct[2]&funct[1]&~funct[0] | ALUOp[1]&~ALUOp[0]&funct[5]&~funct[4]&funct[3]&~funct[2]&funct[1]&~funct[0];
  
  
  assign ALUci[1]=~ALUOp[1]&~ALUOp[0] | ~ALUOp[1]&ALUOp[0] | ALUOp[1]&~ALUOp[0]&funct[5]&~funct[4]&~funct[3]&~funct[2]&~funct[1]&~funct[0] | ALUOp[1]&~ALUOp[0]&funct[5]&~funct[4]&~funct[3]&~funct[2]&funct[1]&~funct[0] | ALUOp[1]&~ALUOp[0]&funct[5]&~funct[4]&funct[3]&~funct[2]&funct[1]&~funct[0];
  
  assign ALUci[0]=ALUOp[1]&~ALUOp[0]&funct[5]&~funct[4]&~funct[3]&funct[2]&~funct[1]&funct[0] | ALUOp[1]&~ALUOp[0]&funct[5]&~funct[4]&funct[3]&~funct[2]&funct[1]&~funct[0];
  
  
endmodule