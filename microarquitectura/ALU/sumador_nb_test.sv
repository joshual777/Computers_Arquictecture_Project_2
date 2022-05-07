module sumador_nb_test();
	
		logic [N-1:0] a, b;
		logic ci;
		logic [N-1:0] sum;
		logic co;
		
		sumador_nb sumador(a,b,ci,sum,co);
		
		initial begin
		
		#20
		ci = 0;
		a = 4'b0011;
		b = 4'b0001;
		
		#20
		ci = 0;
		a = 4'b0011;
		b = 4'b0001;
		
		#20
		ci = 0;
		a = 4'b0011;
		b = 4'b0001;
		
		
		
		end

end module


