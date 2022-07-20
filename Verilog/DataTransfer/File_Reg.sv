//FILE REGISTER
module File_Reg(  
      input                    clk,                    
      input                    rst,                     
      // write port  
      input                    FR_WE,                   
      input          [4:0]     FR_Waddr,                
      input          [7:0]     FR_Wdata,                
      //read port 1  
      input          [4:0]     FR_RAddr_1,              
      output         [7:0]     FR_Rdata_1,             
      //read port 2  
      input          [4:0]     FR_RAddr_2,  
      output         [7:0]     FR_Rdata_2  
 );  
      reg     [7:0] reg_File [31:0];       
      integer i;     
/*-------------------- Guardar un registro --------------------------*/
      always @ (posedge clk or posedge rst) begin   
           if(rst) begin  
             for( i=0; i<32; i=i+1) 
               reg_File[i] = i;
             end  
           else begin  
                if(FR_WE) begin                         
                     reg_File[FR_Waddr] <= FR_Wdata;    
                end  
           end  
      end  
/*------------------ Obtener el valor de un registro------------------------*/
  assign FR_Rdata_1 = reg_File[FR_RAddr_1];
  assign FR_Rdata_2 = reg_File[FR_RAddr_2];
 endmodule
/*----------------------- FILE REGISTER ------------------------------------*/