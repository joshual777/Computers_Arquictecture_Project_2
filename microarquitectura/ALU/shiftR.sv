 module shiftR #(parameter N = 4)(input logic [N-1:0] a,
										output logic [N-1:0] result );
										
assign result = a >> 1;

endmodule 