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


module CYX_RegFile
#(
	parameter REGNUM = 8,
	parameter REG0_DATA = 1
)
(
	input wire[4:0] ra, 
	input wire[4:0] rb, 
	input wire[4:0] rw,
	output wire[31:0] busA,
	output wire[31:0] busB,
	input wire[31:0] busW,
	input wire CLK,
	input wire RegWr
);
	
	reg[31:0] regs[REGNUM - 1:0];
	
	generate
	genvar i;
		for(i=0;i<=7;i=i+1) begin : INITBLOCK
			initial regs[i] = 32'h00000000;
		end
	endgenerate
	
	assign busA = regs[ra];
	assign busB = regs[rb];
	
	always @ (posedge CLK) begin
		regs[0] = REG0_DATA;
		if (RegWr && (rw != 0)) begin
			regs[rw] = busW;
		end
	end
	
endmodule




	