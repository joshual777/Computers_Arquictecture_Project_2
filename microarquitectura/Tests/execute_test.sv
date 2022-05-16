module execute_test();

	logic memWe, regWe, writeRegFromAlu, pcWe, flagsWe, clk, reset, memWeOut, regWeOut, writeRegFromAluOut;
	logic [23:0] dataToWrite, op1, op2, pcm4, dataToWriteOut, result, newPc;
	logic [3:0] regToWrite, regToWriteOut;
	logic [2:0] aluMode;

	executionStage execute(memWe, regWe, writeRegFromAlu, pcWe, flagsWe, clk, reset, dataToWrite, op1, op2, pcm4, regToWrite, aluMode,
							memWeOut, regWeOut, writeRegFromAluOut, regToWriteOut, dataToWriteOut, result, newPc);

	always 
		#10 clk = !clk;

	initial begin
		reset = 1;
		clk= 0;
		memWe = 1;
		regWe = 1;
		writeRegFromAlu = 1;
		regToWrite = 1;
		dataToWrite = 1;
		#5
		reset = 0;
		#5; // Primer tick
		
		// Test 1: Suma basica
		pcWe = 0;
		flagsWe =0;

		op1 = 1;
		op2 = 2;
		aluMode = 3'b000;
		pcm4 = 7;
		#20; // Siguiente tick
		#10; // Leemos en bajos
		assert(
			result === 3 &
			newPc === 7
		);		
		#10;

		// Test 2: Suma al pc
		pcWe = 1;
		flagsWe =0;

		op1 = 1;
		op2 = 2;
		aluMode = 3'b000;
		pcm4 = 3;
		#20; // Siguiente tick
		#10; // Leemos en bajos
		assert(result === 5);		
		assert(newPc === 5);
		#10;

		// Test 3: Comparacion
		pcWe = 0;
		flagsWe =1;

		op1 = 3;
		op2 = 5;
		aluMode = 3'b001;
		pcm4 = 0;
		#20; // Siguiente tick
		#10; // Leemos en bajos
		assert(result === 24'h00000a || result === 24'h000008);		
		assert(newPc === 0);
		#10;

		// Test 4: Prueba de pipeline	
		
		memWe = 1;
		regWe = 1;
		writeRegFromAlu = 1;
		regToWrite = 1;
		dataToWrite = 1;
		#20; // Siguiente tick
		#10; // Leemos en bajos
		assert(memWeOut === 1);
		assert(regWeOut === 1);
		assert(writeRegFromAlu === 1);
		assert(regToWriteOut === 1);
		assert(dataToWrite === 1);
		#10;


		$finish;
		


	end


endmodule;