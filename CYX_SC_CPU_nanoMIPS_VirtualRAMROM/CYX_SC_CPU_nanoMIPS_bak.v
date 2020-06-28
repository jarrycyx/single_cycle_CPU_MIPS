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
// CREATED		"Sun Apr 26 15:54:32 2020"

module CYX_SC_CPU_nanoMIPS(
	clk, rs, rd, rt, imm16, PC
);


input wire	clk;

wire	ALUsrc;
wire	ExtOp;
output wire	[15:0] imm16;
wire	jump;
wire	MemtoReg;
wire	MemWr;
wire	nPC_sel;
output wire	[4:0] rd;
wire	RegDst;
wire	RegWr;
output wire	[4:0] rs;
output wire	[4:0] rt;
wire	[31:0] SYNTHESIZED_WIRE_0;
wire	[3:0] SYNTHESIZED_WIRE_1;
wire	[31:0] SYNTHESIZED_WIRE_2;
wire	[31:0] SYNTHESIZED_WIRE_3;
wire	[4:0] SYNTHESIZED_WIRE_4;
output wire	[31:0] PC;
wire	[31:0] SYNTHESIZED_WIRE_15;
wire	[31:0] SYNTHESIZED_WIRE_16;
wire	[31:0] SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	[25:0] SYNTHESIZED_WIRE_10;
wire	[31:0] SYNTHESIZED_WIRE_12;
wire	[31:0] SYNTHESIZED_WIRE_14;





ALU_Core	ALU_inst(
	.A(SYNTHESIZED_WIRE_0),
	.ALUctr(SYNTHESIZED_WIRE_1),
	.B(SYNTHESIZED_WIRE_2),
	.Zero(SYNTHESIZED_WIRE_9),
	
	
	
	.RES(SYNTHESIZED_WIRE_15));


CYX_RegFile	RegFile_inst1(
	.CLK(clk),
	.RegWr(RegWr),
	.busW(SYNTHESIZED_WIRE_3),
	.ra(rs),
	.rb(rt),
	.rw(SYNTHESIZED_WIRE_4),
	.busA(SYNTHESIZED_WIRE_0),
	.busB(SYNTHESIZED_WIRE_16));


CYX_VROM	VROM_inst10(
	.Adr(PC),
	.DOUT(SYNTHESIZED_WIRE_8));


CYX_VRAM	VRAM_inst11(
	.WrEn(MemWr),
	.clk(clk),
	.Adr(SYNTHESIZED_WIRE_15),
	.DIN(SYNTHESIZED_WIRE_16),
	.DOUT(SYNTHESIZED_WIRE_14));


CYX_Controller	Ctrl_inst2(
	.inst(SYNTHESIZED_WIRE_8),
	.RegDst(RegDst),
	.RegWr(RegWr),
	.ExtOp(ExtOp),
	.ALUsrc(ALUsrc),
	.MemWr(MemWr),
	.MemtoReg(MemtoReg),
	.nPC_sel(nPC_sel),
	.jump(jump),
	.ALUctr(SYNTHESIZED_WIRE_1),
	.imm16(imm16),
	.rd(rd),
	.rs(rs),
	.rt(rt),
	.TA(SYNTHESIZED_WIRE_10));


CYX_Inst_Fetch	Instr_inst3(
	.nPC_sel(nPC_sel),
	.Equal(SYNTHESIZED_WIRE_9),
	.jump(jump),
	.CLK(clk),
	.imm16(imm16),
	.TA(SYNTHESIZED_WIRE_10),
	.Inst_Addr(PC));


CYX_MUX	MUX_inst6(
	.seln(ALUsrc),
	.D0(SYNTHESIZED_WIRE_16),
	.D1(SYNTHESIZED_WIRE_12),
	.RES(SYNTHESIZED_WIRE_2));
	defparam	b2v_inst6.WIDTH = 31;


CYX_MUX	MUX_inst7(
	.seln(RegDst),
	.D0(rt),
	.D1(rd),
	.RES(SYNTHESIZED_WIRE_4));
	defparam	b2v_inst7.WIDTH = 4;


CYX_MUX	MUX_inst8(
	.seln(MemtoReg),
	.D0(SYNTHESIZED_WIRE_15),
	.D1(SYNTHESIZED_WIRE_14),
	.RES(SYNTHESIZED_WIRE_3));
	defparam	b2v_inst8.WIDTH = 31;


CYX_Extender16	Extender_inst9(
	.ExtOp(ExtOp),
	.DIN(imm16),
	.DOUT(SYNTHESIZED_WIRE_12));


endmodule
