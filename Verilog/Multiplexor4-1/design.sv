// *********************************************************************************
// Project Name : MUXmulti
// Author       : Bruno Hernández López
// Email        : brunohlopez@hotmail.com
// Module Name  : design.sv
// Create Date  : 	2022/05/03 3:42pm
// CopyRight(c) : All Rights Reserved
//
// *********************************************************************************
// Modification History:
// Date             By              Version                 Change Description
// -----------------------------------------------------------------------
// XXXX       		BHL4          1.0                        Original
//  
// *********************************************************************************

module MUXmulti(
  
  input wire a,b,c,d,
  input wire x,y,
  output wire f
);
  begin
    
always @*
  if (x == 1'b0 & y==1'b0 ) 
f=a;
    else if (x == 1'b0 & y==1'b1) 
f =c ;
    else if (x == 1'b1 & y==1'b0) 
f =b ;
    else if (x == 1'b1 & y==1'b1) 
f =d ;
else  
Z = 2'bXX;
    
end 
endmodule