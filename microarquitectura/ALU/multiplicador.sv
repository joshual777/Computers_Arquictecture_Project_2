 module multiplicador #(parameter N = 4)(input logic [N-1:0] a,b,
										output logic [2*N-1:0] result );
										
assign result = a * b;

endmodule 