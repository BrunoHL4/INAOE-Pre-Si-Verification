// *********************************************************************************
// Project Name : FlipFlopJK-Primos
// Author       : Bruno Hernández López
// Email        : brunohlopez@hotmail.com
// Module Name  : design.sv
// Create Date  : 2022/05/06 5:34pm
// CopyRight(c) : All Rights Reserved
//
// *********************************************************************************
// Modification History:
// Date             By              Version                 Change Description
// -----------------------------------------------------------------------
// XXXX       		BHL4         	 1.0                        Original
//  
// *********************************************************************************

module FFJK(
  input clk,reset,J,K
  output reg QA,QNA
);
  
  always@(posedge clk,reset)
    begin
      if (reset)
        Q<= 1'b0;
      else
        Q<=D;
    end
endmodule


module FFJK (
    input clk,reset, J, K,
    output reg Q,QN
);

reg ff1, ff2;

always @(rst) begin 
    ff1 <= 1'b0;
    ff2 <= 1'b0;
end


always @ (posedge clk) begin
    if (!rst) begin
        if (J==1 && K==0) begin
            ff1 <= 1'b1;
        end
        else if (J==0 && K==1) begin
            ff1 <= 1'b0;
        end
        else if (J==1 && K==1) begin 
            ff1 <= ~ff1;
        end
      	else begin
          	ff1 <= ff1;
        end
    end 
end

assign Q = ff1;

endmodule