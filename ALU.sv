
`include "definitions.sv"
import definitions::*;

module ALU  #(parameter DATASIZE = 8, OUTPUTSIZE = 2*DATASIZE)(
    input [DATASIZE-1:0]            in1,
    input [DATASIZE-1:0]            in2,
    input  opcodes_t                opcode,
    output logic [OUTPUTSIZE-1:0]   result
);



always_comb begin
        case (opcode)
            ADD    : result = in1 + in2;
            SUB    : result = in1 - in2;
            MUL    : result = in1 * in2;
            DIV    : result = in1 / in2;
            SL     : result = in1 << 1;
            SR     : result = in1 >> 1;
            AND    : result = in1 & in2;
            OR     : result = in1 | in2;
            NOT    : result = !in1;
            XOR    : result = in1 ^ in2;
            default: result = 'b0;
        endcase
end
	
endmodule : ALU
