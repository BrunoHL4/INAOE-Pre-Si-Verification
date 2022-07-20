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

`timescale 1ns/100ps
module mux_TB ();

  parameter N = 8;//bits de entradas
parameter log2N = 3;//bits select
  
  reg [N-1:0] data_in;
  reg [log2N-1:0] sel;
  
  
  
  
  mux0 #(.N(N),.log2N(log2N))
  mux (.data_in(data_in), .sel(sel),.data_out(data_out));
  
  
  	initial
      begin
        $display("selector size = %d", sel);
        
        // For loop to initialize the inputs to '1'
        for(int i=0; i<2**N; i++)begin
          data_in = i;
          $display("Case %d", data_in);
          // For loop to show the select the input
          for(int j=0; j<=log2N; j++)begin
            sel = j;
            #1 $display("in = %b, sel=%b, out=%b",data_in, sel, data_out);
          end
          
        end
       
        
      end
endmodule 