`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.07.2021 15:07:50
// Design Name: 
// Module Name: Halton_base2
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


module Halton_base2(
    input         clk,
    input         reset,
    input  [26:0] seed,
    output [26:0] out   //SN length = 2^12*2^12*16/2 = 2^27
    );
    
    reg [26:0] counter;
    reg [26:0] reverse_order_cnt;
    integer i;
    
    always @ (posedge clk) begin
        if (reset) begin
            counter <= seed;
        end else begin
            counter <= counter + 1;
        end
    end
    
    always @ (counter) begin
        for (i=0; i<27; i=i+1) begin
            reverse_order_cnt[i] = counter[26-i];
        end 
    end
    assign out = reverse_order_cnt;
    
//    assign out[23:0] = {counter[0], counter[1], counter[2], counter[3], counter[4], counter[5], counter[6], counter[7], counter[8], counter[9], counter[10],
//                        counter[11], counter[12], counter[13], counter[14], counter[15], counter[16], counter[17], counter[18], counter[19], counter[20],
//                        counter[21], counter[22], counter[23]};
    
endmodule
