transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/Tests {C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/Tests/IF_Pipeline.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/ALU {C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/ALU/divisor_nb.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/Memory {C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/Memory/RAM.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/ALU {C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/ALU/sumador_nb.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/ALU {C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/ALU/sumador_1b.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/ALU {C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/ALU/restador_nb.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/ALU {C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/ALU/negador_nb.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/ALU {C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/ALU/negador_1b.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/ALU {C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/ALU/Mux.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/ALU {C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/ALU/multiplicador.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/ALU {C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/ALU/flag_overflow.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/ALU {C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/ALU/flag_negativo.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/ALU {C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/ALU/flag_cero.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/ALU {C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/ALU/flag_carry.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/ALU {C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/ALU/ALU.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/fetch {C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/fetch/PC.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/Units {C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/Units/Mux2_1.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/fetch {C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/fetch/IF.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/Decode {C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/Decode/Register_File.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/Decode {C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/Decode/ID.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/Decode {C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/Decode/Extender.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/Decode {C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/Decode/Control_unit.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/Decode {C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/Decode/ID_Pipeline.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/Units {C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/Units/ff_enable.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/Execution {C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/Execution/PC_condition.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/Execution {C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/Execution/EX.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/Execution {C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/Execution/EX_Pipeline.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/Memory {C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/Memory/Memory.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/Memory {C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/Memory/MEM.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/Memory {C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/Memory/MEM_Pipeline.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura {C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/Processor.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/Execution {C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/Execution/ForwardingUnit.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/Tests {C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/Tests/create_image.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/Memory {C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/Memory/ROM.sv}
vlog -sv -work work +incdir+C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/fetch {C:/Users/braya/Desktop/Arqui/proyecto2/microarquitectura/fetch/Instruction_Memory.sv}

