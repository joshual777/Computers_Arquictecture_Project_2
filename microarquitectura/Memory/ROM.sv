module ROM (input logic [31:0] address,
				output logic [31:0] rdata);
			
	logic [7:0] ROM[719:0];
	
	initial begin
		$readmemh("ROM.txt",ROM);
	end
	
	assign rdata={24'b0,ROM[address]}; 
	
	
endmodule 