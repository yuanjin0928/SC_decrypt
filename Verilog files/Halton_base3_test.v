`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/30 11:41:58
// Design Name: 
// Module Name: Halton_base3_test
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

module Halton_base3_test(
    input  clk,
    input  reset,
    //18 mod3 counter, output: 29 bits; SN length = 2^27, which means we need 2^27 number based on ternary
    //representation.3^x = 2^27 => x = ceil(27*log2/log3) = 28. In addtion, we need to use binary number to represent
    //all this tenary number, 2^y = 3^18 => y = ceil(18*log3/log2) => y = 29
    input  [35:0] seed, 
    output [28:0] out
    );
    
    genvar i;
    wire [17:0] carry_in;
    wire [18:0] carry_out;
    wire [35:0] counter;
    
    reg [28:0] binary_value1;
    reg [28:0] binary_value2;
    reg [28:0] binary_value3;
    reg [28:0] binary_value4;
    reg [28:0] binary_value5;
    reg [28:0] binary_value6;
    reg [28:0] binary_value7;
    reg [28:0] binary_value8;
    reg [28:0] binary_value9;
    reg [28:0] binary_value10;
    reg [28:0] binary_value11;
    reg [28:0] binary_value12;
    reg [28:0] binary_value13;
    reg [28:0] binary_value14;
    reg [28:0] binary_value15;
    reg [28:0] binary_value16;
    reg [28:0] binary_value17;
    reg [28:0] binary_value18;
    
    assign carry_in[0] = 1'b1;
    
    generate
        for(i=0; i<18; i=i+1) begin
            mod3_counter units (.clk(clk),.reset(reset),.seed(seed[i*2+:2]),.carry_in(carry_in[i]),.counter(counter[i*2+:2]),.carry_out(carry_in[i+1]));
        end       
    endgenerate
    
    always @ (posedge clk) begin
        if (reset) begin
            binary_value1  <= 29'b0_0000_0000_0000_0000_0000_0000_0000;
            binary_value2  <= 29'b0_0000_0000_0000_0000_0000_0000_0000;
            binary_value3  <= 29'b0_0000_0000_0000_0000_0000_0000_0000;
            binary_value4  <= 29'b0_0000_0000_0000_0000_0000_0000_0000;
            binary_value5  <= 29'b0_0000_0000_0000_0000_0000_0000_0000;
            binary_value6  <= 29'b0_0000_0000_0000_0000_0000_0000_0000;
            binary_value7  <= 29'b0_0000_0000_0000_0000_0000_0000_0000;
            binary_value8  <= 29'b0_0000_0000_0000_0000_0000_0000_0000;
            binary_value9  <= 29'b0_0000_0000_0000_0000_0000_0000_0000;
            binary_value10 <= 29'b0_0000_0000_0000_0000_0000_0000_0000;
            binary_value11 <= 29'b0_0000_0000_0000_0000_0000_0000_0000;
            binary_value12 <= 29'b0_0000_0000_0000_0000_0000_0000_0000;
            binary_value13 <= 29'b0_0000_0000_0000_0000_0000_0000_0000;
            binary_value14 <= 29'b0_0000_0000_0000_0000_0000_0000_0000;
            binary_value15 <= 29'b0_0000_0000_0000_0000_0000_0000_0000;
            binary_value16 <= 29'b0_0000_0000_0000_0000_0000_0000_0000;
            binary_value17 <= 29'b0_0000_0000_0000_0000_0000_0000_0000;
            binary_value18 <= 29'b0_0000_0000_0000_0000_0000_0000_0000;
        end else begin
            if (counter[1:0] == 2'b00) begin
                binary_value1 <= 29'b0_0000_0000_0000_0000_0000_0000_0000;
            end else if (counter[1:0] == 2'b01) begin
                binary_value1 <= 29'b0_0111_1011_0010_1000_0101_1100_0011;
            end else if (counter[1:0] == 2'b10) begin
                binary_value1 <= 29'b0_1111_0110_0101_0000_1011_1000_0110;
            end else begin
                binary_value1 <= 29'b1_1111_1111_1111_1111_1111_1111_1111;
            end
            if (counter[3:2] == 2'b00) begin
                binary_value2 <= 29'b0_0000_0000_0000_0000_0000_0000_0000;
            end else if (counter[3:2] == 2'b01) begin
                binary_value2 <= 29'b0_0010_1001_0000_1101_0111_0100_0001;
            end else if (counter[3:2] == 2'b10) begin
                binary_value2 <= 29'b0_0101_0010_0001_1010_1110_1000_0010;
            end else begin
                binary_value2 <= 29'b1_1111_1111_1111_1111_1111_1111_1111;
            end
            if (counter[5:4] == 2'b00) begin
                binary_value3 <= 29'b0_0000_0000_0000_0000_0000_0000_0000;
            end else if (counter[5:4] == 2'b01) begin
                binary_value3 <= 29'b0_0000_1101_1010_1111_0010_0110_1011;
            end else if (counter[5:4] == 2'b10) begin
                binary_value3 <= 29'b0_0001_1011_0101_1110_0100_1101_0110;
            end else begin
                binary_value3 <= 29'b1_1111_1111_1111_1111_1111_1111_1111;
            end
            if (counter[7:6] == 2'b00) begin
                binary_value4 <= 29'b0_0000_0000_0000_0000_0000_0000_0000;
            end else if (counter[7:6] == 2'b01) begin
                binary_value4 <= 29'b0_0000_0100_1000_1111_1011_0111_1001;
            end else if (counter[7:6] == 2'b10) begin
                binary_value4 <= 29'b0_0000_1001_0001_1111_0110_1111_0010;
            end else begin
                binary_value4 <= 29'b1_1111_1111_1111_1111_1111_1111_1111;
            end
            if (counter[9:8] == 2'b00) begin
                binary_value5 <= 29'b0_0000_0000_0000_0000_0000_0000_0000;
            end else if (counter[9:8] == 2'b01) begin
                binary_value5 <= 29'b0_0000_0001_1000_0101_0011_1101_0011;
            end else if (counter[9:8] == 2'b10) begin
                binary_value5 <= 29'b0_0000_0011_0000_1010_0111_1010_0110;
            end else begin
                binary_value5 <= 29'b1_1111_1111_1111_1111_1111_1111_1111;
            end
            if (counter[11:10] == 2'b00) begin
                binary_value6 <= 29'b0_0000_0000_0000_0000_0000_0000_0000;
            end else if (counter[11:10] == 2'b01) begin
                binary_value6 <= 29'b0_0000_0000_1000_0001_1011_1111_0001;
            end else if (counter[11:10] == 2'b10) begin
                binary_value6 <= 29'b0_0000_0001_0000_0011_0111_1110_0010;
            end else begin
                binary_value6 <= 29'b1_1111_1111_1111_1111_1111_1111_1111;
            end
            if (counter[13:12] == 2'b00) begin
                binary_value7 <= 29'b0_0000_0000_0000_0000_0000_0000_0000;
            end else if (counter[13:12] == 2'b01) begin
                binary_value7 <= 29'b0_0000_0000_0010_1011_0011_1111_1011;
            end else if (counter[13:12] == 2'b10) begin
                binary_value7 <= 29'b0_0000_0000_0101_0110_0111_1111_0110;
            end else begin
                binary_value7 <= 29'b1_1111_1111_1111_1111_1111_1111_1111;
            end
            if (counter[15:14] == 2'b00) begin
                binary_value8 <= 29'b0_0000_0000_0000_0000_0000_0000_0000;
            end else if (counter[15:14] == 2'b01) begin
                binary_value8 <= 29'b0_0000_0000_0000_1110_0110_1010_1001;
            end else if (counter[15:14] == 2'b10) begin
                binary_value8 <= 29'b0_0000_0000_0001_1100_1101_0101_0010;
            end else begin
                binary_value8 <= 29'b1_1111_1111_1111_1111_1111_1111_1111;
            end
            if (counter[17:16] == 2'b00) begin
                binary_value9 <= 29'b0_0000_0000_0000_0000_0000_0000_0000;
            end else if (counter[17:16] == 2'b01) begin
                binary_value9 <= 29'b0_0000_0000_0000_0100_1100_1110_0011;
            end else if (counter[17:16] == 2'b10) begin
                binary_value9 <= 29'b0_0000_0000_0000_1001_1001_1100_0110;
            end else begin
                binary_value9 <= 29'b1_1111_1111_1111_1111_1111_1111_1111;
            end
            if (counter[19:18] == 2'b00) begin
                binary_value10 <= 29'b0_0000_0000_0000_0000_0000_0000_0000;
            end else if (counter[19:18] == 2'b01) begin
                binary_value10 <= 29'b0_0000_0000_0000_0001_1001_1010_0001;
            end else if (counter[19:18] == 2'b10) begin
                binary_value10 <= 29'b0_0000_0000_0000_0011_0011_0100_0010;
            end else begin
                binary_value10 <= 29'b1_1111_1111_1111_1111_1111_1111_1111;
            end
            if (counter[21:20] == 2'b00) begin
                binary_value11 <= 29'b0_0000_0000_0000_0000_0000_0000_0000;
            end else if (counter[21:20] == 2'b01) begin
                binary_value11 <= 29'b0_0000_0000_0000_0000_1000_1000_1011;
            end else if (counter[21:20] == 2'b10) begin
                binary_value11 <= 29'b0_0000_0000_0000_0001_0001_0001_0110;
            end else begin
                binary_value11 <= 29'b1_1111_1111_1111_1111_1111_1111_1111;
            end
            if (counter[23:22] == 2'b00) begin
                binary_value12 <= 29'b0_0000_0000_0000_0000_0000_0000_0000;
            end else if (counter[23:22] == 2'b01) begin
                binary_value12 <= 29'b0_0000_0000_0000_0000_0010_1101_1001;
            end else if (counter[23:22] == 2'b10) begin
                binary_value12 <= 29'b0_0000_0000_0000_0000_0101_1011_0010;
            end else begin
                binary_value12 <= 29'b1_1111_1111_1111_1111_1111_1111_1111;
            end
            if (counter[25:24] == 2'b00) begin
                binary_value13 <= 29'b0_0000_0000_0000_0000_0000_0000_0000;
            end else if (counter[25:24] == 2'b01) begin
                binary_value13 <= 29'b0_0000_0000_0000_0000_0000_1111_0011;
            end else if (counter[25:24] == 2'b10) begin
                binary_value13 <= 29'b0_0000_0000_0000_0000_0001_1110_0110;
            end else begin
                binary_value13 <= 29'b1_1111_1111_1111_1111_1111_1111_1111;
            end
            if (counter[27:26] == 2'b00) begin
                binary_value14 <= 29'b0_0000_0000_0000_0000_0000_0000_0000;
            end else if (counter[27:26] == 2'b01) begin
                binary_value14 <= 29'b0_0000_0000_0000_0000_0000_0101_0001;
            end else if (counter[27:26] == 2'b10) begin
                binary_value14 <= 29'b0_0000_0000_0000_0000_0000_1010_0010;
            end else begin
                binary_value14 <= 29'b1_1111_1111_1111_1111_1111_1111_1111;
            end
            if (counter[29:28] == 2'b00) begin
                binary_value15 <= 29'b0_0000_0000_0000_0000_0000_0000_0000;
            end else if (counter[29:28] == 2'b01) begin
                binary_value15 <= 29'b0_0000_0000_0000_0000_0000_0001_1011;
            end else if (counter[29:28] == 2'b10) begin
                binary_value15 <= 29'b0_0000_0000_0000_0000_0000_0011_0110;
            end else begin
                binary_value15 <= 29'b1_1111_1111_1111_1111_1111_1111_1111;
            end
            if (counter[31:30] == 2'b00) begin
                binary_value16 <= 29'b0_0000_0000_0000_0000_0000_0000_0000;
            end else if (counter[31:30] == 2'b01) begin
                binary_value16 <= 29'b0_0000_0000_0000_0000_0000_0000_1001;
            end else if (counter[31:30] == 2'b10) begin
                binary_value16 <= 29'b0_0000_0000_0000_0000_0000_0001_0010;
            end else begin
                binary_value16 <= 29'b1_1111_1111_1111_1111_1111_1111_1111;
            end
            if (counter[33:32] == 2'b00) begin
                binary_value17 <= 29'b0_0000_0000_0000_0000_0000_0000_0000;
            end else if (counter[33:32] == 2'b01) begin
                binary_value17 <= 29'b0_0000_0000_0000_0000_0000_0000_0011;
            end else if (counter[33:32] == 2'b10) begin
                binary_value17 <= 29'b0_0000_0000_0000_0000_0000_0000_0110;
            end else begin
                binary_value17 <= 29'b1_1111_1111_1111_1111_1111_1111_1111;
            end
            if (counter[35:34] == 2'b00) begin
                binary_value18 <= 29'b0_0000_0000_0000_0000_0000_0000_0000;
            end else if (counter[35:34] == 2'b01) begin
                binary_value18 <= 29'b0_0000_0000_0000_0000_0000_0000_0001;
            end else if (counter[35:34] == 2'b10) begin
                binary_value18 <= 29'b0_0000_0000_0000_0000_0000_0000_0010;
            end else begin
                binary_value18 <= 29'b1_1111_1111_1111_1111_1111_1111_1111;
            end
        end
    end
    
    assign out = binary_value1 + binary_value2 + binary_value3 + binary_value4 + binary_value5 + binary_value6 + binary_value7 + binary_value8 +
                 binary_value9 + binary_value10 + binary_value11 + binary_value12 + binary_value13 + binary_value14 + binary_value15 + binary_value16 + binary_value17 + binary_value18;
    
    
endmodule
