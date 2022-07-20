module ALU(result,a,b,opcode,en);
    output [7:0]result;
    input [3:0]a,b;
  input [2:0]opcode;
  input en;
    reg[7:0] result;
  always@(en,opcode,a,b, result)
 begin
    
  if(en==0)
    result=4'bzzzz;
else
    case(opcode)
      3'b000:result=a+b;
3'b001:result=a-b;
3'b010:result=a%b;
3'b011:result=a*b;
3'b100:result=a&&b;
3'b101:result=a||b;
3'b110:result=!a;
3'b111:result=a==b;
endcase

end
endmodule