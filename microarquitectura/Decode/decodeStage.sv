module decodeStage (
	input logic clk, reset, regWeIn,
	input logic [23:0] instr, wbData,
	input logic [3:0] regToWriteIn,
	output logic pcWe, memWe, flagsWe, writeRegFromAlu, regWeOut,
	output logic [23:0] op1, op2, dataToWrite,
	output logic [3:0] regToWriteOut,
	output logic [2:0] aluMode
);


	logic is3ops, is3opsOrLS;
			
	logic [23:0] extendedImm, rdata1, rdata2, rdata3, muxBOut, preOp1, preOp2;
	
	logic [2:0] preAluMode, muxEOut;
	logic [3:0] preRegToWrite;
	
	assign is3ops = ~instr[23];
	assign is3opsOrLS = is3ops||instr[1];
	
	Register_File regFile(clk, reWeIn, instr[19:16], instr[15:12], instr[11:8], regToWriteIn,
									wbData, rdata1, rdata2, rdata3);
	Extender extImm(instr[11:4], extendedImm);
	
	// Muxes
	Mux2_1 muxA(instr[22:20], muxEOut, is3ops, preAluMode);
	Mux2_1 muxB(extendedImm, rdata3, instr[0], muxBOut);
	// No hay muxC
	Mux2_1 muxD(rdata2, rdata1, is3opsOrLS, preOp1);
	Mux2_1 muxE(3'b000, 3'b001, instr[1], muxEOut);
	Mux2_1 muxF(muxBOut, rdata2, is3opsOrLS, preOp2);
	// G,H,I en otro lugar
	Mux2_1 muxJ(4'b1011, instr[19:16], instr[23]&~instr[22]&~instr[21]&~instr[20], preRegToWrite);
	
	// Register 
	register #(1) pcWeReg(clk, reset, instr[23]&instr[22], pcWe);
	register #(1) memWeReg(clk, reset, instr[1], memWe);
	register #(24) dataToWriteReg(clk, reset, rdata1, dataToWrite);
	register #(4) regToWriteReg(clk, reset, preRegToWrite, regToWriteOut);
	register #(24) op1Reg(clk, reset, preOp1, op1);
	register #(24) op2Reg(clk, reset, preOp2, op2);
	register #(3) aluModeReg(clk, reset, preAluMode, aluMode);
	register #(1) flagsWeReg(clk, reset, instr[23]&~instr[22]&~instr[21]&~instr[20], flagsWe);
	register #(1) writeRegFromAluReg(clk, reset, ~instr[23]|(~instr[22]&~instr[21]&~instr[20]), writeRegFromAlu);
	register #(1) regWeReg(clk, reset, ~instr[23]|(instr[23]&instr[22])|(~instr[22]&~instr[21]&~instr[20]), regWeOut);
	
endmodule