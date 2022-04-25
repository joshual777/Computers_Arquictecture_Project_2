module ForwardingUnit ( input	logic branchBoolean,immediateBoolean,regwBoolean,regwBoolean2,
								input logic [3:0] R1, R2, Rdest,Rdest2,
								input logic [31:0] A,B, FinalResult,FinalResult2,
								output logic [31:0] AOUT, BOUT
);
logic [31:0] AOUT1,BOUT1;

Mux2_1 #(32) Amux(A,FinalResult, !branchBoolean & (R1==Rdest) & regwBoolean, AOUT1);
Mux2_1 #(32) Bmux(B,FinalResult, !immediateBoolean & (R2==Rdest) & regwBoolean, BOUT1);

Mux2_1 #(32) Amux2(AOUT1,FinalResult2, !branchBoolean & (R1==Rdest2) & regwBoolean2, AOUT);
Mux2_1 #(32) Bmux2(BOUT1,FinalResult2, !immediateBoolean & (R2==Rdest2) & regwBoolean2, BOUT);
	

endmodule 