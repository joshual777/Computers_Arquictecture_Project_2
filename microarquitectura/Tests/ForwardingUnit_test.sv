module ForwardingUnit_test();
	logic branchBoolean,immediateBoolean,regwBoolean,regwBoolean2;
	logic [3:0] R1, R2, Rdest,Rdest2;
	logic [31:0] A,B, FinalResult,FinalResult2, AOUT, BOUT;
	
	ForwardingUnit uut( branchBoolean,immediateBoolean,regwBoolean,regwBoolean2, R1, R2, Rdest,Rdest2, A,B, FinalResult,FinalResult2, AOUT, BOUT);
	
	initial begin
	//Prueba 1-Se cumplen todas las condiciones para que salga Final Result
	branchBoolean = 1'd0;
	immediateBoolean = 1'd0;
	R1 = 3'd2;
	R2 = 3'd2;
	Rdest = 3'd2;
	Rdest2 = 3'd2;
	regwBoolean = 1'd1;
	regwBoolean2 = 1'd1;
	A = 32'd10;
	B = 32'd11;
	FinalResult = 32'd8;
	FinalResult2 = 32'd5;
	#10;
	assert ( AOUT === 32'd5 && BOUT === 32'd5) $display("Se cumplen todas las condiciones para ambos FinalResult"); else $display("NO se cumplen todas las condiciones para ambos FinalResult");
	#10;
	
	//Prueba 2-No se cumple alguna condicion para FinalResult1
	branchBoolean = 1'd1;
	immediateBoolean = 1'd0;
	R1 = 3'd2;
	R2 = 3'd2;
	Rdest = 3'd2;
	Rdest2 = 3'd2;
	regwBoolean = 1'd1;
	regwBoolean2 = 1'd1;
	A = 32'd10;
	B = 32'd11;
	FinalResult = 32'd8;
	FinalResult2 = 32'd5;
	#10;
	assert ( AOUT === 32'd10 && BOUT === 32'd5) $display("Se cumplen todas las condiciones para FinalResul2. Sale A en el caso 1"); else $display("NO se cumplen todas las condiciones para ambos FinalResult2 o no sale A en el caso 1");
	#10;
	
	
	//Prueba 3-No se cumple alguna condicion para FinalResult2
	branchBoolean = 1'd0;
	immediateBoolean = 1'd1;
	R1 = 3'd2;
	R2 = 3'd2;
	Rdest = 3'd2;
	Rdest2 = 3'd2;
	regwBoolean = 1'd1;
	regwBoolean2 = 1'd1;
	A = 32'd10;
	B = 32'd11;
	FinalResult = 32'd8;
	FinalResult2 = 32'd5;
	#10;
	assert ( AOUT === 32'd5 && BOUT === 32'd11) $display("Se cumplen todas las condiciones para FinalResul. Sale B en el caso 2"); else $display("NO se cumplen todas las condiciones para ambos FinalResult1 o no sale B en el caso 2");
	#10;
	
	//Prueba 4-No se cumple alguna condicion para FinalResult1 ni para FinalResult2
	branchBoolean = 1'd1;
	immediateBoolean = 1'd1;
	R1 = 3'd2;
	R2 = 3'd2;
	Rdest = 3'd2;
	Rdest2 = 3'd2;
	regwBoolean = 1'd1;
	regwBoolean2 = 1'd1;
	A = 32'd10;
	B = 32'd11;
	FinalResult = 32'd8;
	FinalResult2 = 32'd5;
	#10;
	assert ( AOUT === 32'd10 && BOUT === 32'd11) $display("Se cumplen todas las condiciones. Las salidas son A y B"); else $display("NO se cumplen todas las condiciones esperadas. Alguna salida falla");
	#10;
	
	//Prueba 5-Sale finalResult1 en A
	branchBoolean = 1'd0;
	immediateBoolean = 1'd0;
	R1 = 3'd2;
	R2 = 3'd2;
	Rdest = 3'd2;
	Rdest2 = 3'd2;
	regwBoolean = 1'd1;
	regwBoolean2 = 1'd0;
	A = 32'd10;
	B = 32'd11;
	FinalResult = 32'd8;
	FinalResult2 = 32'd5;
	#10;
	assert ( AOUT === 32'd8 && BOUT === 32'd8) $display("Se cumple que sale finalResult1"); else $display("NO sale finalResult1 como se esperaba");
	#10;
	
	
end
endmodule

	