module Instruction_Memory(input logic [31:0] pc,
								  output logic [31:0] rdata
);

	
	logic [31:0] Instructiondata[910:0];
	
	
	initial begin
	$readmemh("output.txt",Instructiondata);
	end
	
	
	assign rdata = Instructiondata[pc[31:0]];
	
	

endmodule 