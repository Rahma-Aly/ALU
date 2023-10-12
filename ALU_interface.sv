
`ifndef ALU_INTERFACE_SV
`define ALU_INTERFACE_SV

import definitions::*;

interface ALU_interface #(parameter DATASIZE = 8, OUTPUTSIZE = 2*DATASIZE);
    logic [DATASIZE-1:0]   in1,in2;
    opcodes_t              opcode;
    logic [OUTPUTSIZE-1:0] out;
    
endinterface

`endif
