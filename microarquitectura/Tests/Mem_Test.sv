module Mem_Test();

	logic clk, reset, memWe, writeRegFromAlu, regWe, regWeOut;
	logic [3:0] regToWrite, regToWriteOut;
	logic [23:0] dataToWrite, result, dataToWriteOut;

	memoryStage memoryS(clk, reset, memWe, writeRegFromAlu, reWe, dataToWrite, result, regToWrite, regWeOut, dataToWriteOut, regToWriteOut);

	always 
		#10 clk = !clk;

	initial begin
		clk = 0; reset=1;
		#5
		reset = 0;
		
		
		memWe = 0;
		writeRegFromAlu = 0;
		regWe = 0;
		dataToWrite = 0;
		result = 0;
		
		#20
		
		$finish;
	end

endmodule