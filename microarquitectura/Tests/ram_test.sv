`timescale 1ps/1ps
module ram_test();

	//logic [23:0] address, out, writeData;
	logic [7:0] address, out, writeData;
	logic we, clk;

	ram data_memory(address, clk, writeData, we, out);

	always
		#5 clk = !clk;

	initial begin
		clk = 0;
		address = 8'h01;
		writeData = 0;
		we = 0;
		#20
		$finish;
	end

endmodule