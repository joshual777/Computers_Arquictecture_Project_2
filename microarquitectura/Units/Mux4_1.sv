module Mux4_1	#(parameter N = 24)	(input logic[N-1:0] r1, r2, r3, r4,
											input logic [1:0] selector,
											output logic[N-1:0] result);
	
	always_comb
		case(selector)
			2'b00 : result = r1;
			2'b01 : result = r2;
			2'b10 : result = r3;
			2'b11 : result = r4;
			default : result = 'z;
		endcase
		
endmodule 