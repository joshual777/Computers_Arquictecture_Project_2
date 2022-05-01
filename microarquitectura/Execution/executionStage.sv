module executionStage (
	input logic memWe, regWe, writeRegFromAlu, pcWe, flagsWe, clk, reset,
	input logic [23:0] dataToWrite, op1, op2, pcm4,
	input logic [3:0] regToWrite,
	input logic [2:0] aluMode,
	output logic memWeOut, regWeOut, writeRegFromAluOut,
	output logic [2:0] regToWriteOut,
	output logic [23:0] dataToWriteOut, result, newPc
);

	logic [23:0] realOp1, pre_result;
	logic [3:0] flags;
	
	Mux2_1 #(24) muxG(pcm4, op1, pcWe, realOp1);
	ALU #(24) alu (realOp1, op2, aluMode, pre_result, 
						flags[3], flags[2], flags[1], flags[0]);
	Mux2_1 #(24) muxK(flags, pre_result, flagsWe, result);
	Mux2_1 #(24) muxH(result, pcm4, pcWe, newPc);
	
	// Pipeline Registers
	register #(1) memWeRegister(clk, reset, memWeOut);
	register #(1) regWeRegister(clk, reset, regWeOut);
	register #(1) writeRegFromAluRegister(clk, reset, writeRegFromAluOut);
	register #(24) resultRegister(clk, reset, result);
	register #(24) dataToWriteRegister(clk, reset, dataToWrite);

	


endmodule