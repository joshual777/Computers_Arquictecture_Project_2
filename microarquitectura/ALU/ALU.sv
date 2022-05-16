module ALU #(parameter N = 4)(input logic [N-1:0] a, b,
										input logic [2:0] selec_alu,
										output logic [N-1:0] result,
										output logic Neg, Z, C, V);
	
	logic [N-1:0] result_suma, result_resta, result_div, result_and, result_or, result_not;
	logic [2*N-1:0] result_multi;
	logic co_suma, co_resta;
	
	// Aritmetica
	sumador_nb #(N) sum(a, b,1'b0, result_suma, co_suma);
	restador_nb #(N) rest(a, b,1'b0,result_resta, co_resta);
	multiplicador #(N) mult(a, b, result_multi);
	divisor_nb #(N) div(a,b,result_div);
	
	// Logica
	assign result_and = a&b;
	assign result_or = a|b;
	assign result_not = ~a;

	
	Mux #(N) m (result_suma, result_resta, result_multi[23:0],result_div, result_and, result_or, result_not,
					selec_alu,result);


	flag_negativo  fn(result[N-1], selec_alu, Neg);
	flag_carry  fC (co_suma, co_resta, result_multi[24], selec_alu, C);
	flag_cero #(N) fz (result, C, Z);
	flag_overflow #(N) fv (a, b, result, selec_alu, V); // Este overflow esta caro, si no pasa el disenno probar otras maneras 

					
endmodule 