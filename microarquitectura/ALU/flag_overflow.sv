 module flag_overflow #(parameter N = 4)(input logic [N-1:0] a,b, result,
													  input logic [2:0] selec_alu,
														output logic flag );
					
wire[N-1:0] d;
divisor_nb #(N) div (result,b,d);					
assign flag = (a!=d) & (selec_alu==3'b010);

endmodule 