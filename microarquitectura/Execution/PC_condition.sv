module PC_condition(input logic clk, reset,branchBoolean,FlagW, 
							  input logic[2:0] Flagsin,
							  input logic [1:0] Cond_select,
							  output logic PC_select
);


	logic [2:0] Flags;
	logic CondBoolean;
	logic neg, zero, overflow;
	
	ff_enable #(3)flagff(clk, reset, FlagW,Flagsin[2:0], Flags);

		logic  ge;
		assign {neg, zero, overflow} = Flags;
		assign ge = (neg == overflow);
		
		always_comb begin
			case(Cond_select)
				2'b00: CondBoolean = ~zero & ge; // GTE
				2'b01: CondBoolean = ge; // GE
				2'b10: CondBoolean = zero; // EQ
				2'b11: CondBoolean = 1'b1; // Always
				default: CondBoolean = 1'bx; // undefined
			endcase
			PC_select = CondBoolean & branchBoolean;
		end

	
endmodule

	
