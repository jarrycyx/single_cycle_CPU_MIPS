`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2020 12:13:53 PM
// Design Name: 
// Module Name: Dynamic_Display_HEX
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


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/10 19:14:50
// Design Name: 
// Module Name: Digits_dynamic_display
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

module Digit_decoder(
    input wire[4:0] AN, //AN[4] = 1, all digits off
    output reg ao,
    output reg bo,
    output reg co,
    output reg do,
    output reg eo,
    output reg fo,
    output reg go
);

    always @ (AN)
    begin
        case (AN)
        5'b00000: 
        begin
            ao = 0; bo = 0; co = 0; do = 0; eo = 0; fo = 0; go = 1; 
        end
        5'b00001: 
        begin
            ao = 1; bo = 0; co = 0; do = 1; eo = 1; fo = 1; go = 1; 
        end
        5'b00010: 
        begin
            ao = 0; bo = 0; co = 1; do = 0; eo = 0; fo = 1; go = 0; 
        end
        5'b00011:
        begin
            ao = 0; bo = 0; co = 0; do = 0; eo = 1; fo = 1; go = 0; 
        end
        5'b00100:
        begin
            ao = 1; bo = 0; co = 0; do = 1; eo = 1; fo = 0; go = 0; 
        end
        5'b00101:
        begin
            ao = 0; bo = 1; co = 0; do = 0; eo = 1; fo = 0; go = 0; 
        end
        5'b00110:
        begin
            ao = 0; bo = 1; co = 0; do = 0; eo = 0; fo = 0; go = 0; 
        end
        5'b00111:
        begin
            ao = 0; bo = 0; co = 0; do = 1; eo = 1; fo = 1; go = 1; 
        end
        5'b01000:
        begin
            ao = 0; bo = 0; co = 0; do = 0; eo = 0; fo = 0; go = 0; 
        end
        5'b01001:
        begin
            ao = 0; bo = 0; co = 0; do = 0; eo = 1; fo = 0; go = 0; 
        end
        5'b01010:
        begin
            ao = 0; bo = 0; co = 0; do = 1; eo = 0; fo = 0; go = 0; 
        end
        5'b01011:
        begin
            ao = 1; bo = 1; co = 0; do = 0; eo = 0; fo = 0; go = 0; 
        end
        5'b01100:
        begin
            ao = 1; bo = 1; co = 1; do = 0; eo = 0; fo = 1; go = 0; 
        end
        5'b01101:
        begin
            ao = 1; bo = 0; co = 0; do = 0; eo = 0; fo = 1; go = 0; 
        end
        5'b01110:
        begin
            ao = 0; bo = 1; co = 1; do = 0; eo = 0; fo = 0; go = 0; 
        end
        5'b01111:
        begin
            ao = 0; bo = 1; co = 1; do = 1; eo = 0; fo = 0; go = 0; 
        end
        default:
        begin
            ao = 1; bo = 1; co = 1; do = 1; eo = 1; fo = 1; go = 1; 
        end
        endcase
    end

endmodule

module Digits_Display(
    input wire clk100M,
    input wire[4:0] AN3, 
    input wire[4:0] AN2, 
    input wire[4:0] AN1, 
    input wire[4:0] AN0,
    output reg[3:0] EN,
    output wire[7:0] SEGs // 7:0 correspond to a b c d e f g dp
    );
    
    reg[4:0] current_AN;
    reg[19:0] clk_counter;
    
    assign SEGs[0] = 1;
    
    initial
    begin
        clk_counter = 0;
        EN[3] = 0; EN[2] = 1; EN[1] = 1; EN[0] = 1; current_AN = AN3;
    end
    
    always @ (posedge clk100M)
    begin
        clk_counter <= clk_counter + 1;
            if (clk_counter[19:18] == 0)
            begin
                EN[3] <= 0; EN[2] <= 1; EN[1] <= 1; EN[0] <= 1; current_AN = AN3;
            end
            else if (clk_counter[19:18] == 1)
            begin
                EN[3] <= 1; EN[2] <= 0; EN[1] <= 1; EN[0] <= 1; current_AN = AN2;
            end
            else if (clk_counter[19:18] == 2)
            begin
                EN[3] <= 1; EN[2] <= 1; EN[1] <= 0; EN[0] <= 1; current_AN = AN1;
            end
            else if (clk_counter[19:18] == 3)
            begin
                EN[3] <= 1; EN[2] <= 1; EN[1] <= 1; EN[0] <= 0; current_AN = AN0;
            end
    end
    
    Digit_decoder digit_decoder(
        .AN({1'b0, current_AN[3:0]}), 
        .ao(SEGs[7]),
        .bo(SEGs[6]),
        .co(SEGs[5]),
        .do(SEGs[4]),
        .eo(SEGs[3]),
        .fo(SEGs[2]),
        .go(SEGs[1])
    );
    
endmodule