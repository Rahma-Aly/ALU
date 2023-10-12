`ifndef ALU_TOP_SV
`define ALU_TOP_SV



`include "monitor.sv"
`include "ALU_Driver.sv"

module ALU_Top#(parameter DATASIZE = 8, OUTPUTSIZE = 2*DATASIZE)
    (ALU_interface alu_inter);
    
	ALU_driver a_driver;
	Monitor    a_monitor;
	scoreBoard a_scrbrd;
	
	initial begin
	    a_driver = new(alu_inter);
        a_scrbrd = new();
        a_monitor = new(alu_inter,a_scrbrd);
        fork
            a_monitor.monitor();
            a_driver.driver();
        join_none
        
	end
	
endmodule : ALU_Top


`endif