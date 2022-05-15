module Register_File(input logic clk, regwBoolean, reset,
							input logic [3:0] regselector1, regselector2, regselector3, rwselector,
							input logic [23:0] rwdata,
							output logic [23:0] rdata1, rdata2, rdata3);

	integer i;
	logic [23:0] register [15:0];

	// Escribimos en negedge
	always_ff @(negedge clk, posedge reset) begin
		if (reset) begin
			for (i=0;i<16;i=i+1) begin
				register[i] = 24'b0;
			end
		end
		else begin
			if(regwBoolean) register[rwselector] = rwdata;
		end
	end
		
	// Leemos en posedge
	always_ff @(posedge clk, posedge reset)
	begin
		if (reset) begin
			rdata1 = 0;
			rdata2 = 0;
			rdata3 = 0;
		end
		else begin
			rdata1 = register[regselector1];
			rdata2 = register[regselector2];
			rdata3 = register[regselector3];
		end
	end
		
		
endmodule 