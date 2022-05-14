// By Kevin
module fetchStage(input logic CLK, rst,
											input logic [23:0] newPC,
											output logic [23:0] instruccion, nextPc);

	logic [23:0] address, ir_wire;				
				
	sumador_nb #(24) sum(address, 3'b100,1'b0, newPc);
	register #(24) pc(CLK,rst,newPC, address);
	Instruction_Memory im(adress, ir_wire);
	
	rom instrMemoryROM(address, clk, ir_wire);
	
	register #(24) ir(CLK,rst,ir_wire,instruccion);

endmodule