module Processor_test();

	logic clk, reset, swinit;
	logic  GPIO, GPIOBoolean;
	
	Processor uut(clk, reset, swinit, GPIO, GPIOBoolean);
	

	initial begin
		clk=0; reset=0; swinit=0; #3;
		reset=1; #3;
		reset=0; #3;
	end
	
	
	always begin
		clk=!clk; #10;
	end
	
endmodule 