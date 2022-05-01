// By Kevin
module fetchStage #(parameter N=23) (input logic CLK, rst,
											input logic [N-1:0] newPC,
											output logic [N-1:0] instruccion, nextPc);

	logic [N-1:0] address, ir_wire;				
				
	sumador_nb #(N) sum(address, 3'b100,1'b0, newPc);
	register #(N) pc(CLK,rst,newPC, address);
	Instruction_Memory im(adress, ir_wire);
	register #(N) ir(CLK,rst,ir_wire,instruccion);

endmodule