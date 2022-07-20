module FFJK (
    input clk,reset, J, K,
    output reg Q,QN
);

reg ff1;

  always @(reset) begin 
    ff1 <= 1'b0;
end


always @ (posedge clk) begin
  if (!reset) begin
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
assign QN = ~ff1;

endmodule