module restador_nb_test ();
	logic [1:0] a, b;
	logic ci;
	logic co;
	logic [1:0] rest;
	restador_nb #(2) uut (a,b,ci, rest,co);

	initial begin
		a=11; b=01; ci=1;
		#10;
		a=00; b=11; ci=1;
		#10;
		a=00; b=11; ci=0;
		#10;
		a=11; b=11; ci=1;
		#10;
	end


endmodule 