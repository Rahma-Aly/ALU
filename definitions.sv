`ifndef DEFINITIONS
`define DEFINITIONS


package definitions;

parameter VERSION = "1.1";
localparam SIZE = 4;

typedef enum logic [SIZE-1:0]{NOP,ADD,SUB,MUL,DIV,SL,SR,AND,OR,NOT,XOR} opcodes_t;

//
//`include "ALU_Coverage.sv"
//`include "ScoreBoard.sv"


endpackage 
/*import package*/
//import definitions::*;

`endif
