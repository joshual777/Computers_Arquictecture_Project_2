`timescale 1ps/1ps
module fetch_decode_test();

	logic regWeIn, clk, reset, pcWe, memWe, flagsWe, writeRegFromAlu;
	logic [2:0] aluMode;
	logic [3:0] regToWrite, regToWriteIn, regToWriteOut;
	logic [23:0] newPc, instruccion, op1, op2, dataToWrite, wbData;
	fetchStage fetch(clk, reset, newPc, 
						instruccion, newPc);
	decodeStage decode(clk, reset, regWeIn, instruccion, wbData, regToWriteIn,
						pcWe, memWe, flagsWe, writeRegFromAlu, regWeOut, op1, op2, dataToWrite, regToWriteOut, aluMode);
	

	always 
		#10 clk = !clk;
	
	initial begin
		// Inicializaciones en 0 para las salidas de los modulos que no se han modelado
		regWeIn = 0;
		wbData = 0;
		regToWriteIn = 0;
		// Inicializacion del device
		reset = 1;
		clk = 0;
		#5
		reset = 0;
		#5; // Primer tick
		#20; // Segundo tick

		// Test 1:
		// Instruccion: sum r2, r0, #1
		#10; // Leemos en bajos
		assert(writeRegFromAlu === 1);
		assert(pcWe === 0);
		assert(memWe === 0);
		assert(regWeOut === 1);
		assert(flagsWe === 0);

		assert(op1 === 0);
		assert(op2 === 1);
		assert(dataToWrite === 0);
		assert(regToWriteOut === 4'b0010);
		assert(aluMode === 3'b000);
		#20;

		// Test 2: 
		// Instruccion: sto #3
		assert(writeRegFromAlu === 0);
		assert(pcWe === 1);
		assert(memWe === 0);
		assert(regWeOut === 0);
		assert(flagsWe === 0);

		assert(aluMode === 3'b000);
		assert(op2 === 3);
		#20;

		// Test 3: 
		// Instruccion: cmp r3,r2
		assert(writeRegFromAlu === 1);
		assert(pcWe === 0);
		assert(memWe === 0);
		assert(regWeOut === 1);
		assert(flagsWe === 1);
		
		assert(aluMode === 3'b001);
		assert(op1 === 0);
		assert(op2 === 0);
		#20;

		// Test 4:
		// Instruccion: sme #15
		assert(writeRegFromAlu === 0);
		assert(pcWe === 0);
		assert(memWe === 0);
		assert(regWeOut === 0);
		assert(flagsWe === 0);
		
		assert(aluMode === 3'b000);
		assert(op2 === 15);
		#20;


		// Test 5:
		// Instruccion: ld r3, #1
		assert(writeRegFromAlu === 0);
		assert(pcWe === 0);
		assert(memWe === 0);
		assert(regWeOut === 1);
		assert(flagsWe === 0);

		assert(aluMode === 3'b000);
		assert(op1 === 0);
		assert(op2 === 1);
		assert(regToWriteOut === 3);
		#20;

		// Test 6:
		// instruccion: ld r7, r8(2)
		assert(writeRegFromAlu === 0);
		assert(pcWe === 0);
		assert(memWe === 0);
		assert(regWeOut === 1);
		assert(flagsWe === 0);

		assert(aluMode === 3'b000);
		assert(op1 === 0);
		assert(op2 === 2);
		assert(regToWriteOut === 7);
		#20;

		// Test 7: 
		// Instruccion: sr r5, #3
		assert(writeRegFromAlu === 0);
		assert(pcWe === 0);
		assert(memWe === 1);
		assert(regWeOut === 0);
		assert(flagsWe === 0);

		assert(aluMode === 3'b000);
		assert(op1 === 0);
		assert(op2 === 3);
		#20;

		$finish;

		
	end

endmodule;