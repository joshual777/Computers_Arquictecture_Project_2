module MEM_Pipeline (input logic clk, reset,regwBoolean,
			  input logic [31:0] FinalResult,
			  input logic [3:0] regselectordest,
			  output logic regwBooleanOUT,
			  output logic [31:0] FinalResultOUT,
			  output logic [3:0] regselectordestOUT
);

	always_ff@(posedge clk, posedge reset)
		if(reset) begin
			regwBooleanOUT=0;
			FinalResultOUT=0;
			regselectordestOUT=0;
		end
		else begin
			regwBooleanOUT=regwBoolean;
			FinalResultOUT=FinalResult;
			regselectordestOUT=regselectordest;
		end
		
endmodule 
