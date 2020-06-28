onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /CYX_SC_CPU_nanoMIPS_tb/clk
add wave -noupdate -radix hexadecimal /CYX_SC_CPU_nanoMIPS_tb/my_SC_CPU/ALU_RES
add wave -noupdate -radix hexadecimal /CYX_SC_CPU_nanoMIPS_tb/my_SC_CPU/regA
add wave -noupdate -radix hexadecimal /CYX_SC_CPU_nanoMIPS_tb/my_SC_CPU/clk
add wave -noupdate -radix hexadecimal /CYX_SC_CPU_nanoMIPS_tb/my_SC_CPU/Instruction
add wave -noupdate -radix hexadecimal /CYX_SC_CPU_nanoMIPS_tb/my_SC_CPU/Inst_Addr
add wave -noupdate -radix hexadecimal /CYX_SC_CPU_nanoMIPS_tb/my_SC_CPU/RAM_OUT
add wave -noupdate -radix hexadecimal /CYX_SC_CPU_nanoMIPS_tb/my_SC_CPU/rs
add wave -noupdate -radix hexadecimal /CYX_SC_CPU_nanoMIPS_tb/my_SC_CPU/rt
add wave -noupdate -radix hexadecimal /CYX_SC_CPU_nanoMIPS_tb/my_SC_CPU/rd
add wave -noupdate -radix hexadecimal /CYX_SC_CPU_nanoMIPS_tb/my_SC_CPU/busB_selected
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {1 ns}
