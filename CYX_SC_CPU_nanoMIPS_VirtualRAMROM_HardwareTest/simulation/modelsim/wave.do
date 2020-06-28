onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /CYX_SC_CPU_nanoMIPS_tb/my_SC_CPU/b2v_Inst_Fetch_inst3/PC
add wave -noupdate /CYX_SC_CPU_nanoMIPS_tb/my_SC_CPU/b2v_Controller_inst2/TA
add wave -noupdate /CYX_SC_CPU_nanoMIPS_tb/my_SC_CPU/b2v_Controller_inst2/imm16
add wave -noupdate /CYX_SC_CPU_nanoMIPS_tb/my_SC_CPU/b2v_Controller_inst2/RegDst
add wave -noupdate /CYX_SC_CPU_nanoMIPS_tb/my_SC_CPU/b2v_Controller_inst2/RegWr
add wave -noupdate /CYX_SC_CPU_nanoMIPS_tb/my_SC_CPU/b2v_Controller_inst2/ALUsrc
add wave -noupdate /CYX_SC_CPU_nanoMIPS_tb/my_SC_CPU/b2v_Controller_inst2/ALUctr
add wave -noupdate /CYX_SC_CPU_nanoMIPS_tb/my_SC_CPU/b2v_Controller_inst2/MemWr
add wave -noupdate /CYX_SC_CPU_nanoMIPS_tb/my_SC_CPU/b2v_Controller_inst2/rs
add wave -noupdate /CYX_SC_CPU_nanoMIPS_tb/my_SC_CPU/b2v_Controller_inst2/rt
add wave -noupdate /CYX_SC_CPU_nanoMIPS_tb/my_SC_CPU/b2v_Controller_inst2/rd
add wave -noupdate /CYX_SC_CPU_nanoMIPS_tb/my_SC_CPU/b2v_inst/A
add wave -noupdate /CYX_SC_CPU_nanoMIPS_tb/my_SC_CPU/b2v_inst/B
add wave -noupdate /CYX_SC_CPU_nanoMIPS_tb/my_SC_CPU/b2v_inst/RES
add wave -noupdate /CYX_SC_CPU_nanoMIPS_tb/my_SC_CPU/b2v_RegFile_inst/regs
add wave -noupdate /CYX_SC_CPU_nanoMIPS_tb/my_SC_CPU/b2v_VRAM_inst11/regs
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {1 ns}

run -all