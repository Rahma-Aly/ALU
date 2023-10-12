`timescale 1us/1us 
module tb1_ALU();
    
    localparam DATASIZE = 'd8, 
    OUTPUTSIZE = 2*DATASIZE;
    
    
    ALU_interface #(
        .DATASIZE(DATASIZE),
        .OUTPUTSIZE(OUTPUTSIZE)
    ) alu_inter();
    
    ALU_Top #(
        .DATASIZE(DATASIZE),
        .OUTPUTSIZE(OUTPUTSIZE)
    ) ALU_Top_instance(
        .alu_inter(alu_inter)
    );
	
	ALU #(
	    .DATASIZE(DATASIZE),
	    .OUTPUTSIZE(OUTPUTSIZE)
	) ALU_instance(
	    .in1(alu_inter.in1),
	    .in2(alu_inter.in2), 
	    .opcode(alu_inter.opcode),
	    .result(alu_inter.out)
	);
endmodule : tb1_ALU
