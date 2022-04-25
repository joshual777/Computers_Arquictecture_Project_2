module Extender(input logic [26:0] Instr,
					input logic [1:0] immediatetype,
					output logic [31:0] extendeddata);
	always_comb
	case(immediatetype)
	// 19-bit 2 register
	2'b00: extendeddata = {13'b0, Instr[22:4]};
	// 23-bit 1 register
	2'b01: extendeddata = {9'b0,Instr[22:0]};
	// 27-bit branch
	2'b10: extendeddata = {5'b0,Instr};
	2'b11: extendeddata = {5'b0,Instr};
	// undefined
	default: extendeddata = 32'bx; 
	endcase
endmodule 