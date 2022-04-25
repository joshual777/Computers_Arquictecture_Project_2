module ID_test();
	logic clk, reset;

	logic [31:0] PC_IF_PIPE, Instr_IF_PIPE;

	logic regwBoolean_ID,FlagW_ID, memwBoolean_ID, MemrBoolean_ID,branchBoolean_ID, immediateBoolean_ID;
	logic [31:0] A_ID,B_ID;
	logic [1:0] ALUControl_ID, condition_select_ID;
	logic [3:0] regselector1_ID,regselector2_ID,regselectordest_ID;

	logic regwBoolean_WB;
	logic [31:0] FinalResult_WB;
	logic [3:0] regselectordest_WB;


	ID id_module (clk, reset,regwBoolean_WB,
	  regselectordest_WB,
		PC_IF_PIPE, Instr_IF_PIPE, FinalResult_WB,
		regwBoolean_ID,FlagW_ID, memwBoolean_ID, MemrBoolean_ID,branchBoolean_ID,immediateBoolean_ID,
		A_ID,B_ID,
		ALUControl_ID, condition_select_ID,
		regselector1_ID,regselector2_ID,regselectordest_ID
	);





	initial begin
		clk=0; reset=0; FinalResult_WB=0; regselectordest_WB=0; regwBoolean_WB=0; #3;
		reset=1; #3;
		reset=0; PC_IF_PIPE=0; Instr_IF_PIPE='h48800004;  #10;
		Instr_IF_PIPE='h49000008;  #10;
		Instr_IF_PIPE='h01880002;	#10;
		Instr_IF_PIPE='h09800023;	#10;
		Instr_IF_PIPE='h2A000021;	#10;
		Instr_IF_PIPE='h50900000;	#10;
	end
	
	
	always begin
		clk=!clk; #10;
	end
	
endmodule 