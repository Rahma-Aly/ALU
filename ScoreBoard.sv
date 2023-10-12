

`ifndef SCOREBOARD_SV
`define SCOREBOARD_SV

`include "ALU_Transaction.sv"

import definitions::*;


class scoreBoard #(parameter DATASIZE = 8, OUTPUTSIZE = 2*DATASIZE);
    
    task print_input(input ALU_Transaction alu_trans );
        logic [OUTPUTSIZE-1:0] exp_out;
        
        case (alu_trans.opcode)
            ADD    : exp_out = alu_trans.in1 + alu_trans.in2;
            SUB    : exp_out = alu_trans.in1 - alu_trans.in2;
            MUL    : exp_out = alu_trans.in1 * alu_trans.in2;
            DIV    : begin
                        if (alu_trans.in2 == 'b0) $error("division by zero !");
                        else exp_out = alu_trans.in1 / alu_trans.in2;
                     end
            SL     : exp_out = alu_trans.in1 << 1;
            SR     : exp_out = alu_trans.in1 >> 1;
            AND    : exp_out = alu_trans.in1 & alu_trans.in2;
            OR     : exp_out = alu_trans.in1 | alu_trans.in2;
            NOT    : exp_out = !alu_trans.in1;
            XOR    : exp_out = alu_trans.in1 ^ alu_trans.in2;
            default: exp_out = 'b0;
        endcase
        
        if (exp_out != alu_trans.out) begin
            $error("ERROR : %d, %d, %s, Expected output: %d, Output: %d ",alu_trans.in1,alu_trans.in2,alu_trans.opcode,exp_out ,alu_trans.out);
        end
        else $display("Test Passed : %d, %d, %s, Expected output: %d, Output: %d ",alu_trans.in1,alu_trans.in2,alu_trans.opcode,exp_out ,alu_trans.out);
        
    endtask
    
    
endclass


`endif
