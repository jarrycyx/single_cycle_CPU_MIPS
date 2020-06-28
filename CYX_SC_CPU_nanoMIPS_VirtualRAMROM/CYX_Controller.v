`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2020 06:58:59 PM
// Design Name: 
// Module Name: CYX_RegFile
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


module CYX_Controller(
	input wire[31:0] inst,
	output wire[25:0] TA,
	output wire[15:0] imm16,
	output reg RegDst,
	output reg RegWr,
	output reg ExtOp,
	output reg ALUsrc,
	output reg[3:0] ALUctr,
	output reg MemWr,
	output reg MemtoReg,
	output reg nPC_sel,
	output reg jump,
	output wire[4:0] rs,
	output wire[4:0] rt,
	output wire[4:0] rd
	);
	
	wire[5:0] OpCode, funct;
	wire[4:0] shamt;
	
	assign {OpCode, rs, rt, rd, shamt, funct} = inst;
	assign TA = inst[25:0];
	assign imm16 = inst[15:0];
	
	
	always @ * begin
		case (OpCode)
			0: begin // arithmetic inst
					RegDst<=1;RegWr<=1;ExtOp<=0;ALUsrc<=0;MemWr<=0;MemtoReg<=0;jump<=0;nPC_sel<=0;
					case (funct)
						32: ALUctr<=4'b0010;	//add
						34: ALUctr<=4'b0110;	//sub
						36: ALUctr<=4'b0000;	//and
						37: ALUctr<=4'b0001;	//or
						42: ALUctr<=4'b0111;	//slt
						default: ALUctr<=4'b0000;
					endcase
				end
			2:	begin RegDst<=0;RegWr<=0;ExtOp<=0;ALUsrc<=0;MemWr<=0;MemtoReg<=0;jump<=1;nPC_sel<=0;ALUctr<=4'b0000; end	// j
			4:	begin RegDst<=1;RegWr<=0;ExtOp<=0;ALUsrc<=0;MemWr<=0;MemtoReg<=0;jump<=0;nPC_sel<=1;ALUctr<=4'b0110; end	// beq
			35: begin RegDst<=0;RegWr<=1;ExtOp<=1;ALUsrc<=1;MemWr<=0;MemtoReg<=1;jump<=0;nPC_sel<=0;ALUctr<=4'b0010;  end // lw
			43: begin RegDst<=0;RegWr<=0;ExtOp<=1;ALUsrc<=1;MemWr<=1;MemtoReg<=0;jump<=0;nPC_sel<=0;ALUctr<=4'b0010;  end // sw
		endcase
	end
	
endmodule




	