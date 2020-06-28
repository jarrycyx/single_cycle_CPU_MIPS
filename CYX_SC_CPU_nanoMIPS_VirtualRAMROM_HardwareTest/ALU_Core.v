`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2020 06:58:59 PM
// Design Name: 
// Module Name: CYX_ALU_Core
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




module ALU_Core(
    input wire[31:0] A,
    input wire[31:0] B,
    input wire [3:0] ALUctr,
    output reg[31:0] RES,
    output wire Zero,
    output reg Carry,
    output reg Overflow,
    output reg CPR_RES
    );
	 
    wire A_invert, B_invert;
	 wire[1:0] Operation;
	 assign {A_invert, B_invert, Operation} = ALUctr;
    
    wire[31:0] A_For_Calc, B_For_Calc; //actual A, B value after possible invertion
    
    assign A_For_Calc = A_invert ? (Operation[1] == 1 ? -A : ~A) : A;
    assign B_For_Calc = B_invert ? (Operation[1] == 1 ? -B : ~B) : B;
    
    
    wire[31:0] AND_RES, OR_RES;
    
    assign AND_RES =  A_For_Calc & B_For_Calc;
    assign OR_RES =  A_For_Calc | B_For_Calc;
    
/*** Plus Calc With Overflow Detection ***/
    wire[30:0] A_31bit, B_31bit;
    assign A_31bit = A_For_Calc[30:0];
    assign B_31bit = B_For_Calc[30:0];
    
    wire CARRY_TO_31, CARRY_TO_32;
    wire[31:0] PLUS_RES_32bit; 
    assign PLUS_RES_32bit = A_31bit + B_31bit;
    assign CARRY_TO_31 = PLUS_RES_32bit[31];
    
    wire[32:0] PLUS_RES_33bit; 
    assign PLUS_RES_33bit[32:31] = PLUS_RES_32bit[31] + A_For_Calc[31] + B_For_Calc[31];
    assign PLUS_RES_33bit[30:0] = PLUS_RES_32bit[30:0];
    assign CARRY_TO_32 = PLUS_RES_33bit[32];
/*** Plus Calc With Overflow Detection ***/
    
    always @ *
    begin
        Carry = 0;
        Overflow = 0;
        CPR_RES = 0;
        case (Operation)
            2'b00: 
                begin
                    RES = AND_RES; 
                end
            2'b01: 
                begin
                    RES = OR_RES;
                end
            2'b10: 
                begin
                    RES = PLUS_RES_33bit[31:0];
                    Overflow = CARRY_TO_31 ^ CARRY_TO_32;
                    Carry = CARRY_TO_32;
                end
            2'b11: 
                begin
                    RES = PLUS_RES_33bit[31];
                    CPR_RES = PLUS_RES_33bit[31];
                    Overflow = CARRY_TO_31 ^ CARRY_TO_32;
                    Carry = CARRY_TO_32;
                end
            default: RES = PLUS_RES_33bit[31:0];
        endcase
    end
    
    assign Zero = (RES == 0);
    
endmodule