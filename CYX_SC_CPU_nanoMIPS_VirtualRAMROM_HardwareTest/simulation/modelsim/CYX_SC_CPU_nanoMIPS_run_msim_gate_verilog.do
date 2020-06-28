transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {CYX_SC_CPU_nanoMIPS_6_1200mv_85c_slow.vo}

vlog -vlog01compat -work work +incdir+C:/Users/jarrycyx/OneDrive/+ACademia/Computer\ Principles\ and\ Applications/Ex3/CYX_SC_CPU_nanoMIPS_VirtualRAMROM {C:/Users/jarrycyx/OneDrive/+ACademia/Computer Principles and Applications/Ex3/CYX_SC_CPU_nanoMIPS_VirtualRAMROM/CYX_SC_CPU_nanoMIPS_tb.v}

vsim -t 1ps +transport_int_delays +transport_path_delays -L altera_ver -L cycloneive_ver -L gate_work -L work -voptargs="+acc"  CYX_SC_CPU_nanoMIPS_tb

add wave *
view structure
view signals
run -all
