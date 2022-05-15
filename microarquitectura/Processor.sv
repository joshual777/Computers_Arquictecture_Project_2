module Processor ( input logic clk, reset
);
	logic regWe, pcWe, memWe, flagsWe, writeRegFromAlu, regWeOut, memWeOut, regWeOut2, writeRegFromAluOut;
	logic [23:0] instruccion, newPc, nextPc, wbData, op1, op2, dataToWrite, pcm4;
	logic [3:0] regToWrite, regToWriteOut, regToWriteOut2, dataToWriteOut;
	logic [2:0] aluMode;

	fetchStage fetch(clk, reset, newPc, 
		instruccion, nextPc);
	decodeStage decode(clk, reset, regWe, instruccion, wbData, regToWrite,
		 pcWe, memWe, flagsWe, writeRegFromAlu, regWeOut, op1, op2, dataToWrite, regToWriteOut, aluMode);
	executionStage execution(memWe, regWeOut, writeRegFromAlu, pcWe, flagsWe, clk, reset, dataToWrite, op1, op2, pcm4, regToWriteOut, aluMode,
		 memWeOut, regWeOut2, writeRegFromAluOut, regToWriteOut2, dataToWriteOut, result, newPc);
	memoryStage memory(clk, reset, memWeOut, writeRegFromAluOut, regWeOut2, dataToWriteOut, result, regToWriteOut2, 
		regWe, wbData, regToWrite);


endmodule 