module EX (input clk, reset,FlagW,branchBoolean,immediateBoolean,regwBoolean,regwBoolean2,
			  input logic [31:0] A,B,
			  input logic [1:0] ALUControl,Cond_select,
			  input logic [3:0] regselector1,regselector2,regselectordest,regselectordest2,
			  input logic [31:0] FinalResult,FinalResult2,
			  output logic PC_select,
			  output logic [31:0] ALUResult,AOUT
);

logic flagN,flagZ,flagC,flagV;
logic [31:0] BOUT;

ForwardingUnit fu(branchBoolean,immediateBoolean,regwBoolean,regwBoolean2,
					regselector1, regselector2, regselectordest,regselectordest2,
					A,B, FinalResult,FinalResult2,
					AOUT, BOUT);

ALU #(32) alucpu (AOUT, BOUT,ALUControl, ALUResult,flagN,flagZ,flagC,flagV);

PC_condition pc_cond(clk, reset,branchBoolean,FlagW , {flagN,flagZ,flagV},Cond_select, PC_select);




endmodule 