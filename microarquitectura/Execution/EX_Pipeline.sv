module EX_Pipeline (input logic clk, reset,regwBoolean, memwBoolean, MemrBoolean,
			  input logic [31:0] A,ALUResult,
			  input logic [3:0] regselectordest,
			  output logic regwBooleanOUT, memwBooleanOUT, MemrBooleanOUT,
			  output logic [31:0] AOUT,ALUResultOUT,
			  output logic [3:0] regselectordestOUT
);

	always_ff@(posedge clk, posedge reset)
		if(reset) begin
			regwBooleanOUT=0;
			memwBooleanOUT=0;
			MemrBooleanOUT=0;
			AOUT=0;
			ALUResultOUT=0;
			regselectordestOUT=0;
		end
		else begin
			regwBooleanOUT=regwBoolean;
			memwBooleanOUT=memwBoolean;
			MemrBooleanOUT=MemrBoolean;
			AOUT=A;
			ALUResultOUT=ALUResult;
			regselectordestOUT=regselectordest;
		end
		
endmodule 
