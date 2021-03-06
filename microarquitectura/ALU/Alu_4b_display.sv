module Alu_4b_display (input	logic[3:0] a, b,
								input logic ci,
								input logic[3:0] selec_alu,
								output logic flagN,flagZ,flagC, flagV,
								output logic [6:0]  display3,display2,display1,display0);

	
	logic [3:0] result;
	ALU #(4) uut (a, b, ci,selec_alu, result,flagN,flagZ,flagC,flagV);
	decoc_1b_display_bin decod0 ( result[3], display3);
	decoc_1b_display_bin decod1 ( result[2], display2);
	decoc_1b_display_bin decod2 ( result[1], display1);
	decoc_1b_display_bin decod3 ( result[0], display0);

endmodule 