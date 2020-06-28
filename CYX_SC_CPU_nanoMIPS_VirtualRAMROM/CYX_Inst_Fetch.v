`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2020 06:58:59 PM
// Design Name: 
// Module Name: CYX_Inst_Fetch
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


module CYX_Inst_Fetch(
	input wire[25:0] TA,
	input wire[15:0] imm16,
	input wire nPC_sel,
	input wire Equal,
	input wire jump,
	output wire[31:0] Inst_Addr,
	input wire CLK
	);
	
	reg[31:0] PC;
	
	initial PC = 0;
	
	wire[31:0] jump_target, imm32, PC_add4, PC_add4_addIMM;
	
	assign PC_add4 = PC + 4;
	assign jump_target = {PC_add4[31:28], TA, 2'b00};
	assign imm32 = imm16[15] ? {14'hFFFF, imm16, 2'b00} : {14'h0000, imm16, 2'b00};
	assign PC_add4_addIMM = PC_add4 + imm32;
	assign Inst_Addr = PC;
	
	always @ (posedge CLK) begin
		$display("INST FETCH ", PC);
		
		if (jump) begin
			PC = jump_target;
		end else begin
			if (nPC_sel && Equal) begin
				PC = PC_add4_addIMM;
			end else begin
				PC = PC_add4;
			end
		end
	end
	
endmodule




	