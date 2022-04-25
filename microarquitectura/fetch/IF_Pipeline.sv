module IF_Pipeline(input clk, reset,
						input logic[31:0] Instr, PC,
						output logic[31:0] Instr_out, PC_out
);
	always_ff@(posedge clk, posedge reset)
		if(reset) begin
			Instr_out = 32'b0;
			PC_out = 32'b0;
		end
		else begin
			Instr_out = Instr;
			PC_out = PC;
		end
		
endmodule 