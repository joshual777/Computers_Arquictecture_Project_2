module Instruction_Memory_test();
	logic [31:0] pc,rdata;
	
	Instruction_Memory uut (pc, rdata);
	
	initial begin
	
	//Prueba instruccion 1
	pc =32'd0;
	#10;
	assert (rdata === 32'h48000005) $display("La instruccion 1 se lee correctamente"); else $display("La instruccion 1 tiene un problema");
	#10;
	
	//Prueba instruccion 2
	pc = 32'd1;
	#10;
	assert (rdata === 32'h49000004) $display("La instruccion 2 se lee correctamente"); else $display("La instruccion 2 tiene un problema");
	#10;
	
	//Prueba instruccion 3
	pc = 32'd2;
	#10;
	assert (rdata === 32'h48800000) $display("La instruccion 3 se lee correctamente"); else $display("La instruccion 3 tiene un problema");
	#10;
	
	end
endmodule 