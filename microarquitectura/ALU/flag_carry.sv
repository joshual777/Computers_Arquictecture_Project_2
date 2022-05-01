 module flag_carry (input logic  co_suma,co_resta, co_multi,
							  input logic [1:0] selec_alu,
							  output logic flag );
					
assign flag = (co_resta & (selec_alu==3'b001)) | (co_suma & (selec_alu==3'b0) | (co_multi & (selec_alu==3'b010) ));

endmodule 