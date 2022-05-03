`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/30 11:21:42
// Design Name: 
// Module Name: mod3_counter
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

module mod3_counter(
    input        clk,
    input        reset,
    input  [1:0] seed,
    input        carry_in,
    output [1:0] counter,
    output       carry_out 
    );
    
    reg [1:0] counter_reg;
    reg       carry_out_reg;
    assign counter   = counter_reg;
    assign carry_out = carry_out_reg;
    always @ (posedge clk) begin
        if (reset) begin
            counter_reg   <= seed;
            carry_out_reg <= 1'b0;
        end else begin
            if (counter_reg == 2'b10 && carry_in) begin
                counter_reg   <= 2'b0;
                carry_out_reg <= 1'b1;
            end else begin
                counter_reg   <= counter_reg + carry_in; 
                carry_out_reg <= 1'b0;     
            end 
        end  
    end
endmodule
