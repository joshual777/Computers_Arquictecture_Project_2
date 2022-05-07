module Extender(input logic [26:0] inputData,
					output logic [31:0] extendeddata);
					
	assign extendeddata = {16'b0, inputData};
	
endmodule 