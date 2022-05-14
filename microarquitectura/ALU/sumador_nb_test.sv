module sumador_nb_test();
		
		logic [24:0] a, b;
		logic ci;
		logic [24:0] sum;
		logic co;
		
		sumador_nb #(24)sumador(a,b,ci,sum,co);
		
		initial begin
		
		#20;
		ci = 0;
		a = 24'b0011;
		b = 24'b0001;
		
		#20;
		ci = 0;
		a = 24'b0011;
		b = 24'b0001;
		
		#20;
		ci = 0;
		a = 24'b0011;
		b = 24'b0001;
		
	   end

endmodule


