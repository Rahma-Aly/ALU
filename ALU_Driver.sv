
`ifndef ALU_DRIVER_SV
`define ALU_DRIVER_SV

`include "ALU_Transaction.sv"
`include "ALU_Coverage.sv"

class ALU_driver #();
    ALU_Transaction alu_trans;
    ALU_Coverage  a_cov;
    virtual ALU_interface alu_inter;
    
    
    function new(input virtual ALU_interface alu_inter);
        this.alu_inter = alu_inter;
        this.a_cov = new(alu_inter);
    endfunction
    
    task driver();
        alu_trans = new();
        repeat(10000) begin
            #10
            alu_trans.randomize();
            alu_inter.in1       <= alu_trans.in1;
            alu_inter.in2       <= alu_trans.in2;
            alu_inter.opcode    <= alu_trans.opcode;
            alu_inter.out       <= alu_trans.out; 
	    //fork
            a_cov.excecute();
	    //join_any 
            
        end   
    endtask
        
endclass


`endif
