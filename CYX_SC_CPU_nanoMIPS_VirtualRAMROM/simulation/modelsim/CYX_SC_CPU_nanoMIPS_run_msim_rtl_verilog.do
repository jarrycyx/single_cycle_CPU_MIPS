transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/jarrycyx/OneDrive/+ACademia/Computer\ Principles\ and\ Applications/Ex3/CYX_SC_CPU_nanoMIPS {C:/Users/jarrycyx/OneDrive/+ACademia/Computer Principles and Applications/Ex3/CYX_SC_CPU_nanoMIPS/CYX_SC_CPU_nanoMIPS.v}
vlog -vlog01compat -work work +incdir+C:/Users/jarrycyx/OneDrive/+ACademia/Computer\ Principles\ and\ Applications/Ex3/CYX_SC_CPU_nanoMIPS {C:/Users/jarrycyx/OneDrive/+ACademia/Computer Principles and Applications/Ex3/CYX_SC_CPU_nanoMIPS/ALU_Core.v}
vlog -vlog01compat -work work +incdir+C:/Users/jarrycyx/OneDrive/+ACademia/Computer\ Principles\ and\ Applications/Ex3/CYX_SC_CPU_nanoMIPS {C:/Users/jarrycyx/OneDrive/+ACademia/Computer Principles and Applications/Ex3/CYX_SC_CPU_nanoMIPS/CYX_RegFile.v}
vlog -vlog01compat -work work +incdir+C:/Users/jarrycyx/OneDrive/+ACademia/Computer\ Principles\ and\ Applications/Ex3/CYX_SC_CPU_nanoMIPS {C:/Users/jarrycyx/OneDrive/+ACademia/Computer Principles and Applications/Ex3/CYX_SC_CPU_nanoMIPS/CYX_Inst_Fetch.v}
vlog -vlog01compat -work work +incdir+C:/Users/jarrycyx/OneDrive/+ACademia/Computer\ Principles\ and\ Applications/Ex3/CYX_SC_CPU_nanoMIPS {C:/Users/jarrycyx/OneDrive/+ACademia/Computer Principles and Applications/Ex3/CYX_SC_CPU_nanoMIPS/CYX_Controller.v}
vlog -vlog01compat -work work +incdir+C:/Users/jarrycyx/OneDrive/+ACademia/Computer\ Principles\ and\ Applications/Ex3/CYX_SC_CPU_nanoMIPS {C:/Users/jarrycyx/OneDrive/+ACademia/Computer Principles and Applications/Ex3/CYX_SC_CPU_nanoMIPS/CYX_MUX.v}
vlog -vlog01compat -work work +incdir+C:/Users/jarrycyx/OneDrive/+ACademia/Computer\ Principles\ and\ Applications/Ex3/CYX_SC_CPU_nanoMIPS {C:/Users/jarrycyx/OneDrive/+ACademia/Computer Principles and Applications/Ex3/CYX_SC_CPU_nanoMIPS/CYX_Extender16.v}
vlog -vlog01compat -work work +incdir+C:/Users/jarrycyx/OneDrive/+ACademia/Computer\ Principles\ and\ Applications/Ex3/CYX_SC_CPU_nanoMIPS {C:/Users/jarrycyx/OneDrive/+ACademia/Computer Principles and Applications/Ex3/CYX_SC_CPU_nanoMIPS/CYX_VRAM.v}
vlog -vlog01compat -work work +incdir+C:/Users/jarrycyx/OneDrive/+ACademia/Computer\ Principles\ and\ Applications/Ex3/CYX_SC_CPU_nanoMIPS {C:/Users/jarrycyx/OneDrive/+ACademia/Computer Principles and Applications/Ex3/CYX_SC_CPU_nanoMIPS/CYX_VROM.v}

vlog -vlog01compat -work work +incdir+C:/Users/jarrycyx/OneDrive/+ACademia/Computer\ Principles\ and\ Applications/Ex3/CYX_SC_CPU_nanoMIPS {C:/Users/jarrycyx/OneDrive/+ACademia/Computer Principles and Applications/Ex3/CYX_SC_CPU_nanoMIPS/CYX_SC_CPU_nanoMIPS_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  CYX_SC_CPU_nanoMIPS_tb

add wave *
view structure
view signals
run -all
