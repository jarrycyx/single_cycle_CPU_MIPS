`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2020 15:05:03 PM
// Design Name: 
// Module Name: CYX_VRAM
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


module CYX_VRAM
	(
	input wire[31:0] DIN,
	output wire[31:0] DOUT,
	input wire[31:0] Adr,
	input wire WrEn,
	input wire clk
	);
	
	
	reg[31:0] regs[15:0];
	
	initial begin
		regs[0] = 32'd1; // initial RAM value for simulation
		regs[1] = 32'd5; // initial RAM value for simulation
		regs[2] = -32'd1; // initial RAM value for simulation
	end
	
	assign DOUT = (!WrEn) ? regs[Adr[5:2]] : 0;
	
	always @ (posedge clk) begin
		if (WrEn) begin
			regs[Adr[3:0]] = DIN;
		end
	end
	
	
endmodule




	