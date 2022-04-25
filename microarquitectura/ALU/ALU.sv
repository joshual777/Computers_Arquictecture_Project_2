module ALU #(parameter N = 4)(input logic [N-1:0] a, b,
										input logic [1:0] selec_alu,
										output logic [N-1:0] result,
										output logic Neg, Z, C, V);
	
	logic [N-1:0] result_suma, result_resta, result_multi;			
	logic co_suma, co_resta;

	sumador_nb #(N) sum(a, b,1'b0, result_suma, co_suma);
	restador_nb #(N) rest(a, b,1'b0,result_resta, co_resta);
	multiplicador #(N) mult(a, b, result_multi);

	
	Mux #(N) m (result_suma, result_resta, result_multi,b,selec_alu,result);


	flag_negativo  fn(result[N-1], selec_alu, Neg);
	flag_carry  fC (co_suma, co_resta, selec_alu, C);
	flag_cero #(N) fz (result, C, Z);
	flag_overflow #(N) fv (a, b, result, selec_alu, V);

					
endmodule 