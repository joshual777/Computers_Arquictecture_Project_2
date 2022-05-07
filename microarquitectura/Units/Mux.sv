 module Mux	#(parameter N = 4)	(input logic[N-1:0] r1, r2, r3,r4,
											input logic[1:0] selec_alu,
											output logic[N-1:0] result);
	
	always_comb
		case(selec_alu)
			2'b00 : result = r1;
			2'b01 : result = r2;
			2'b10 : result = r3;
			2'b11 : result = r4;
			default : result = 'z;
		endcase
		
endmodule 