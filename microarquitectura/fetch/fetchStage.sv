// By Kevin
module fetchStage(input logic CLK, rst,
					input logic [23:0] newPC,
					output logic [23:0] instruccion, nextPc);

	logic [23:0] address, ir_wire;				
	logic memoryClk;

	assign memoryClk = !CLK && !rst;
				
	sumador_nb #(24) sum(address, {21'b0,3'b001},1'b0, nextPc);
	register #(24) pc(CLK,rst,newPC, address);
	
	rom instrMemoryROM(address, memoryClk, ir_wire);
	
	register #(24) ir(CLK,rst,ir_wire,instruccion);

endmodule