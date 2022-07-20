module FFD(
  input clk,reset,D,
  output reg Q,QN
);
  
  always@(posedge clk,reset)
    begin
      if (reset)
        Q<= 1'b0;
      else
        Q<=D;
    end
  assign QN=~Q;
  
endmodule