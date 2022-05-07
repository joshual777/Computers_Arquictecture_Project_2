module memoryStage (
	input logic clk, reset, memWe, writeRegFromAlu, regWe,
	input logic [23:0] dataToWrite, result,
	input logic [3:0] regToWrite,
	output logic regWeOut, 
	output logic [23:0] dataToWriteOut,
	output logic [3:0] regToWriteOut
);

	logic [23:0] q, outMuxI;
	ram data_memory(result, clk, dataToWrite, memWe, q);

	Mux2_1 muxI(result, q, writeRegFromAlu, outMuxI);
	
	// Pipeline regs
	register #(4) regToWriteReg(clk, reset, regToWrite, regToWriteOut);
	register #(24) dataToWriteReg(clk, reset, outMuxI, dataToWriteOut);
	register #(1) regWeReg(clk, reset, regWe, regWeOut);
	

endmodule