 module flag_negativo (input logic  co_resta,
							  input logic [1:0] selec_alu,
							  output logic flag );
					
assign flag = co_resta & (selec_alu==2'b01);

endmodule 