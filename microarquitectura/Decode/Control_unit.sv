module Control_unit(input logic branchBoolean,immediateBoolean,
					input logic [2:0] Code,
					output logic  FlagW,regwBoolean, memwBoolean, MemrBoolean,Reg1_select,
					output logic [1:0] Imm_select, ALUControl);
					

	always_comb begin 
		Imm_select={branchBoolean,Code[2]};
		memwBoolean=0;
		regwBoolean=0;
		MemrBoolean=0;
		FlagW = 1'b0; 
		if (!branchBoolean) begin
			case(Code)
				//STTL
				3'b000: begin ALUControl = 2'b11;  end  // ADD
				//ADD
				3'b001: begin ALUControl = 2'b00; regwBoolean=1'b1; end // ADD
				//SUB
				3'b010: begin ALUControl = 2'b01; regwBoolean=1'b1; end // SUB
				//MUL
				3'b011: begin ALUControl = 2'b10; regwBoolean=1'b1;end // MUL
				//MOV
				3'b100: begin 	ALUControl = 2'b11; regwBoolean=1'b1; end // Pass B
				//CMP
				3'b101: begin ALUControl = 2'b01; FlagW=1'b1; end //SUB
				//STR
				3'b110: begin ALUControl = 2'b11;  memwBoolean=1'b1; end // Pass B
				//LD
				3'b111: begin ALUControl = 2'b11;  regwBoolean=1'b1; MemrBoolean=1'b1;  end// Pass B
				default: ALUControl = 2'bx; 
			endcase
			Reg1_select= MemrBoolean ^ regwBoolean;
		end
		else begin
			Reg1_select=0;
			ALUControl = (immediateBoolean) ? {1'b0,Code[2]} : 2'b11 ; 
		end
	end
endmodule 

