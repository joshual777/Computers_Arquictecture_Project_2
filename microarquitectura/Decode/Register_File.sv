module Register_File(input logic clk, regwBoolean,
							input logic [3:0] regselector1, regselector2, rwselector,
							input logic [31:0] rwdata,PCPlus2,
							output logic [31:0] rdata1, rdata2);


	logic [31:0] register[14:0];

	always_ff @(negedge clk)
		if (regwBoolean) register[rwselector] = rwdata;
		assign rdata1 = register[regselector1];
		assign rdata2 = (regselector2== 4'b1111) ? PCPlus2 : register[regselector2];
		
		
endmodule 