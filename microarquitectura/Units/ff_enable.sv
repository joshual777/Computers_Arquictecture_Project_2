module ff_enable #(parameter n = 2)(input logic clk, reset, enable,
												 input logic [n-1:0] d,
												output logic [n-1:0] q);
												
												
	always_ff @(negedge clk, posedge reset)
		if (reset) q <= 0;
		else if (enable) q <= d;
		
endmodule 