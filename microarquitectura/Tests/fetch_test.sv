`timescale 1ps/ 1ps;
module fetch_test();

	logic clk, reset;
	logic [23:0] instruccion, nextPc, newPc;

	fetchStage fetch(clk, reset, newPc, instruccion, newPc);

	always
		#10 clk = !clk;

	initial begin
		clk = 0; reset = 1;
		newPc = 0;
		#5
		reset = 0;
		// Test 1, conseguimos la primera instruccion de memoria
		#5 
		#2
		assert( instruccion === 24'h020011 ) $display("Test 1 completo");
		// Test 2, actualizacion automatica de las instrucciones
		#20
		assert (instruccion === 24'hc00031);
		#20
		assert (instruccion === 24'h843000);
		#20
		assert (instruccion === 24'hd000f1) $display("Test 2 completo");
		// Test 3, salto a la segunda instruccion
		#10
		newPc = 1;
		#20; // Aqui vamos a leer lo que hubo en pc+1, porque era lo que estaba guardado en el registro del pc
		#20; // Hasta el segundo reloj es que vemos el salto cumpliendose, debido al registro del pc
		assert (instruccion === 24'hc00031) $display("Test 3 completo");
		$finish;


	end


endmodule