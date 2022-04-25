module Control_unit_test();
	logic branchBoolean,immediateBoolean, FlagW,regwBoolean, memwBoolean, MemrBoolean, Reg1_select;
	logic[1:0] Imm_select, ALUControl;
	logic[2:0] Code;
	
	Control_unit uut(branchBoolean,immediateBoolean,Code,FlagW,regwBoolean,memwBoolean,MemrBoolean,Reg1_select,Imm_select,ALUControl);
	
	initial begin
	//Prueba 1-branchBoolean=1
	branchBoolean = 1'd1;
	immediateBoolean = 1'd1;
	Code = 3'd1;
	#10;
	assert (Reg1_select === 1'd0 && ALUControl === 2'd0) $display("la prueba 1 se ejecuto correctamente"); else $display("La prueba 1 tiene algun error");
	#10;
	
	//Prueba 2-branchBoolean=2
	branchBoolean = 1'd1;
	immediateBoolean = 1'd0;
	Code = 3'd1;
	#10;
	assert (Reg1_select === 1'd0 && ALUControl === 2'd3) $display("la prueba 2 se ejecuto correctamente"); else $display("La prueba 2 tiene algun error");
	#10;
	
	//Prueba 3-Caso 1
	branchBoolean = 1'd0;
	immediateBoolean = 1'd0;
	Code = 3'd0;
	#10;
	assert (ALUControl === 2'd3 && Reg1_select === 1'd0) $display("la prueba para el case 1 se ejecuto correctamente"); else $display("Error en case 1");
	#10;
	
	//Prueba 4-Caso 2
	branchBoolean = 1'd0;
	immediateBoolean = 1'd0;
	Code = 3'd1;
	#10;
	assert (ALUControl === 2'd0 && regwBoolean === 1'b1 && Reg1_select === 1'd1 ) $display("la prueba para el case 2 se ejecuto correctamente"); else $display("Error en case 2");
	#10;
	
	//Prueba 5-Caso 3
	branchBoolean = 1'd0;
	immediateBoolean = 1'd0;
	Code = 3'd2;
	#10;
	assert (ALUControl === 2'd1 && regwBoolean === 1'b1 && Reg1_select === 1'd1) $display("la prueba para el case 3 se ejecuto correctamente"); else $display("Error en case 3");
	#10;
	
	
	//Prueba 6-Caso 4
	branchBoolean = 1'd0;
	immediateBoolean = 1'd0;
	Code = 3'd3;
	#10;
	assert (ALUControl === 2'd2 && regwBoolean === 1'b1 && Reg1_select === 1'd1) $display("la prueba para el case 4 se ejecuto correctamente"); else $display("Error en case 4");
	#10;
	
	//Prueba 7-Caso 5
	branchBoolean = 1'd0;
	immediateBoolean = 1'd0;
	Code = 3'b100;
	#10;
	assert (ALUControl === 2'b11 && regwBoolean === 1'b1 && Reg1_select === 1'd1) $display("la prueba para el case 5 se ejecuto correctamente"); else $display("Error en case 5");
	#10;
	
	//Prueba 8-Caso 6
	branchBoolean = 1'd0;
	immediateBoolean = 1'd0;
	Code = 3'b101;
	#10;
	assert (ALUControl === 2'b01 && FlagW === 1'b1 && Reg1_select === 1'd0) $display("la prueba para el case 6 se ejecuto correctamente"); else $display("Error en case 6");
	#10;
	
	
	//Prueba 9-Caso 7
	branchBoolean = 1'd0;
	immediateBoolean = 1'd0;
	Code = 3'b110;
	#10;
	assert (ALUControl === 2'b11 && memwBoolean === 1'b1 && Reg1_select === 1'd0) $display("la prueba para el case 7 se ejecuto correctamente"); else $display("Error en case 7");
	#10;
	
	//Prueba 10-Caso 8
	branchBoolean = 1'd0;
	immediateBoolean = 1'd0;
	Code = 3'b111;
	#10;
	assert (ALUControl === 2'b11 && regwBoolean === 1'b1 && MemrBoolean === 1'b1 && Reg1_select === 1'd0) $display("la prueba para el case 8 se ejecuto correctamente"); else $display("Error en case 8");
	#10;
	
	
	end
endmodule	
	
	
	
	
	
	
	