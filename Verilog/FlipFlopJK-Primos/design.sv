module FF_BHL(
input clk, reset,
  output [3:0] Count
);
  
  wire w1,JKA,JKB,JKC,JKD,QA,QNA,QB,QNB,QC,QNC,QD,QND;
  
  FFJK FFA (clk,reset,DA,QA,QNA);
  FFJK FFA (clk,reset,DB,QB,QNB);
  FFJK FFA (clk,reset,DC,QC,QNC);
  FFJK FFA (clk,reset,DD,QD,QND);

  
  And_Gate U1(QB,QC,w1);
  Xor_Gate U2(QA,w1,DA);
  Xor_Gate U3(QB,QC,DB);
  
  Not_Gate U4(QC,QNC);
  
  assign Count={QA,QB,QC,QD};
  
endmodule