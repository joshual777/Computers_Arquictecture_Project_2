module Processor ( input logic clk, reset, swinit,
				output logic GPIO, GPIOBoolean
		
);


	logic [31:0] PC_IF, Instr_IF;
	
	logic [31:0] PC_IF_PIPE, Instr_IF_PIPE;
	
	logic regwBoolean_ID,FlagW_ID, memwBoolean_ID, MemrBoolean_ID,branchBoolean_ID, immediateBoolean_ID;
	logic [31:0] A_ID,B_ID;
	logic [1:0] ALUControl_ID, condition_select_ID;
	logic [3:0] regselector1_ID,regselector2_ID,regselectordest_ID;
	
	logic regwBoolean_ID_PIPE,FlagW_ID_PIPE, memwBoolean_ID_PIPE, MemrBoolean_ID_PIPE,branchBoolean_ID_PIPE,immediateBoolean_ID_PIPE;
	logic [31:0] A_ID_PIPE,B_ID_PIPE;
	logic [1:0] ALUControl_ID_PIPE, condition_select_ID_PIPE;
	logic [3:0] regselector1_ID_PIPE,regselector2_ID_PIPE,regselectordest_ID_PIPE;
	
	logic PC_select_EX;
	logic [31:0] ALUResult_EX,A_EX;
	
	logic regwBoolean_EX_PIPE, memwBoolean_EX_PIPE, MemrBoolean_EX_PIPE;
	logic [31:0] A_EX_PIPE,ALUResult_EX_PIPE;
	logic [3:0] regselectordest_EX_PIPE;
	
	logic [31:0] FinalResult_MEM;
	
	logic regwBoolean_WB;
	logic [31:0] FinalResult_WB;
	logic [3:0] regselectordest_WB;


	IF IF_module (clk, reset, PC_select_EX,
		ALUResult_EX,
		PC_IF, Instr_IF
	);

	
	


	IF_Pipeline IF_Pipeline_module(clk, reset | PC_select_EX,
					Instr_IF, PC_IF,
					Instr_IF_PIPE, PC_IF_PIPE
	);

	
	
	
	
	ID id_module (clk, reset,regwBoolean_WB,
	  regselectordest_WB,
		PC_IF_PIPE, Instr_IF_PIPE, FinalResult_WB,
		regwBoolean_ID,FlagW_ID, memwBoolean_ID, MemrBoolean_ID,branchBoolean_ID,immediateBoolean_ID,
		A_ID,B_ID,
		ALUControl_ID, condition_select_ID,
		regselector1_ID,regselector2_ID,regselectordest_ID
	);



	

  ID_Pipeline ID_Pipeline_module(clk, reset,regwBoolean_ID,FlagW_ID, memwBoolean_ID, MemrBoolean_ID,branchBoolean_ID,immediateBoolean_ID,
			  A_ID,B_ID,
			  ALUControl_ID,condition_select_ID,
			   regselector1_ID,regselector2_ID,regselectordest_ID,
			   regwBoolean_ID_PIPE,FlagW_ID_PIPE, memwBoolean_ID_PIPE, MemrBoolean_ID_PIPE,branchBoolean_ID_PIPE,immediateBoolean_ID_PIPE,
			  A_ID_PIPE,B_ID_PIPE,
			  ALUControl_ID_PIPE, condition_select_ID_PIPE,
			  regselector1_ID_PIPE,regselector2_ID_PIPE,regselectordest_ID_PIPE
	);



	

	EX  EX_module(clk, reset,FlagW_ID_PIPE,branchBoolean_ID_PIPE,immediateBoolean_ID_PIPE,regwBoolean_WB,regwBoolean_EX_PIPE,
		  A_ID_PIPE,B_ID_PIPE,
		  ALUControl_ID_PIPE,condition_select_ID_PIPE,
		  regselector1_ID_PIPE,regselector2_ID_PIPE,regselectordest_WB,regselectordest_EX_PIPE,
		  FinalResult_WB,FinalResult_MEM,
		  PC_select_EX,
		  ALUResult_EX,A_EX
	);

	
	
	
	
	EX_Pipeline EX_Pipeline_module (clk, reset,regwBoolean_ID_PIPE, memwBoolean_ID_PIPE, MemrBoolean_ID_PIPE,
				  A_EX,ALUResult_EX,
				  regselectordest_ID_PIPE,
				  regwBoolean_EX_PIPE, memwBoolean_EX_PIPE, MemrBoolean_EX_PIPE,
				  A_EX_PIPE,ALUResult_EX_PIPE,
				  regselectordest_EX_PIPE
	);


	
	
		
	MEM MEM_module(clk, memwBoolean_EX_PIPE, MemrBoolean_EX_PIPE, swinit,
		  A_EX_PIPE,ALUResult_EX_PIPE,
		  GPIO,GPIOBoolean,
		  FinalResult_MEM
	);


	
	
	MEM_Pipeline MEM_WB_Pipeline_module (clk, reset,regwBoolean_EX_PIPE,
				  FinalResult_MEM,
				  regselectordest_EX_PIPE,
				  regwBoolean_WB,
				  FinalResult_WB,
				  regselectordest_WB
	);
	
	
endmodule 