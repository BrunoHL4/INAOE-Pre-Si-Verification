// *********************************************************************************
// Project Name : MUX_Paramterizable
// Author       : Bruno Hernández López
// Email        : brunohlopez@hotmail.com
// Module Name  : design.sv
// Create Date  : 2022/05/06 12:33pm
// CopyRight(c) : All Rights Reserved
//
// *********************************************************************************
// Modification History:
// Date             By              Version                 Change Description
// -----------------------------------------------------------------------
// XXXX       		BHL4         	 1.0                        Original
//  
// *********************************************************************************

module mux(sel, data_in, data_out);
parameter N = 8;//bits de entradas
parameter log2N = 3;//bits select
  input [log2N-1:0] sel;//tamaño select
  input [N-1:0] data_in;//tamaño entradas
output reg data_out;//salida

  assign data_out=data_in[sel];
    
endmodule