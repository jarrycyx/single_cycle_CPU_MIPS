// Copyright (C) 2019  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 19.1.0 Build 670 09/22/2019 SJ Lite Edition"
// CREATED		"Mon May 04 20:41:34 2020"

module CYX_SC_CPU_nanoMIPS(
	clk,
	ALU_RES,
	busB_selected,
	Inst_Addr,
	Instrction,
	RAM_OUT,
	rd,
	regA,
	rs,
	rt
);


input wire	clk;
output wire	[31:0] ALU_RES;
output wire	[31:0] busB_selected;
output wire	[31:0] Inst_Addr;
output wire	[31:0] Instrction;
output wire	[31:0] RAM_OUT;
output wire	[4:0] rd;
output wire	[31:0] regA;
output wire	[4:0] rs;
output wire	[4:0] rt;

wire	[31:0] ALU_RES_ALTERA_SYNTHESIZED;
wire	ALU_Zero;
wire	[3:0] ALUctr;
wire	ALUsrc;
wire	[31:0] busB_selected_ALTERA_SYNTHESIZED;
wire	[31:0] busW_selected;
wire	ExtOp;
wire	[15:0] imm16;
wire	[31:0] imm_extended;
wire	[31:0] Inst_Addr_ALTERA_SYNTHESIZED;
wire	[31:0] Instruction;
wire	jump;
wire	MemtoReg;
wire	MemWr;
wire	nPC_sel;
wire	[31:0] RAM_OUT_ALTERA_SYNTHESIZED;
wire	[4:0] rd_ALTERA_SYNTHESIZED;
wire	[31:0] regA_ALTERA_SYNTHESIZED;
wire	[31:0] regB;
wire	RegDst;
wire	RegWr;
wire	[4:0] rs_ALTERA_SYNTHESIZED;
wire	[4:0] rt_ALTERA_SYNTHESIZED;
wire	[4:0] rw_selected;
wire	[25:0] TargetAddress;





ALU_Core	b2v_ALU_inst(
	.A(regA_ALTERA_SYNTHESIZED),
	.ALUctr(ALUctr),
	.B(busB_selected_ALTERA_SYNTHESIZED),
	.Zero(ALU_Zero),
	
	
	
	.RES(ALU_RES_ALTERA_SYNTHESIZED));


CYX_Controller	b2v_Controller_inst2(
	.inst(Instruction),
	.RegDst(RegDst),
	.RegWr(RegWr),
	.ExtOp(ExtOp),
	.ALUsrc(ALUsrc),
	.MemWr(MemWr),
	.MemtoReg(MemtoReg),
	.nPC_sel(nPC_sel),
	.jump(jump),
	.ALUctr(ALUctr),
	.imm16(imm16),
	.rd(rd_ALTERA_SYNTHESIZED),
	.rs(rs_ALTERA_SYNTHESIZED),
	.rt(rt_ALTERA_SYNTHESIZED),
	.TA(TargetAddress));


CYX_Extender16	b2v_Extender_inst(
	.ExtOp(ExtOp),
	.DIN(imm16),
	.DOUT(imm_extended));


CYX_Inst_Fetch	b2v_Inst_Fetch_inst3(
	.nPC_sel(nPC_sel),
	.Equal(ALU_Zero),
	.jump(jump),
	.CLK(clk),
	.imm16(imm16),
	.TA(TargetAddress),
	.Inst_Addr(Inst_Addr_ALTERA_SYNTHESIZED));


CYX_MUX	b2v_MUX_inst6(
	.seln(ALUsrc),
	.D0(regB),
	.D1(imm_extended),
	.RES(busB_selected_ALTERA_SYNTHESIZED));
	defparam	b2v_MUX_inst6.WIDTH = 31;


CYX_MUX	b2v_MUX_inst7(
	.seln(RegDst),
	.D0(rt_ALTERA_SYNTHESIZED),
	.D1(rd_ALTERA_SYNTHESIZED),
	.RES(rw_selected));
	defparam	b2v_MUX_inst7.WIDTH = 4;


CYX_MUX	b2v_MUX_inst8(
	.seln(MemtoReg),
	.D0(ALU_RES_ALTERA_SYNTHESIZED),
	.D1(RAM_OUT_ALTERA_SYNTHESIZED),
	.RES(busW_selected));
	defparam	b2v_MUX_inst8.WIDTH = 31;


CYX_RegFile	b2v_RegFile_inst(
	.CLK(clk),
	.RegWr(RegWr),
	.busW(busW_selected),
	.ra(rs_ALTERA_SYNTHESIZED),
	.rb(rt_ALTERA_SYNTHESIZED),
	.rw(rw_selected),
	.busA(regA_ALTERA_SYNTHESIZED),
	.busB(regB));


CYX_VRAM	b2v_VRAM_inst11(
	.WrEn(MemWr),
	.clk(clk),
	.Adr(ALU_RES_ALTERA_SYNTHESIZED),
	.DIN(regB),
	.DOUT(RAM_OUT_ALTERA_SYNTHESIZED));


CYX_VROM	b2v_VROM_inst10(
	.Adr(Inst_Addr_ALTERA_SYNTHESIZED),
	.DOUT(Instruction));

assign	ALU_RES = ALU_RES_ALTERA_SYNTHESIZED;
assign	busB_selected = busB_selected_ALTERA_SYNTHESIZED;
assign	Inst_Addr = Inst_Addr_ALTERA_SYNTHESIZED;
assign	RAM_OUT = RAM_OUT_ALTERA_SYNTHESIZED;
assign	rd = rd_ALTERA_SYNTHESIZED;
assign	regA = regA_ALTERA_SYNTHESIZED;
assign	rs = rs_ALTERA_SYNTHESIZED;
assign	rt = rt_ALTERA_SYNTHESIZED;

endmodule
