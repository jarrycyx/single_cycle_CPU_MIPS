`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2020 06:58:59 PM
// Design Name: 
// Module Name: CYX_MUX
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


module CYX_MUX
	#(parameter WIDTH = 32)
	(
	input wire seln,
	input wire[WIDTH:0] D0,
	input wire[WIDTH:0] D1,
	output wire[WIDTH:0] RES
	);
	
	assign RES = (seln == 0) ? D0 : D1;
	
endmodule

