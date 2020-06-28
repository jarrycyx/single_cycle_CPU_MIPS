quit -sim
vlog -work work -stats=none {C:\Users\jarrycyx\OneDrive\+ACademia\Computer Principles and Applications\Ex3\CYX_SC_CPU_nanoMIPS\CYX_VROM.v}
vlog -work work -stats=none {C:\Users\jarrycyx\OneDrive\+ACademia\Computer Principles and Applications\Ex3\CYX_SC_CPU_nanoMIPS\ALU_Core.v}
vlog -work work -stats=none {C:\Users\jarrycyx\OneDrive\+ACademia\Computer Principles and Applications\Ex3\CYX_SC_CPU_nanoMIPS\CYX_Extender16.v}
vlog -work work -stats=none {C:\Users\jarrycyx\OneDrive\+ACademia\Computer Principles and Applications\Ex3\CYX_SC_CPU_nanoMIPS\CYX_Inst_Fetch.v}
vlog -work work -stats=none {C:\Users\jarrycyx\OneDrive\+ACademia\Computer Principles and Applications\Ex3\CYX_SC_CPU_nanoMIPS\CYX_MUX.v}
vlog -work work -stats=none {C:\Users\jarrycyx\OneDrive\+ACademia\Computer Principles and Applications\Ex3\CYX_SC_CPU_nanoMIPS\CYX_RegFile.v}
vlog -work work -stats=none {C:/Users/jarrycyx/OneDrive/+ACademia/Computer Principles and Applications/Ex3/CYX_SC_CPU_nanoMIPS/CYX_VRAM.v}
vlog -work work -stats=none {C:/Users/jarrycyx/OneDrive/+ACademia/Computer Principles and Applications/Ex3/CYX_SC_CPU_nanoMIPS/CYX_VRAM.v}
vlog -work work -stats=none {C:\Users\jarrycyx\OneDrive\+ACademia\Computer Principles and Applications\Ex3\CYX_SC_CPU_nanoMIPS\CYX_Controller.v}
vlog -work work -stats=none {C:/Users/jarrycyx/OneDrive/+ACademia/Computer Principles and Applications/Ex3/CYX_SC_CPU_nanoMIPS/CYX_SC_CPU_nanoMIPS.v}
vlog -work work -stats=none {C:/Users/jarrycyx/OneDrive/+ACademia/Computer Principles and Applications/Ex3/CYX_SC_CPU_nanoMIPS/CYX_SC_CPU_nanoMIPS_tb.v}
vsim -gui work.CYX_SC_CPU_nanoMIPS_tb
do wave.do