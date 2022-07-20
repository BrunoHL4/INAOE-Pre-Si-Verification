//-------------------------------------------------------------------------
//						www.verificationguide.com 
//-------------------------------------------------------------------------
class transaction;
  //declaring the transaction items
  rand bit [4:0] rd;
  rand bit [4:0] rs;
  rand bit [4:0] rt;
  rand bit [5:0] addr;
  rand bit [5:0] funct;
  rand bit [25:0] JTA;
  rand bit [15:0] imm;
  rand bit [31:0] instruction;
  
  bit [4:0] shamt = 5'b0;
  bit [31:0] PC_In;
  bit [31:0] mux5_out;
  bit [31:0] A;
  bit [31:0] B;
  bit [31:0] rd2;
  bit [31:0] PCOut;
  bit [31:0] datamem_out;
  bit [31:0] mux2_outt;
  
  
  constraint op_available {addr inside {0, 2, 4, 5, 35, 43};}
  constraint rd_value {rd inside {[8:25]};}
  constraint rs_value {rs inside {[8:25]};}
  constraint rt_value {rt inside {[8:25]};}
  constraint JTA_value {JTA inside {[0:31]};}
  constraint imm_value {(imm+rs)<32;}
  
  //Se crean rangos dependiendo del opcode de cada una de las instrucciones
  constraint funct_range{
    (addr == 0) -> funct inside {32,34,36,37,42};
  }
  
  typedef enum {r, i, j} AddrType;
  rand AddrType atype;
  constraint optype_range{
    (addr == 0) -> instruction [31:0] == {addr,rs,rt,rd,shamt,funct};
    (addr inside {4,5,35,43}) -> instruction [31:0] == {addr,rs,rt,imm};
    (addr == 2) -> instruction [31:0] == {addr,JTA};
  }
  constraint addr_range
  {
    (atype == r) -> addr == 0;
    (atype == i) -> addr inside {4,5,35,43};
    (atype == j) -> addr == 2;
  }
 
  
  function void display(string name);
    $display("------------------------------------------");
    $display("- %s ",name);
    if(addr==4||addr==5||addr==35||addr==43)begin //tipo I
      $display("TYPE I");
      $display("rs: %b  rt: %b  Imm: %b",rs,rt,imm);

    end
    else if(addr==0)begin //tipo R
      $display("TYPE R");
      $display("rs: %b  rt: %b  rd: %b  funct: %b",rs,rt,rd,funct);

    end
    else if(addr==2)begin //tipo J
      $display("TYPE J");
      $display("JTA: %b",{JTA});
    end
	$display("Instruccion: %b",instruction);
    $display("------------------------------------------");
  endfunction
endclass