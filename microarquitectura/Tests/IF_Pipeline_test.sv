module IF_Pipeline_test();
	logic clk, reset;
	logic[31:0] Instr, PC, Instr_out, PC_out;
	
IF_Pipeline uut(clk, reset, Instr, PC, Instr_out, PC_out);
	
initial begin


//Prueba 1 reset abajo
clk = 1'd0;
reset = 1'd0;
Instr = 32'd0;
PC = 32'd0;

#10;

reset = 1'd1; //Se inicia el sistema
#10;

reset = 1'd0; //Se reinicia para empezar pruebas
#10;

Instr = 32'd5;
PC = 32'd2;
#10;

clk = 1'd1;
#10;

assert(Instr_out === 32'd5 && PC_out === 32'd2) $display("Prueba 1 se termina correctamente"); else $display("Hubo algun error en prueba 1");

#10;

//Prueba 2 reset abajo

clk = 1'd0;
#10;

Instr = 32'd7;
PC = 32'd4;
#10;

clk = 1'd1;
#10;

assert(Instr_out === 32'd7 && PC_out === 32'd4) $display("Prueba 2 se termina correctamente"); else $display("Hubo algun error en prueba 2");

//Prueba 1 con reset arriba
clk = 1'd0;
#10;

Instr = 32'd7;
PC = 32'd4;
reset = 1'd1;
#10;


assert(Instr_out === 32'd0 && PC_out === 32'd0) $display("Prueba 3 se termina correctamente"); else $display("Hubo algun error en prueba 3");










end 

endmodule
