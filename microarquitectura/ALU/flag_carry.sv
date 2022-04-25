 module flag_carry (input logic  co_suma,co_resta,
							  input logic [1:0] selec_alu,
							  output logic flag );
					
assign flag = (co_resta & (selec_alu==2'b01)) | (co_suma & (selec_alu==2'b0));

endmodule 