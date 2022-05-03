`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.07.2021 15:35:18
// Design Name: 
// Module Name: Halton_base3
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


module Halton_base3(
    input clk,
    input reset,
    input [31:0] seed,
    output [23:0] out
    );
    
    wire enable1, enable2, enable3, enable4, enable5, enable6;
    reg [31:0] b3c;
    reg [23:0] binary_value1;
    reg [23:0] binary_value2;
    reg [23:0] binary_value3;
    reg [23:0] binary_value4;
    reg [23:0] binary_value5;
    reg [23:0] binary_value6;
    reg [23:0] binary_value7;
    reg [23:0] binary_value8;
    reg [23:0] binary_value9;
    reg [23:0] binary_value10;
    reg [23:0] binary_value11;
    reg [23:0] binary_value12;
    reg [23:0] binary_value13;
    reg [23:0] binary_value14;
    reg [23:0] binary_value15;
    reg [23:0] binary_value16;
    
    assign enable1 = !b3c[0] & b3c[1];
    assign enable2 = !b3c[2] & b3c[3] & enable1;
    assign enable3 = !b3c[4] & b3c[5] & enable2;
    assign enable4 = !b3c[6] & b3c[7] & enable3;
    assign enable5 = !b3c[8] & b3c[9] & enable4;
    assign enable6 = !b3c[10] & b3c[11] & enable5;
    assign enable7 = !b3c[12] & b3c[13] & enable6;
    assign enable8 = !b3c[14] & b3c[15] & enable7;
    assign enable9 = !b3c[16] & b3c[17] & enable8;
    assign enable10 = !b3c[18] & b3c[19] & enable9;
    assign enable11 = !b3c[20] & b3c[21] & enable10;
    assign enable12 = !b3c[22] & b3c[23] & enable11;
    assign enable13 = !b3c[24] & b3c[25] & enable12;
    assign enable14 = !b3c[26] & b3c[27] & enable13;
    assign enable15 = !b3c[28] & b3c[29] & enable14;
    
    always @ (posedge clk) begin
        if (reset) begin
            b3c <= seed;
        end else begin   
            if (!b3c[1]) begin
                b3c[0] <= !b3c[0];
            end
            if (b3c[0] | b3c[1]) begin
                b3c[1] <= !b3c[1];
            end    
            if (enable1) begin
                if (!b3c[3]) begin
                b3c[2] <= !b3c[2];
                end
                if (b3c[2] | b3c[3]) begin
                    b3c[3] <= !b3c[3];
                end
            end     
            if (enable2) begin
                if (!b3c[5]) begin
                    b3c[4] <= !b3c[4];
                end
                if (b3c[4] | b3c[5]) begin
                    b3c[5] <= !b3c[5];
                end
            end         
            if (enable3) begin
                if (!b3c[7]) begin
                    b3c[6] <= !b3c[6];
                end
                if (b3c[6] | b3c[7]) begin
                    b3c[7] <= !b3c[7];
                end
            end           
            if (enable4) begin
                if (!b3c[9]) begin
                    b3c[8] <= !b3c[8];
                end
                if (b3c[8] | b3c[9]) begin
                    b3c[9] <= !b3c[9];
                end
            end            
            if (enable5) begin
                if (!b3c[11]) begin
                    b3c[10] <= !b3c[10];
                end
                if (b3c[10] | b3c[11]) begin
                    b3c[11] <= !b3c[11];
                end
            end          
            if (enable6) begin
                if (!b3c[13]) begin
                    b3c[12] <= !b3c[12];
                end
                if (b3c[12] | b3c[13]) begin
                    b3c[13] <= !b3c[13];
                end
            end
            if (enable7) begin
                if (!b3c[15]) begin
                    b3c[14] <= !b3c[14];
                end
                if (b3c[14] | b3c[15]) begin
                    b3c[15] <= !b3c[15];
                end
            end
            if (enable8) begin
                if (!b3c[17]) begin
                    b3c[16] <= !b3c[16];
                end
                if (b3c[16] | b3c[17]) begin
                    b3c[17] <= !b3c[17];
                end
            end
            if (enable9) begin
                if (!b3c[19]) begin
                    b3c[18] <= !b3c[18];
                end
                if (b3c[18] | b3c[19]) begin
                    b3c[19] <= !b3c[19];
                end
            end
            if (enable10) begin
                if (!b3c[21]) begin
                    b3c[20] <= !b3c[20];
                end
                if (b3c[20] | b3c[21]) begin
                    b3c[21] <= !b3c[21];
                end
            end
            if (enable11) begin
                if (!b3c[23]) begin
                    b3c[22] <= !b3c[22];
                end
                if (b3c[22] | b3c[23]) begin
                    b3c[23] <= !b3c[23];
                end
            end
            if (enable12) begin
                if (!b3c[25]) begin
                    b3c[24] <= !b3c[24];
                end
                if (b3c[24] | b3c[25]) begin
                    b3c[25] <= !b3c[25];
                end
            end
            if (enable13) begin
                if (!b3c[27]) begin
                    b3c[26] <= !b3c[26];
                end
                if (b3c[26] | b3c[27]) begin
                    b3c[27] <= !b3c[27];
                end
            end
            if (enable14) begin
                if (!b3c[29]) begin
                    b3c[28] <= !b3c[28];
                end
                if (b3c[28] | b3c[29]) begin
                    b3c[29] <= !b3c[29];
                end
            end
            if (enable15) begin
                if (!b3c[31] & !b3c[30]) begin
                    b3c[30] <= !b3c[30];
                end else if (!b3c[31] & b3c[30]) begin
                    b3c[30] <= !b3c[30];
                    b3c[31] <= !b3c[31];                    
                end else if (b3c[31]) begin
                    b3c <= 0;
                end
            end
        end
    end
    
    always @ (posedge clk) begin
        if (reset) begin
            binary_value1 <= 24'b0000_0000_0000_0000_0000_0000;
            binary_value2 <= 24'b0000_0000_0000_0000_0000_0000;
            binary_value3 <= 24'b0000_0000_0000_0000_0000_0000;
            binary_value4 <= 24'b0000_0000_0000_0000_0000_0000;
            binary_value5 <= 24'b0000_0000_0000_0000_0000_0000;
            binary_value6 <= 24'b0000_0000_0000_0000_0000_0000;
            binary_value7 <= 24'b0000_0000_0000_0000_0000_0000;
            binary_value8 <= 24'b0000_0000_0000_0000_0000_0000;
            binary_value9 <= 24'b0000_0000_0000_0000_0000_0000;
            binary_value10 <= 24'b0000_0000_0000_0000_0000_0000;
            binary_value11 <= 24'b0000_0000_0000_0000_0000_0000;
            binary_value12 <= 24'b0000_0000_0000_0000_0000_0000;
            binary_value13 <= 24'b0000_0000_0000_0000_0000_0000;
            binary_value14 <= 24'b0000_0000_0000_0000_0000_0000;
            binary_value15 <= 24'b0000_0000_0000_0000_0000_0000;
            binary_value16 <= 24'b0000_0000_0000_0000_0000_0000;
        end else begin
            if (b3c[1:0] == 2'b00) begin
                binary_value1 <= 24'b0000_0000_0000_0000_0000_0000;
            end else if (b3c[1:0] == 2'b01) begin
                binary_value1 <= 24'b0101_0101_0101_0101_0101_0101;
            end else if (b3c[1:0] == 2'b10) begin
                binary_value1 <= 24'b1010_1010_1010_1010_1010_1011;
            end else begin
                binary_value1 <= 24'b1111_1111_1111_1111_1111_1111;
            end
            if (b3c[3:2] == 2'b00) begin
                binary_value2 <= 24'b0000_0000_0000_0000_0000_0000;
            end else if (b3c[3:2] == 2'b01) begin
                binary_value2 <= 24'b0001_1100_0111_0001_1100_0111;
            end else if (b3c[3:2] == 2'b10) begin
                binary_value2 <= 24'b0011_1000_1110_0011_1000_1110;
            end else begin
                binary_value2 <= 24'b1111_1111_1111_1111_1111_1111;
            end
            if (b3c[5:4] == 2'b00) begin
                binary_value3 <= 24'b0000_0000_0000_0000_0000_0000;
            end else if (b3c[5:4] == 2'b01) begin
                binary_value3 <= 24'b0000_1001_0111_1011_0100_0010;
            end else if (b3c[5:4] == 2'b10) begin
                binary_value3 <= 24'b0001_0010_1111_0110_1000_0101;
            end else begin
                binary_value3 <= 24'b1111_1111_1111_1111_1111_1111;
            end
            if (b3c[7:6] == 2'b00) begin
                binary_value4 <= 24'b0000_0000_0000_0000_0000_0000;
            end else if (b3c[7:6] == 2'b01) begin
                binary_value4 <= 24'b0000_0011_0010_1001_0001_0110;
            end else if (b3c[7:6] == 2'b10) begin
                binary_value4 <= 24'b0000_0110_0101_0010_0010_1100;
            end else begin
                binary_value4 <= 24'b1111_1111_1111_1111_1111_1111;
            end
            if (b3c[9:8] == 2'b00) begin
                binary_value5 <= 24'b0000_0000_0000_0000_0000_0000;
            end else if (b3c[9:8] == 2'b01) begin
                binary_value5 <= 24'b0000_0001_0000_1101_1011_0010;
            end else if (b3c[9:8] == 2'b10) begin
                binary_value5 <= 24'b0000_0010_0001_1011_0110_0100;
            end else begin
                binary_value5 <= 24'b1111_1111_1111_1111_1111_1111;
            end
            if (b3c[11:10] == 2'b00) begin
                binary_value6 <= 24'b0000_0000_0000_0000_0000_0000;
            end else if (b3c[11:10] == 2'b01) begin
                binary_value6 <= 24'b0000_0000_0101_1001_1110_0110;
            end else if (b3c[11:10] == 2'b10) begin
                binary_value6 <= 24'b0000_0000_1011_0011_1100_1100;
            end else begin
                binary_value6 <= 24'b1111_1111_1111_1111_1111_1111;
            end
            if (b3c[13:12] == 2'b00) begin
                binary_value7 <= 24'b0000_0000_0000_0000_0000_0000;
            end else if (b3c[13:12] == 2'b01) begin
                binary_value7 <= 24'b0000_0000_0001_1101_1111_0111;
            end else if (b3c[13:12] == 2'b10) begin
                binary_value7 <= 24'b0000_0000_0011_1011_1110_1111;
            end else begin
                binary_value7 <= 24'b1111_1111_1111_1111_1111_1111;
            end
            if (b3c[15:14] == 2'b00) begin
                binary_value8 <= 24'b0000_0000_0000_0000_0000_0000;
            end else if (b3c[15:14] == 2'b01) begin
                binary_value8 <= 24'b0000_0000_0000_1001_1111_1101;
            end else if (b3c[15:14] == 2'b10) begin
                binary_value8 <= 24'b0000_0000_0001_0011_1111_1010;
            end else begin
                binary_value8 <= 24'b1111_1111_1111_1111_1111_1111;
            end
            if (b3c[17:16] == 2'b00) begin
                binary_value9 <= 24'b0000_0000_0000_0000_0000_0000;
            end else if (b3c[17:16] == 2'b01) begin
                binary_value9 <= 24'b0000_0000_0000_0011_0101_0100;
            end else if (b3c[17:16] == 2'b10) begin
                binary_value9 <= 24'b0000_0000_0000_0110_1010_1001;
            end else begin
                binary_value9 <= 24'b1111_1111_1111_1111_1111_1111;
            end
            if (b3c[19:18] == 2'b00) begin
                binary_value10 <= 24'b0000_0000_0000_0000_0000_0000;
            end else if (b3c[19:18] == 2'b01) begin
                binary_value10 <= 24'b0000_0000_0000_0001_0001_1100;
            end else if (b3c[19:18] == 2'b10) begin
                binary_value10 <= 24'b0000_0000_0000_0010_0011_1000;
            end else begin
                binary_value10 <= 24'b1111_1111_1111_1111_1111_1111;
            end
            if (b3c[21:20] == 2'b00) begin
                binary_value11 <= 24'b0000_0000_0000_0000_0000_0000;
            end else if (b3c[21:20] == 2'b01) begin
                binary_value11 <= 24'b0000_0000_0000_0000_0101_1111;
            end else if (b3c[21:20] == 2'b10) begin
                binary_value11 <= 24'b0000_0000_0000_0000_1011_1101;
            end else begin
                binary_value11 <= 24'b1111_1111_1111_1111_1111_1111;
            end
            if (b3c[23:22] == 2'b00) begin
                binary_value12 <= 24'b0000_0000_0000_0000_0000_0000;
            end else if (b3c[23:22] == 2'b01) begin
                binary_value12 <= 24'b0000_0000_0000_0000_0010_0000;
            end else if (b3c[23:22] == 2'b10) begin
                binary_value12 <= 24'b0000_0000_0000_0000_0011_1111;
            end else begin
                binary_value12 <= 24'b1111_1111_1111_1111_1111_1111;
            end
            if (b3c[25:24] == 2'b00) begin
                binary_value13 <= 24'b0000_0000_0000_0000_0000_0000;
            end else if (b3c[25:24] == 2'b01) begin
                binary_value13 <= 24'b0000_0000_0000_0000_0000_1011;
            end else if (b3c[25:24] == 2'b10) begin
                binary_value13 <= 24'b0000_0000_0000_0000_0001_0101;
            end else begin
                binary_value13 <= 24'b1111_1111_1111_1111_1111_1111;
            end
            if (b3c[27:26] == 2'b00) begin
                binary_value14 <= 24'b0000_0000_0000_0000_0000_0000;
            end else if (b3c[27:26] == 2'b01) begin
                binary_value14 <= 24'b0000_0000_0000_0000_0000_0100;
            end else if (b3c[27:26] == 2'b10) begin
                binary_value14 <= 24'b0000_0000_0000_0000_0000_0111;
            end else begin
                binary_value14 <= 24'b1111_1111_1111_1111_1111_1111;
            end
            if (b3c[29:28] == 2'b00) begin
                binary_value15 <= 24'b0000_0000_0000_0000_0000_0000;
            end else if (b3c[29:28] == 2'b01) begin
                binary_value15 <= 24'b0000_0000_0000_0000_0000_0001;
            end else if (b3c[29:28] == 2'b10) begin
                binary_value15 <= 24'b0000_0000_0000_0000_0000_0010;
            end else begin
                binary_value15 <= 24'b1111_1111_1111_1111_1111_1111;
            end
            if (b3c[31:30] == 2'b00) begin
                binary_value16 <= 24'b0000_0000_0000_0000_0000_0000;
            end else if (b3c[31:30] == 2'b01) begin
                binary_value16 <= 24'b0000_0000_0000_0000_0000_0000;
            end else if (b3c[31:30] == 2'b10) begin
                binary_value16 <= 24'b0000_0000_0000_0000_0000_0001;
            end else begin
                binary_value16 <= 24'b1111_1111_1111_1111_1111_1111;
            end
        end
    end
    
    assign out = binary_value1 + binary_value2 + binary_value3 + binary_value4 + binary_value5 + binary_value6 + binary_value7 + binary_value8 +
                 binary_value9 + binary_value10 + binary_value11 + binary_value12 + binary_value13 + binary_value14 + binary_value15 + binary_value16;

endmodule
