`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2020 06:58:59 PM
// Design Name: 
// Module Name: CYX_Extender16
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


module CYX_Extender16
	(
	input wire ExtOp,
	input wire[15:0] DIN,
	output reg[31:0] DOUT
	);
	
	always @ * begin
		if (ExtOp == 0 || DIN[15] == 0) DOUT = {16'h0000, DIN};
		else DOUT = {16'hFFFF, DIN};
	end
	
endmodule




	