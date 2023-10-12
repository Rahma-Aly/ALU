`ifndef ALU_TRANSACTION_SV
`define ALU_TRANSACTION_SV

import definitions::*;

class ALU_Transaction  #(parameter DATASIZE = 8, OUTPUTSIZE = 2*DATASIZE);
    rand bit [DATASIZE-1:0] in1;
    rand bit [DATASIZE-1:0] in2;
    rand opcodes_t          opcode;
    bit [OUTPUTSIZE-1:0]    out;
    
    constraint  rand_opcode {opcode inside {NOP,ADD,SUB,MUL,DIV,SL,SR,AND,OR,NOT,XOR};}
    
endclass
    
`endif
