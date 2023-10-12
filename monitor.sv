
`ifndef MONITOR_SV
`define MONITOR_SV

`include "ScoreBoard.sv"
`include "ALU_Transaction.sv"


class Monitor;
    virtual ALU_interface alu_inter;
    scoreBoard            scorebrd; 
    ALU_Transaction       alu_trans;
    
    function new(input virtual ALU_interface alu_inter, scoreBoard scorebrd);
        this.alu_inter = alu_inter;
        this.scorebrd = scorebrd;
    endfunction
    
    task monitor ();
            alu_trans       = new();
        while(1) begin
            #10
            alu_trans.in1   = alu_inter.in1;
            alu_trans.in2   = alu_inter.in2;
            alu_trans.opcode= alu_inter.opcode;
            alu_trans.out   = alu_inter.out;
	    #1
            scorebrd.print_input(alu_trans);
        end    
    endtask
       
endclass

`endif
