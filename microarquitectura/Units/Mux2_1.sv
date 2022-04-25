 module Mux2_1	#(parameter N = 32)	(input logic[N-1:0] r1, r2,
											input logic selector,
											output logic[N-1:0] result);
	
	always_comb
		case(selector)
			1'b0 : result = r1;
			1'b1 : result = r2;
			default : result = 'z;
		endcase
		
endmodule 