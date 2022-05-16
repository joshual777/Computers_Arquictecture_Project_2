 module Mux	#(parameter N = 4)	(input logic[N-1:0] r1, r2, r3, r4, r5, r6, r7,
											input logic[2:0] selec_alu,
											output logic[N-1:0] result);
	
	always_comb
		case(selec_alu)
			3'b000 : result = r1;
			3'b001 : result = r2;
			3'b010 : result = r3;
			3'b011 : result = r4;
			3'b100 : result = r5;
			3'b101 : result = r6;
			3'b110 : result = r7;
			default : result = 'z;
		endcase
		
endmodule 