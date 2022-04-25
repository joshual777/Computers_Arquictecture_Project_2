module PC #(parameter N = 32) (input logic clk,
												input logic reset,
												input logic [N-1:0] entrada,
												output logic [N-1:0] salida );
												
always_ff @(posedge clk, posedge reset)

if (reset) salida <= '0;

else salida <= entrada;
 
endmodule 