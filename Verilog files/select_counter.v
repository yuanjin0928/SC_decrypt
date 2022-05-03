`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.12.2021 15:02:38
// Design Name: 
// Module Name: select_counter
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


module select_counter(
    input clk,
    input reset,
    output [3:0] select
    );
    
    reg [23:0] counter = 0;
    reg [3:0] select_reg = 0;
    
    always@ (posedge clk) begin
        if (reset) begin
            counter <= 0;
        end else begin
            counter <= counter + 1;
            if (counter < 24'b0001_0111_1101_0111_1000_0100) begin
                select_reg <= 4'b0000;
            end else if (counter < 24'b0010_1111_1010_1111_0000_1000) begin
                select_reg <= 4'b0001;
            end else if (counter < 24'b0100_0111_1000_0110_1000_1100) begin
                select_reg <= 4'b0010;
            end else if (counter < 24'b0101_1111_0101_1110_0001_0000) begin
                select_reg <= 4'b0011;
            end else if (counter < 24'b0111_0111_0011_0101_1001_0100) begin
                select_reg <= 4'b0100;
            end else if (counter < 24'b1000_1111_0000_1101_0001_1000) begin
                select_reg <= 4'b0101;
            end else if (counter < 24'b1010_0110_1110_0100_1001_1100) begin
                select_reg <= 4'b0110;
            end else if (counter < 24'b1011_1110_1011_1100_0010_0000) begin
                select_reg <= 4'b0111;
            end else if (counter < 24'b1101_0110_1001_0011_1010_0100) begin
                select_reg <= 4'b1000;
            end else if (counter < 24'b1110_1110_0110_1011_0010_1000) begin
                select_reg <= 4'b1001;
            end
        end
    end
    
    assign select = select_reg;
    
endmodule
