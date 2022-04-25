module ID_Pipeline(input logic clk, reset,regwBoolean,FlagW, memwBoolean, MemrBoolean,branchBoolean,immediateBoolean,
			  input logic [31:0] A,B,
			  input logic [1:0] ALUControl,Cond_select,
			  input logic [3:0] regselector1,regselector2,regselectordest,
			  output logic regwBooleanOUT,FlagWOUT, memwBooleanOUT, MemrBooleanOUT,branchBooleanOUT,immediateBooleanOUT,
			  output logic [31:0] AOUT,BOUT,
			  output logic [1:0] ALUControlOUT, Cond_selectOUT,
			  output logic [3:0] regselector1OUT,regselector2OUT,regselectordestOUT
);
	always_ff@(posedge clk, posedge reset)
		if(reset) begin
			regwBooleanOUT=0;
			FlagWOUT=0;
			memwBooleanOUT=0;
			MemrBooleanOUT=0;
			branchBooleanOUT=0;
			immediateBooleanOUT=0;
			AOUT=0;
			BOUT=0;
			ALUControlOUT=0;
			Cond_selectOUT=0;
			regselector1OUT=0;
			regselector2OUT=0;
			regselectordestOUT=0;
		end
		else begin
			regwBooleanOUT=regwBoolean;
			FlagWOUT=FlagW;
			memwBooleanOUT=memwBoolean;
			MemrBooleanOUT=MemrBoolean;
			branchBooleanOUT=branchBoolean;
			immediateBooleanOUT=immediateBoolean;
			AOUT=A;
			BOUT=B;
			ALUControlOUT=ALUControl;
			Cond_selectOUT=Cond_select;
			regselector1OUT=regselector1;
			regselector2OUT=regselector2;
			regselectordestOUT=regselectordest;
		end
		
endmodule 