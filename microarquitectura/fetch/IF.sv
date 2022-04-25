module IF (input logic clk, reset, PC_selec,
				input logic [31:0] jumpResult,
				output logic [31:0] PC, Instr
);

logic [31:0] PCNext,PCPlus1;

Mux2_1 #(32) pcmux(PCPlus1, jumpResult, PC_selec, PCNext);
PC #(32) pc(clk, reset, PCNext, PC);

logic coadd1;
sumador_nb #(32) sump1(PC, 32'b1,1'b0, PCPlus1, coadd1);

Instruction_Memory im(PC, Instr);

endmodule 