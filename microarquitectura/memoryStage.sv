module memoryStage (
	input logic clk, reset, memWe, writeRegFromAlu, regWe,
	input logic [23:0] dataToWrite, result,
	input logic [3:0] regToWrite,
	output logic regWeOut, 
	output logic [23:0] dataToWriteOut,
	output logic [3:0] regToWriteOut
);

	logic [23:0] q, outMuxI;
	logic [7:0] memoryOutput;

	assign q = {16'b0, memoryOutput};
	assign memoryClk = !clk & !reset;

	ram data_memory(result[13:0], memoryClk, dataToWrite[7:0], memWe, memoryOutput);

	Mux2_1 #(24) muxI(result, q, writeRegFromAlu, outMuxI);
	
	// Pipeline regs
	register #(4) regToWriteReg(clk, reset, regToWrite, regToWriteOut);
	register #(24) dataToWriteReg(clk, reset, outMuxI, dataToWriteOut);
	register #(1) regWeReg(clk, reset, regWe, regWeOut);
	

endmodule