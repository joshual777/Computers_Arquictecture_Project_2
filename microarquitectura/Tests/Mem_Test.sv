`timescale 1ps/ 1ps
module Mem_Test();

	logic clk, reset, memWe, writeRegFromAlu, regWe, regWeOut;
	logic [3:0] regToWrite, regToWriteOut;
	logic [23:0] dataToWrite, result, dataToWriteOut;

	memoryStage memoryS(clk, reset, memWe, writeRegFromAlu, regWe, dataToWrite, result, regToWrite, regWeOut, dataToWriteOut, regToWriteOut);

	always 
		#10 clk = !clk;

	initial begin
		clk = 0; reset=1;
		memWe = 0;
		writeRegFromAlu = 0;
		regWe = 0;
		dataToWrite = 0;
		result = 0;
		regToWrite = 0;
		#5
		reset=0;
		#5; // Primer tick, no validamos nada por el pipeline
		#22; // Segundo tick
		assert (dataToWriteOut === 5) $display("Test 1 Completo");
		
		// Segundo test
		#10; // Escribimos en bajos
		result = 555;
		#10; // Primer tick
		#20; // Segundo tick
		assert (dataToWriteOut === 23) $display("Test 2 Completo"); 


		// Tercer test: Escritura en un registro desde ALU
		#10;
		writeRegFromAlu = 1;
		regToWrite = 5;
		regWe = 1;
		#30;
		assert(regWeOut === 1);
		assert (dataToWriteOut === 555);
		assert (regToWriteOut === 5) $display("Test 3 Completo");

		// Cuarto Test: Escritura de un dato y posterior lectura
		#10;
		writeRegFromAlu = 0;
		regToWrite = 0;
		regWe = 0;
		dataToWrite = 70;
		memWe = 1;
		result = 123; // La direccion de memoria donde escribimos
		#20;
		memWe = 0;
		dataToWrite = 0;
		result = 123;
		#30;
		assert (regWeOut === 0);
		assert (regToWriteOut === 0);
		assert (dataToWriteOut === 70) $display("Test 4 completo");

		// Quinto test, lecturas consecutivas de datos
		#20; // Empezamos en alto para simular un escenario real
		result = 0;
		#20;
		result = 555;
		assert (dataToWriteOut === 5);
		#20;
		assert (dataToWriteOut === 23) $display("Test 5 completo");
		
		#100
		
		$finish;
	end

endmodule