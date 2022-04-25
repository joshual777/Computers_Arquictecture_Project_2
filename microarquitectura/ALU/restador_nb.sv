module restador_nb #(parameter N = 4) (input logic [N-1:0] a, b,
													input logic ci,
												  output logic [N-1:0] rest,
												  output logic co);

wire [N-1:0] b_negado ;
wire ci_negado,co_negado; 
negador_nb #(N) neg (b, b_negado);
negador_1b cn (ci,ci_negado ); 
sumador_nb #(N) resta (a,b_negado,ci_negado,rest,co_negado);	  
negador_1b con (co_negado ,co); 
endmodule 