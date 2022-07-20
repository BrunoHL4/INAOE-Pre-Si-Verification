
module Control(
  input [5:0]op,  ////funtion

  input rst, // Clock Enable
  input clk,
  
 output reg MemWrite,IRWrite,RegDst,MemToReg,RegWrite,ALUSrcA,
 output reg [1:0] ALUSrcB,ALUop,
 output reg  BeQ,BnE,PCWrite,
 output reg [1:0] PCSrc


);

reg [3:0] state;
reg [3:0] nextState;
reg sel=1'b0;

parameter s0= 4'd0;
parameter s1= 4'd1;
parameter s2= 4'd2;
parameter s3= 4'd3;
parameter s4= 4'd4;
parameter s5= 4'd5;
parameter s6= 4'd6;
parameter s7= 4'd7;
parameter s8= 4'd8;
parameter s9= 4'd9;
parameter s10= 4'd10;
parameter s11= 4'd11;






always @(posedge clk , rst) begin 
  if(~rst) begin
    MemWrite=1'b0;
    IRWrite=1'b0;
    RegDst=1'b0;
    MemToReg=1'b0;
    RegWrite=1'b0;
    ALUSrcA =1'b0;     
    ALUSrcB=2'b00;
    ALUop=2'b00;
    BeQ=1'b0;
    BnE=1'b0;
    PCWrite=1'b0;
    PCSrc=2'b00;
    state <= s0;
  end else begin
    state <= nextState;
  end
end

always @( state,op) begin 
  //$display("state:",state);
  case (state)
      s0:nextState=s1;
      s1:begin
        if(op==6'b101011)begin
         sel=1'b0;
          nextState=s2;  ///sw or lw 
        end
        if (op==6'b100011) begin
          sel=1'b1;
          nextState=s2;  ///sw or lw
        end
        else if(op==6'b000000)begin
          nextState=s5;  /// R-type
          //$display("R-type");
        end
        else if(op==6'b000101)begin
          nextState=s7;  /// bne
          //$display("bne");
        end
        else if(op==6'b000100)begin
          nextState=s8;  /// beq
          //$display("beq");
        end
        else if(op==6'b001000)begin
          nextState=s9;  /// ADDI
          //$display("ADDI");
        end
        else if(op==6'b000010)begin 
        nextState=s11;  /// jump
        //$display("jump");
        end
      end
      s2:begin
        if (!sel)begin
          nextState=s4; ///if sw
          //$display("sw");
        end
        else if (sel)begin
          nextState=s3; ///if lw
          //$display("lw");
        end

      end
      s3:nextState=s0;
      s4:nextState=s0;
      s5:nextState=s6;
      s6:nextState=s0;
      s7:nextState=s0;
      s8:nextState=s0;
      s9:nextState=s10;
      s10:nextState=s0;
      s11:nextState=s0;
    default :  nextState=s0; 
  endcase
end

always @(state) begin 
  case (state)
    s0:begin
      RegWrite=1'b0;
      MemWrite=1'b0;
      BnE=1'b0;
      BeQ=1'b0;

      IRWrite=1'b1;
      ALUSrcA =1'b0;     
      ALUSrcB=2'b01;
      ALUop=2'b00;
      PCSrc=2'b00;
      PCWrite=1'b1;
    end
    s1:begin
      PCWrite=1'b0;
      IRWrite=1'b0;
      ALUSrcA =1'b0;     
      ALUSrcB=2'b11;
      ALUop=2'b00;
    end
    s2:begin
      ALUSrcA =1'b1;     
      ALUSrcB=2'b10;
      ALUop=2'b00;
    end
    s3:begin
      RegDst=1'b0;
      MemToReg=1'b1;
      RegWrite=1'b1;
    end
    s4:MemWrite=1'b1;
    s5:begin
      ALUSrcA =1'b1;     
      ALUSrcB=2'b00;
      ALUop=2'b10;
    end
    s6:begin
      RegDst=1'b1;
      MemToReg=1'b0;
      RegWrite=1'b1;
    end
    s7:begin
      ALUSrcA =1'b1;     
      ALUSrcB=2'b00;
      ALUop=2'b01;
      PCSrc=2'b01;
      BnE=1'b1;
    end
    s8:begin
      ALUSrcA =1'b1;     
      ALUSrcB=2'b00;
      ALUop=2'b01;
      PCSrc=2'b01;
      BeQ=1'b1;
    end
    s9:begin
      ALUSrcA =1'b1;     
      ALUSrcB=2'b10;
      ALUop=2'b00;
    end
    s10:begin
      RegDst=1'b0;
      MemToReg=1'b0;
      RegWrite=1'b1;
    end
    s11:begin
      PCSrc=2'b10;
      PCWrite=1'b1;
    end
    default : begin
      RegWrite=1'b0;
      MemWrite=1'b0;
      BnE=1'b0;
      BeQ=1'b0;

      IRWrite=1'b1;
      ALUSrcA =1'b0;     
      ALUSrcB=2'b01;
      ALUop=2'b00;
      PCSrc=2'b00;
      PCWrite=1'b1;
    end
  endcase
end

endmodule 