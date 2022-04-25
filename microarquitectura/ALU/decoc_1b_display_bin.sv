module decoc_1b_display_bin (input logic   bitin,  output logic [6:0] bitsout);
	 
	 always_comb
	  case (bitin)
		1'b0 : bitsout = 7'b0000001;   
		1'b1 : bitsout = 7'b1001111;
		default : bitsout = 7'b1;
    endcase

endmodule 