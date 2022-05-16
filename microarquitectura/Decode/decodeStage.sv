module decodeStage (
	input logic clk, reset, regWeIn,
	input logic [23:0] instr, wbData, pcm4,
	input logic [3:0] regToWriteIn,
	output logic pcWe, memWe, flagsWe, writeRegFromAlu, regWeOut,
	output logic [23:0] op1, op2, dataToWrite, pcm4Out,
	output logic [3:0] regToWriteOut,
	output logic [2:0] aluMode
);


	logic is3ops, is3opsOrLS, prePcWe;
			
	logic [23:0] outMuxN, extendedImm, rdata1, rdata2, rdata3, muxBOut, preOp1, preOp2;
	
	logic [2:0] preAluMode, muxEOut;
	logic [3:0] preRegToWrite, outMuxL;
	
	assign is3ops = ~instr[23];
	assign is1op = instr[23] && instr[22];
	assign is3opsOrLS = is3ops || instr[1] || is1op;
	
	Register_File regFile(clk, reWeIn, reset, outMuxL, instr[15:12], instr[11:8], regToWriteIn,
									wbData, rdata1, rdata2, rdata3);
	Extender extImm(instr[11:4], extendedImm);
	
	// Muxes
	Mux2_1 #(3) muxA(instr[22:20], muxEOut, is3ops, preAluMode);
	Mux2_1 #(24) muxB(extendedImm, rdata3, instr[0]|instr[1], muxBOut);
	// No hay muxC
	Mux2_1 #(24) muxD(rdata2, rdata1, is3opsOrLS, preOp1);
	Mux2_1 #(3) muxE(3'b000, 3'b001, instr[2]|instr[1]|instr[0], muxEOut);
	Mux2_1 #(24) muxF(muxBOut, outMuxN, is3opsOrLS, preOp2);
	// G,H,I en otro lugar
	Mux2_1 #(4) muxJ(4'b1011, instr[19:16], instr[23]&~instr[22]&~instr[21]&~instr[20], preRegToWrite);
	// K en otro lugar
	Mux2_1 #(4) muxL(4'b1011, instr[19:16], instr[23]&instr[22]&(instr[21]|instr[20]), outMuxL);
	Mux4_1 #(1) muxM(instr[23]&instr[22], rdata1[2], rdata1[3], ~rdata1[3] & ~rdata1[2], 
						{instr[23]&instr[22]&instr[21], instr[23]&instr[22]&instr[20]},
						prePcWe);
	Mux2_1 #(24) muxN(24'b0, rdata2, ~(instr[0]&instr[1]), outMuxN);
	
	// Pipeline regs 
	register #(1) pcWeReg(clk, reset, prePcWe, pcWe);
	register #(1) memWeReg(clk, reset, instr[23]&~instr[22]&instr[21]&~instr[20], memWe);
	register #(24) dataToWriteReg(clk, reset, rdata1, dataToWrite);
	register #(4) regToWriteReg(clk, reset, preRegToWrite, regToWriteOut);
	register #(24) op1Reg(clk, reset, preOp1, op1);
	register #(24) op2Reg(clk, reset, preOp2, op2);
	register #(3) aluModeReg(clk, reset, preAluMode, aluMode);
	register #(1) flagsWeReg(clk, reset, instr[23]&~instr[22]&~instr[21]&~instr[20], flagsWe);
	register #(1) writeRegFromAluReg(clk, reset, ~instr[23]|(~instr[22]&~instr[21]&~instr[20]), writeRegFromAlu);
	register #(1) regWeReg(clk, reset, ~instr[23]|(~instr[22]&~instr[21]), regWeOut);
	register #(24) pcm4reg(clk, reset, pcm4, pcm4Out);
	
	
endmodule