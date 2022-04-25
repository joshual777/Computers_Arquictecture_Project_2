module create_image();

	logic clk, reset, swinit;
	logic  GPIO, GPIOBoolean;

	Processor uut(clk, reset, swinit, GPIO, GPIOBoolean);
	
	
	int i,Imagen;
	initial begin
	
		clk=0; reset=0; swinit=0; #3;
		reset=1; #3;
		reset=0; #3;
		swinit=1; #10;
		
		i = 'd0;
		// synthesis translate_off
		Imagen = $fopen("imagen.txt", "w");
		while (i < 'd27360)
			begin
				@(posedge clk);
				if (GPIOBoolean)
					begin
					  	$fwrite(Imagen, "%b\n", GPIO);
						i = i + 1;
					end
			end
		$fclose(Imagen);
		$finish;
		// synthesis translate_on
	end
	
	always begin
		clk=!clk; #10;
	end
	
	

	

	
endmodule 