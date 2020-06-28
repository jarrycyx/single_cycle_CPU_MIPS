`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2020 15:11:59 PM
// Design Name: 
// Module Name: CYX_VROM
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


module CYX_VROM
	(
	output reg[31:0] DOUT,
	input wire[31:0] Adr
	);
	
	always @ * begin
		$display("ROM READ ", Adr);
		case (Adr)
			
			0: DOUT = 32'h8c220000; //lw $2, 0($1)
			4: DOUT = 32'h8c230004; //lw $3, 4($1)
			8: DOUT = 32'h8c240008; //main: lw $4, 8($1)
			12: DOUT = 32'h00463020; //add $6, $2, $6
			16: DOUT = 32'h00642822; //sub $5, $3, $4
			20: DOUT = 32'hac250008; //sw $5, 8($1)
			24: DOUT = 32'h00832825; //or $5, $4, $3
			28: DOUT = 32'h00832824; //and $5, $4, $3
			32: DOUT = 32'h00c3282a; //slt $5, $6, $3
			36: DOUT = 32'h10c30001; //beq $6, $3, exit
			40: DOUT = 32'h08000002; //j main
			44: DOUT = 32'h8c620000; //exit:	lw $2, 0($3)  ** testing of unaligned loading, $3 = 5, RAM read Addr = 4 
			48: DOUT = 32'h08000002; //j main
		
		
		/*
			0: DOUT = 32'h00432020; //main: add $4, $2, $3
			4: DOUT = 32'h8c440004; //lw $4, 4($2)
			8: DOUT = 32'hac420008; //sw $2, 8($2)
			12: DOUT = 32'h00831022; //sub $2, $4, $3
			16: DOUT = 32'h00831025; //or $2, $4, $3
			20: DOUT = 32'h00831024; //and $2, $4, $3
			24: DOUT = 32'h0083102a; //slt $2, $4, $3
			28: DOUT = 32'h10830001; //beq $4, $3, exit
			32: DOUT = 32'h08000000; //j main
			36: DOUT = 32'h8c620000; //exit:	lw $2, 0($3)
			40: DOUT = 32'h08000000; //j main
		*/
		
		/*
			0: DOUT = {6'h00, 5'd0, 5'd0, 5'd1, 5'd0, 6'h20}; // add $1, $0, $0
			4: DOUT = {6'h00, 5'd0, 5'd1, 5'd2, 5'd0, 6'h2a}; // slt $2, $0, $1
			8: DOUT = {6'h2b, 5'd0, 5'd1, 16'd0}; // sw $1, 0($0)
			12: DOUT = {6'h23, 5'd0, 5'd3, 16'd0}; // lw $3, 0($0)
			16: DOUT = {6'h04, 5'd1, 5'd3, -16'd16}; // beq $1, $3, -16
		*/
			default:	DOUT = 32'h0;
		endcase
	end
	
	
endmodule




	