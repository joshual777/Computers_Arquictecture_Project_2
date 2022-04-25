module ALU_test();
	logic[3:0] a, b, result;
	logic[3:0] selec_alu;
	logic ci,flagN,flagZ,flagC, flagV;



	ALU #(4) uut (a, b, ci,selec_alu, result,flagN,flagZ,flagC,flagV);
	
	initial begin
	
	//suma

	selec_alu = 4'b0000;
	
	a = 4'b0111;
	b = 4'b0110;
	ci=1'b1;
	#10;   assert(flagC ===1'b0 && result === 4'b1110) $display("la prueba 1 de suma termina correctamente"); else $display("error en la prueba 1 de suma");
	#10;
		
	a = 4'b0000;
	b = 4'b1111;
	ci=1'b0;
	#10;   assert(flagC ===1'b0 && result === 4'b1111) $display("la prueba 2 de suma termina correctamente"); else $display("error en la prueba 2 de suma");
	#10;
		
	a = 4'b1111;
	b = 4'b0001;
	ci=1'b0;
	#10;   assert(flagC ===1'b1 && result === 4'b0000) $display("la prueba 3 de suma termina correctamente"); else $display("error en la prueba 3 de suma");
	#10;
		
	a = 4'b1010;
	b = 4'b1001;
	ci=1'b1;
	#10;   assert(flagC ===1'b1 && result === 4'b0100) $display("la prueba 4 de suma termina correctamente"); else $display("error en la prueba 4 de suma");
	#10;
	

	//resta
	selec_alu = 4'b0001;
		
	a = 4'b1000;
	b = 4'b0110;
	ci=1'b1;
	#10;   assert(flagC ===1'b0 && result === 4'b0001) $display("la prueba 1 de resta termina correctamente"); else $display("error en la prueba 1 de resta");
	#10;	
	
	a = 4'b1110;
	b = 4'b1110;
	ci=1'b0;
	#10;   assert(flagC ===1'b0 && result === 4'b0000) $display("la prueba 2 de resta termina correctamente"); else $display("error en la prueba 2 de resta");
	#10;	
	
	a = 4'b1000;
	b = 4'b1110;
	ci=1'b1;
	#10;   assert(flagC ===1'b1 && result === 4'b1001) $display("la prueba 3 de resta termina correctamente"); else $display("error en la prueba 3 de resta");
	#10;	
	
	a = 4'b0001;
	b = 4'b1000;
	ci=1'b0;
	#10;   assert(flagC ===1'b1 && result === 4'b1001) $display("la prueba 4 de resta termina correctamente"); else $display("error en la prueba 4 de resta");
	#10;
		
	
	//multiplicacion
	selec_alu = 4'b0010;
	
	
	a = 4'b1010;
	b = 4'b0110;
	#10;   assert(flagV ===1'b1 && result === 4'b1100) $display("la prueba 1 de multiplicacion termina correctamente"); else $display("error en la prueba 1 de multiplicacion");
	#10;
		
	a = 4'b0010;
	b = 4'b0110;
	#10;   assert(flagV ===1'b0 && result === 4'b1100) $display("la prueba 2 de multiplicacion termina correctamente"); else $display("error en la prueba 2 de multiplicacion");
	#10;
		
	a = 4'b0001;
	b = 4'b0111;
	#10;   assert(flagV ===1'b0 && result === 4'b0111) $display("la prueba 3 de multiplicacion termina correctamente"); else $display("error en la prueba 3 de multiplicacion");
	#10;
		
	a = 4'b0000;
	b = 4'b0011;
	#10;   assert(flagV ===1'b0 && result === 4'b0000) $display("la prueba 4 de multiplicacion termina correctamente"); else $display("error en la prueba 4 de multiplicacion");
	#10;
		
			
	
	//division
	selec_alu = 4'b0011;
	
	
	a = 4'b0100;
	b = 4'b0010;
	#10;   assert(result === 4'b0010) $display("la prueba 1 de division termina correctamente"); else $display("error en la prueba 1 de division");
	#10;
		
	a = 4'b1000;
	b = 4'b0001;
	#10;   assert(result === 4'b1000) $display("la prueba 2 de division termina correctamente"); else $display("error en la prueba 2 de division");
	#10;
		
	a = 4'b1110;
	b = 4'b0011;
	#10;   assert(result === 4'b0100) $display("la prueba 3 de division termina correctamente"); else $display("error en la prueba 3 de division");
	#10;
		
	a = 4'b0111;
	b = 4'b0010;
	#10;   assert(result === 4'b0011) $display("la prueba 4 de division termina correctamente"); else $display("error en la prueba 4 de division");
	#10;

	

	
	//modulo
	
	selec_alu = 4'b0100;
 
	
	
	a = 4'b0111;
	b = 4'b0010;
	#10;   assert(result === 4'b0001) $display("la prueba 1 de modulo termina correctamente"); else $display("error en la prueba 1 de modulo");
	#10;
		
	a = 4'b1010;
	b = 4'b0110;
	#10;   assert(result === 4'b0100) $display("la prueba 2 de modulo termina correctamente"); else $display("error en la prueba 2 de modulo");
	#10;
		
	a = 4'b1010;
	b = 4'b0010;
	#10;   assert(result === 4'b0000) $display("la prueba 3 de modulo termina correctamente"); else $display("error en la prueba 3 de modulo");
	#10;
		
	a = 4'b1000;
	b = 4'b0101;
	#10;   assert(result === 4'b0011) $display("la prueba 4 de modulo termina correctamente"); else $display("error en la prueba 4 de modulo");
	#10;
	
	//and
	
	selec_alu = 4'b0101;
	
	
	a = 4'b1110;
	b = 4'b0111;
	#10;   assert(result === 4'b0110) $display("la prueba 1 de and termina correctamente"); else $display("error en la prueba 1 de and");
	#10;
		
	a = 4'b1111;
	b = 4'b0000;
	#10;   assert(result === 4'b0000) $display("la prueba 2 de and termina correctamente"); else $display("error en la prueba 2 de and");
	#10;
		
	a = 4'b1001;
	b = 4'b1110;
	#10;   assert(result === 4'b1000) $display("la prueba 3 de and termina correctamente"); else $display("error en la prueba 3 de and");
	#10;
		
	a = 4'b1111;
	b = 4'b1111;
	#10;   assert(result === 4'b1111) $display("la prueba 4 de and termina correctamente"); else $display("error en la prueba 4 de and");
	#10;
	
	
	//or
	
	
	selec_alu = 4'b0110;
	
	a = 4'b1001;
	b = 4'b0110;
	#10;   assert(result === 4'b1111) $display("la prueba 1 de or termina correctamente"); else $display("error en la prueba 1 de or");
	#10;
		
	a = 4'b0010;
	b = 4'b1000;
	#10;   assert(result === 4'b1010) $display("la prueba 2 de or termina correctamente"); else $display("error en la prueba 2 de or");
	#10;
		
	a = 4'b0011;
	b = 4'b0111;
	#10;   assert(result === 4'b0111) $display("la prueba 3 de or termina correctamente"); else $display("error en la prueba 3 de or");
	#10;
		
	a = 4'b1010;
	b = 4'b1110;
	#10;   assert(result === 4'b1110) $display("la prueba 4 de or termina correctamente"); else $display("error en la prueba 4 de or");
	#10;
	 
	//xor
	
	selec_alu = 4'b0111;
	
	
	
	a = 4'b1010;
	b = 4'b1100;
	#10;   assert(result === 4'b0110) $display("la prueba 1 de xor termina correctamente"); else $display("error en la prueba 1 de xor");
	#10;
		
	a = 4'b1111;
	b = 4'b1000;
	#10;   assert(result === 4'b0111) $display("la prueba 2 de xor termina correctamente"); else $display("error en la prueba 2 de xor");
	#10;
		
	a = 4'b0011;
	b = 4'b0011;
	#10;   assert(result === 4'b0000) $display("la prueba 3 de xor termina correctamente"); else $display("error en la prueba 3 de xor");
	#10;
	
		
	a = 4'b0000;
	b = 4'b1111;
	#10;   assert(result === 4'b1111) $display("la prueba 4 de xor termina correctamente"); else $display("error en la prueba 4 de xor");
	#10;
	
	
	//shiftL
	
		
	selec_alu = 4'b1000;
	
	
	
	a = 4'b1111;
	#10;   assert(result === 4'b1110) $display("la prueba 1 de shiftL termina correctamente"); else $display("error en la prueba 1 de shiftL");
	#10;
		
	a = 4'b1010;
	#10;   assert(result === 4'b0100) $display("la prueba 2 de shiftL termina correctamente"); else $display("error en la prueba 2 de shiftL");
	#10;
		
	a = 4'b0011;
	#10;   assert(result === 4'b0110) $display("la prueba 3 de shiftL termina correctamente"); else $display("error en la prueba 3 de shiftL");
	#10;
		
	a = 4'b0001;
	#10;   assert(result === 4'b0010) $display("la prueba 4 de shiftL termina correctamente"); else $display("error en la prueba 4 de shiftL");
	#10;
	
	
	
	//shiftR
	
	
	
	selec_alu = 4'b1001;
	
	
	
	a = 4'b1111;
	#10;   assert(result === 4'b0111) $display("la prueba 1 de shiftR termina correctamente"); else $display("error en la prueba 1 de shiftR");
	#10;
		
	a = 4'b1010;
	#10;   assert(result === 4'b0101) $display("la prueba 2 de shiftR termina correctamente"); else $display("error en la prueba 2 de shiftR");
	#10;
		
	a = 4'b0011;
	#10;   assert(result === 4'b0001) $display("la prueba 3 de shiftR termina correctamente"); else $display("error en la prueba 3 de shiftR");
	#10;
		
	a = 4'b0001;
	#10;   assert(result === 4'b0000) $display("la prueba 4 de shiftR termina correctamente"); else $display("error en la prueba 4 de shiftR");
	#10;
	

	end
	
endmodule 