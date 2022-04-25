module ID (input logic clk, reset,regwBooleanIn,
			  input logic [3:0] regselectordestIn,
			  input logic [31:0] PC, Instr, FinalResult,
			  output logic regwBooleanOut,FlagW, memwBoolean, MemrBoolean,branchBoolean,immediateBoolean,
			  output logic [31:0] A,B,
			  output logic [1:0] ALUControl, condition_select,
			  output logic [3:0] regselector1,regselector2,regselectordestOUT
);


assign branchBoolean=Instr[31];
assign immediateBoolean=Instr[27];
assign condition_select=Instr[29:28];
assign regselector2=Instr[22:19];

logic Reg1_select,coadd1;
logic [1:0] Imm_select;

logic [31:0] Immediate,PCPlus2 ;

logic [31:0] reg1data, reg2data;

Control_unit control (Instr[31],immediateBoolean,Instr[30:28],
					FlagW,regwBooleanOut, memwBoolean, MemrBoolean,Reg1_select,
					Imm_select,
					ALUControl);

Extender extend(Instr [26:0],
					Imm_select,
					Immediate);


Mux2_1 #(4) pcreg1(Instr[26:23], Instr[3:0], Reg1_select , regselector1);		
Mux2_1 #(4) pcdest(Instr[26:23], Instr[22:19], MemrBoolean , regselectordestOUT);

sumador_nb #(32) sump2(PC, 32'd2,1'b0, PCPlus2, coadd1);
					
Register_File rf(clk, regwBooleanIn, regselector1,regselector2,regselectordestIn, FinalResult,PCPlus2, reg1data,  reg2data);

Mux2_1 #(32) Amux(reg1data, PC, branchBoolean, A);
Mux2_1 #(32) Bmux(reg2data, Immediate, immediateBoolean, B);
			


endmodule 