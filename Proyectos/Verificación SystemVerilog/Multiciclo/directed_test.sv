//-------------------------------------------------------------------------
//						www.verificationguide.com
//-------------------------------------------------------------------------
`include "environment.sv"
program test(intf i_intf);
  
  class my_trans extends transaction;
    
    bit [1:0] count;

    function void pre_randomize();
      rs.rand_mode(0);
      rt.rand_mode(0);          
	  rd.rand_mode(0); 
      addr.rand_mode(0);
      data_R.rand_mode(0);
      data_I.rand_mode(0);
      data_J.rand_mode(0);
      funct.rand_mode(0);
      JTA.rand_mode(0);
      imm.rand_mode(0);
      
      rs = 0;
      rt = 0;
      rd=0;
      addr=0;
      data_R=0;
      data_I=0;
      data_J=0;
      funct=0;
      JTA=0;
      imm=0;
      shamt=0;
    endfunction
    
  endclass
    
  //declaring environment instance
  environment env;
  my_trans my_tr;
  
  initial begin
    //creating environment
    env = new(i_intf);
    
    my_tr = new();
    
    //setting the repeat count of generator as 4, means to generate 4 packets
    env.gen.repeat_count = 3;
    
    env.gen.trans = my_tr;
    
    //calling run of env, it interns calls generator and driver main tasks.
    env.run();
  end
endprogram