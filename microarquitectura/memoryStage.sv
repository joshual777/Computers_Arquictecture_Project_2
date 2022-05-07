module memoryStage (
	input logic clk, reset, memWe, writeRegFromAlu, regWe
	input logic [23:0] dataToWrite, result,
	input logic [3:0] regToWrite,
	output logic regWeOut, 
	output logic [23:0] dataToWriteOut,
	output logic [3:0] regToWriteOut
);

	

endmodule