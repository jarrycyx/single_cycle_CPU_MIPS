`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2020 16:11:59 PM
// Design Name: 
// Module Name: CYX_SC_CPU_nanoMIPS_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module CYX_SC_CPU_nanoMIPS_tb
	(
	);
	
	reg clk;
	//wire[4:0] rs_tb, rt_tb, rd_tb;
	//wire[15:0] imm16_tb;
	//wire[31:0] PC_tb;
	
	initial begin
		clk = 0;
	end
	
	always begin
		#100 clk = !clk;
	end
	/*
	initial begin
		$monitor($time," rs=%h,rt=%h,rd=%h,imm16=%h", rs_tb, rt_tb, rd_tb, imm16_tb);
		#2000
		$finish;
	end
	*/
	
	CYX_SC_CPU_nanoMIPS my_SC_CPU(
		.clk(clk)
		//.rs(rs_tb),
		//.rt(rt_tb),
		//.rd(rd_tb),
		//.imm16(imm16_tb),
		//.PC(PC_tb)
	);
	
	/*CYX_Inst_Fetch cif(
		.TA(0),
		.imm16(0),
		.nPC_sel(0),
		.Equal(0),
		.jump(0),
		.Inst_Addr(PC_tb),
		.CLK(clk)
	);*/
	
endmodule




	