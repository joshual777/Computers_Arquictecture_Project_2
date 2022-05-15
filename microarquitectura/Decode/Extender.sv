module Extender(input logic [7:0] inputData,
					output logic [23:0] extendeddata);
					
	assign extendeddata = {16'b0, inputData};
	
endmodule 