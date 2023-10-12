
import definitions::*;
class ALU_Coverage #(parameter DATASIZE = 8, OUTPUTSIZE = 2*DATASIZE);;
    virtual ALU_interface alu_vi;
    
    bit [DATASIZE-1:0] in1;
    bit [DATASIZE-1:0] in2;
    opcodes_t          opcode;
    
    covergroup opcode_cov;
        OP: coverpoint opcode {
            bins op[]     = {NOP,ADD,SUB,MUL,DIV,SL,SR,AND,OR,NOT,XOR};
            bins np_op[]  = (NOP => [ADD:XOR]);
            bins op_np [] = ([ADD:XOR] => NOP);
        }
        
    endgroup
    
    covergroup in_val;
        IN1: coverpoint in1 {
            bins zeros    = {'b0};
            bins ones     = {'hFF};
            bins others[] = {['h1:'hFE]}; 
        }
        IN2: coverpoint in2 {
            bins zeros    = {'b0};
            bins ones     = {'hFF};
            bins others[] = {['h1:'hFE]}; 
        }
        IN1_IN2: cross in1, in2;    
    endgroup
    
    
    function new ( input virtual ALU_interface alu_vi);
      opcode_cov = new();
      in_val = new();
      this.alu_vi = alu_vi;
    endfunction : new
    
    task excecute();
        //forever begin
            in1 = alu_vi.in1;
            in2 = alu_vi.in2;
            opcode = alu_vi.opcode;
            opcode_cov.sample();
            in_val.sample();
            
       // end
        
    endtask
    
        
    
endclass
