//FILE REGISTER
module RegFile(  
      input                    clk,                                       
      // write port  
      input                    FR_WE,                   
      input          [4:0]     FR_Waddr,                
  	  input          [31:0]     FR_Wdata,                
      //read port 1  
      input          [4:0]     FR_RAddr_1,              
  	  output         [31:0]     FR_Rdata_1,             
      //read port 2  
      input          [4:0]     FR_RAddr_2,  
  	  output         [31:0]     FR_Rdata_2  
 );  
  	  reg     [31:0] reg_File [62:0];           
/*-------------------- Guardar un registro --------------------------*/
  initial
    begin 
      $readmemb("registers.txt",reg_File);
    end
      always @ (posedge clk ) begin   

                if(FR_WE) begin                         
                     reg_File[FR_Waddr] <= FR_Wdata;    
                  	$writememb("registers.txt",reg_File);	
                end   
      end  
/*------------------ Obtener el valor de un registro------------------------*/
  assign FR_Rdata_1 = reg_File[FR_RAddr_1];
  assign FR_Rdata_2 = reg_File[FR_RAddr_2];
 endmodule
/*----------------------- FILE REGISTER ------------------------------------*/