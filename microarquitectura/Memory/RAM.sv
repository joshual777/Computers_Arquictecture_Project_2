module RAM (input logic clk, wboolean,
				input logic [31:0] address, wdata,
				output logic [31:0] rdata
);

				
	logic RAM1[27360:0];

	
	always_ff @(negedge clk)
		begin
			if (address >= 'd0 && address <= 'd57599)
				rdata = {31'b0, RAM1[address]};
			else
				rdata = 32'b0;
		end
	

	always_ff @(posedge clk)
		begin
			if (wboolean) 
				begin
					if (address >= 'd0 && address <= 'd57599)
						RAM1[address] <= wdata[0];
				end
		end
		
		

endmodule 