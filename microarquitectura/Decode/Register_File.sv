module Register_File(input logic clk, regwBoolean,
							input logic [3:0] regselector1, regselector2, regselector3, rwselector,
							input logic [31:0] rwdata,
							output logic [31:0] rdata1, rdata2, rdata3);


	logic [23:0] register [15:0];
	
	// Escribimos en negedge
	always_ff @(negedge clk)
		if(regwBoolean) register[rwselector] = rwdata;
		
	// Leemos en posedge
	always_ff @(posedge clk)
	begin
		rdata1 = register[regselector1];
		rdata2 = register[regselector2];
		rdata3 = register[regselector3];
	end
		
		
endmodule 