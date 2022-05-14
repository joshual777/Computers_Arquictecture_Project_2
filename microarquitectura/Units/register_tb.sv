module register_tb();

	logic clk;
	logic reset;
	logic [N-1:0] entrada, salida;
	
	// instantiate device to be tested
	top dut(clk, reset, entrada, salida);
	
	// initialize test
	initial
	
	begin
		reset <= 1; # 22; reset <= 0;
	end
	
	// generate clock to sequence tests
	always
	begin
		clk <= 1; # 5; clk <= 0; # 5;
	end
	
	// check that 7 gets written to address 0x64 at end of program
	always @(negedge clk)
	begin
		if(salida) 
		begin
			if(entrada === 100 & salida === 7) 
				begin
					$display("Simulation succeeded");
					$stop;
				end 
				
				else if (salida !== 96) 
				begin
					$display("Simulation failed");
					$stop;
				end
		end
	end
	
endmodule