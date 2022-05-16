 module flag_negativo (input logic  co_resta,
							  input logic [2:0] selec_alu,
							  output logic flag );
					
assign flag = co_resta & (selec_alu==3'b001);

endmodule 