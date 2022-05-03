`include "Halton_base2.v"
`include "Halton_base3.v"
`include "select_counter.v"
module SCdecrypt (
    input wire clk,
    input wire reset,
    input wire reset_rng,
    input wire [23:0] halton_base2_seed,
    input wire [31:0] halton_base3_seed,
    input wire unsigned [23:0] i_cypher1_0_0,
    input wire unsigned [23:0] i_cypher1_0_1,
    input wire unsigned [23:0] i_cypher1_0_2,
    input wire unsigned [23:0] i_cypher1_0_3,
    input wire unsigned [23:0] i_cypher1_0_4,
    input wire unsigned [23:0] i_cypher1_0_5,
    input wire unsigned [23:0] i_cypher1_0_6,
    input wire unsigned [23:0] i_cypher1_0_7,
    input wire unsigned [23:0] i_cypher1_0_8,
    input wire unsigned [23:0] i_cypher1_0_9,
    input wire unsigned [23:0] i_cypher1_1_0,
    input wire unsigned [23:0] i_cypher1_1_1,
    input wire unsigned [23:0] i_cypher1_1_2,
    input wire unsigned [23:0] i_cypher1_1_3,
    input wire unsigned [23:0] i_cypher1_1_4,
    input wire unsigned [23:0] i_cypher1_1_5,
    input wire unsigned [23:0] i_cypher1_1_6,
    input wire unsigned [23:0] i_cypher1_1_7,
    input wire unsigned [23:0] i_cypher1_1_8,
    input wire unsigned [23:0] i_cypher1_1_9,
    input wire unsigned [23:0] i_cypher1_2_0,
    input wire unsigned [23:0] i_cypher1_2_1,
    input wire unsigned [23:0] i_cypher1_2_2,
    input wire unsigned [23:0] i_cypher1_2_3,
    input wire unsigned [23:0] i_cypher1_2_4,
    input wire unsigned [23:0] i_cypher1_2_5,
    input wire unsigned [23:0] i_cypher1_2_6,
    input wire unsigned [23:0] i_cypher1_2_7,
    input wire unsigned [23:0] i_cypher1_2_8,
    input wire unsigned [23:0] i_cypher1_2_9,
    input wire unsigned [23:0] i_cypher1_3_0,
    input wire unsigned [23:0] i_cypher1_3_1,
    input wire unsigned [23:0] i_cypher1_3_2,
    input wire unsigned [23:0] i_cypher1_3_3,
    input wire unsigned [23:0] i_cypher1_3_4,
    input wire unsigned [23:0] i_cypher1_3_5,
    input wire unsigned [23:0] i_cypher1_3_6,
    input wire unsigned [23:0] i_cypher1_3_7,
    input wire unsigned [23:0] i_cypher1_3_8,
    input wire unsigned [23:0] i_cypher1_3_9,
    input wire unsigned [23:0] i_cypher1_4_0,
    input wire unsigned [23:0] i_cypher1_4_1,
    input wire unsigned [23:0] i_cypher1_4_2,
    input wire unsigned [23:0] i_cypher1_4_3,
    input wire unsigned [23:0] i_cypher1_4_4,
    input wire unsigned [23:0] i_cypher1_4_5,
    input wire unsigned [23:0] i_cypher1_4_6,
    input wire unsigned [23:0] i_cypher1_4_7,
    input wire unsigned [23:0] i_cypher1_4_8,
    input wire unsigned [23:0] i_cypher1_4_9,
    input wire unsigned [23:0] i_cypher1_5_0,
    input wire unsigned [23:0] i_cypher1_5_1,
    input wire unsigned [23:0] i_cypher1_5_2,
    input wire unsigned [23:0] i_cypher1_5_3,
    input wire unsigned [23:0] i_cypher1_5_4,
    input wire unsigned [23:0] i_cypher1_5_5,
    input wire unsigned [23:0] i_cypher1_5_6,
    input wire unsigned [23:0] i_cypher1_5_7,
    input wire unsigned [23:0] i_cypher1_5_8,
    input wire unsigned [23:0] i_cypher1_5_9,
    input wire unsigned [23:0] i_cypher1_6_0,
    input wire unsigned [23:0] i_cypher1_6_1,
    input wire unsigned [23:0] i_cypher1_6_2,
    input wire unsigned [23:0] i_cypher1_6_3,
    input wire unsigned [23:0] i_cypher1_6_4,
    input wire unsigned [23:0] i_cypher1_6_5,
    input wire unsigned [23:0] i_cypher1_6_6,
    input wire unsigned [23:0] i_cypher1_6_7,
    input wire unsigned [23:0] i_cypher1_6_8,
    input wire unsigned [23:0] i_cypher1_6_9,
    input wire unsigned [23:0] i_cypher1_7_0,
    input wire unsigned [23:0] i_cypher1_7_1,
    input wire unsigned [23:0] i_cypher1_7_2,
    input wire unsigned [23:0] i_cypher1_7_3,
    input wire unsigned [23:0] i_cypher1_7_4,
    input wire unsigned [23:0] i_cypher1_7_5,
    input wire unsigned [23:0] i_cypher1_7_6,
    input wire unsigned [23:0] i_cypher1_7_7,
    input wire unsigned [23:0] i_cypher1_7_8,
    input wire unsigned [23:0] i_cypher1_7_9,
    input wire unsigned [23:0] i_cypher1_8_0,
    input wire unsigned [23:0] i_cypher1_8_1,
    input wire unsigned [23:0] i_cypher1_8_2,
    input wire unsigned [23:0] i_cypher1_8_3,
    input wire unsigned [23:0] i_cypher1_8_4,
    input wire unsigned [23:0] i_cypher1_8_5,
    input wire unsigned [23:0] i_cypher1_8_6,
    input wire unsigned [23:0] i_cypher1_8_7,
    input wire unsigned [23:0] i_cypher1_8_8,
    input wire unsigned [23:0] i_cypher1_8_9,
    input wire unsigned [23:0] i_cypher1_9_0,
    input wire unsigned [23:0] i_cypher1_9_1,
    input wire unsigned [23:0] i_cypher1_9_2,
    input wire unsigned [23:0] i_cypher1_9_3,
    input wire unsigned [23:0] i_cypher1_9_4,
    input wire unsigned [23:0] i_cypher1_9_5,
    input wire unsigned [23:0] i_cypher1_9_6,
    input wire unsigned [23:0] i_cypher1_9_7,
    input wire unsigned [23:0] i_cypher1_9_8,
    input wire unsigned [23:0] i_cypher1_9_9,
    input wire unsigned [23:0] i_key_0,
    input wire unsigned [23:0] i_key_1,
    input wire unsigned [23:0] i_key_2,
    input wire unsigned [23:0] i_key_3,
    input wire unsigned [23:0] i_key_4,
    input wire unsigned [23:0] i_key_5,
    input wire unsigned [23:0] i_key_6,
    input wire unsigned [23:0] i_key_7,
    input wire unsigned [23:0] i_key_8,
    input wire unsigned [23:0] i_key_9,
    input wire unsigned [23:0] i_cypher2_0,
    input wire unsigned [23:0] i_cypher2_1,
    input wire unsigned [23:0] i_cypher2_2,
    input wire unsigned [23:0] i_cypher2_3,
    input wire unsigned [23:0] i_cypher2_4,
    input wire unsigned [23:0] i_cypher2_5,
    input wire unsigned [23:0] i_cypher2_6,
    input wire unsigned [23:0] i_cypher2_7,
    input wire unsigned [23:0] i_cypher2_8,
    input wire unsigned [23:0] i_cypher2_9,
    output wire unsigned [11:0] o_output_0,
    output wire unsigned [11:0] o_output_1,
    output wire unsigned [11:0] o_output_2,
    output wire unsigned [11:0] o_output_3,
    output wire unsigned [11:0] o_output_4,
    output wire unsigned [11:0] o_output_5,
    output wire unsigned [11:0] o_output_6,
    output wire unsigned [11:0] o_output_7,
    output wire unsigned [11:0] o_output_8,
    output wire unsigned [11:0] o_output_9
);
    wire [23:0] w_halton2_rng;
    wire [23:0] w_halton3_rng;
    reg [11:0] accu_0;
    reg [11:0] accu_1;
    reg [11:0] accu_2;
    reg [11:0] accu_3;
    reg [11:0] accu_4;
    reg [11:0] accu_5;
    reg [11:0] accu_6;
    reg [11:0] accu_7;
    reg [11:0] accu_8;
    reg [11:0] accu_9;
    Halton_base2 halton2 (.clk(clk), .reset(reset_rng), .seed(halton_base2_seed), .out(w_halton2_rng));
    Halton_base3 halton3 (.clk(clk), .reset(reset_rng), .seed(halton_base3_seed), .out(w_halton3_rng));
    wire w_s_cypher1_0_0 = w_halton2_rng < i_cypher1_0_0;
    wire w_s_cypher1_0_1 = w_halton2_rng < i_cypher1_0_1;
    wire w_s_cypher1_0_2 = w_halton2_rng < i_cypher1_0_2;
    wire w_s_cypher1_0_3 = w_halton2_rng < i_cypher1_0_3;
    wire w_s_cypher1_0_4 = w_halton2_rng < i_cypher1_0_4;
    wire w_s_cypher1_0_5 = w_halton2_rng < i_cypher1_0_5;
    wire w_s_cypher1_0_6 = w_halton2_rng < i_cypher1_0_6;
    wire w_s_cypher1_0_7 = w_halton2_rng < i_cypher1_0_7;
    wire w_s_cypher1_0_8 = w_halton2_rng < i_cypher1_0_8;
    wire w_s_cypher1_0_9 = w_halton2_rng < i_cypher1_0_9;
    wire w_s_cypher1_1_0 = w_halton2_rng < i_cypher1_1_0;
    wire w_s_cypher1_1_1 = w_halton2_rng < i_cypher1_1_1;
    wire w_s_cypher1_1_2 = w_halton2_rng < i_cypher1_1_2;
    wire w_s_cypher1_1_3 = w_halton2_rng < i_cypher1_1_3;
    wire w_s_cypher1_1_4 = w_halton2_rng < i_cypher1_1_4;
    wire w_s_cypher1_1_5 = w_halton2_rng < i_cypher1_1_5;
    wire w_s_cypher1_1_6 = w_halton2_rng < i_cypher1_1_6;
    wire w_s_cypher1_1_7 = w_halton2_rng < i_cypher1_1_7;
    wire w_s_cypher1_1_8 = w_halton2_rng < i_cypher1_1_8;
    wire w_s_cypher1_1_9 = w_halton2_rng < i_cypher1_1_9;
    wire w_s_cypher1_2_0 = w_halton2_rng < i_cypher1_2_0;
    wire w_s_cypher1_2_1 = w_halton2_rng < i_cypher1_2_1;
    wire w_s_cypher1_2_2 = w_halton2_rng < i_cypher1_2_2;
    wire w_s_cypher1_2_3 = w_halton2_rng < i_cypher1_2_3;
    wire w_s_cypher1_2_4 = w_halton2_rng < i_cypher1_2_4;
    wire w_s_cypher1_2_5 = w_halton2_rng < i_cypher1_2_5;
    wire w_s_cypher1_2_6 = w_halton2_rng < i_cypher1_2_6;
    wire w_s_cypher1_2_7 = w_halton2_rng < i_cypher1_2_7;
    wire w_s_cypher1_2_8 = w_halton2_rng < i_cypher1_2_8;
    wire w_s_cypher1_2_9 = w_halton2_rng < i_cypher1_2_9;
    wire w_s_cypher1_3_0 = w_halton2_rng < i_cypher1_3_0;
    wire w_s_cypher1_3_1 = w_halton2_rng < i_cypher1_3_1;
    wire w_s_cypher1_3_2 = w_halton2_rng < i_cypher1_3_2;
    wire w_s_cypher1_3_3 = w_halton2_rng < i_cypher1_3_3;
    wire w_s_cypher1_3_4 = w_halton2_rng < i_cypher1_3_4;
    wire w_s_cypher1_3_5 = w_halton2_rng < i_cypher1_3_5;
    wire w_s_cypher1_3_6 = w_halton2_rng < i_cypher1_3_6;
    wire w_s_cypher1_3_7 = w_halton2_rng < i_cypher1_3_7;
    wire w_s_cypher1_3_8 = w_halton2_rng < i_cypher1_3_8;
    wire w_s_cypher1_3_9 = w_halton2_rng < i_cypher1_3_9;
    wire w_s_cypher1_4_0 = w_halton2_rng < i_cypher1_4_0;
    wire w_s_cypher1_4_1 = w_halton2_rng < i_cypher1_4_1;
    wire w_s_cypher1_4_2 = w_halton2_rng < i_cypher1_4_2;
    wire w_s_cypher1_4_3 = w_halton2_rng < i_cypher1_4_3;
    wire w_s_cypher1_4_4 = w_halton2_rng < i_cypher1_4_4;
    wire w_s_cypher1_4_5 = w_halton2_rng < i_cypher1_4_5;
    wire w_s_cypher1_4_6 = w_halton2_rng < i_cypher1_4_6;
    wire w_s_cypher1_4_7 = w_halton2_rng < i_cypher1_4_7;
    wire w_s_cypher1_4_8 = w_halton2_rng < i_cypher1_4_8;
    wire w_s_cypher1_4_9 = w_halton2_rng < i_cypher1_4_9;
    wire w_s_cypher1_5_0 = w_halton2_rng < i_cypher1_5_0;
    wire w_s_cypher1_5_1 = w_halton2_rng < i_cypher1_5_1;
    wire w_s_cypher1_5_2 = w_halton2_rng < i_cypher1_5_2;
    wire w_s_cypher1_5_3 = w_halton2_rng < i_cypher1_5_3;
    wire w_s_cypher1_5_4 = w_halton2_rng < i_cypher1_5_4;
    wire w_s_cypher1_5_5 = w_halton2_rng < i_cypher1_5_5;
    wire w_s_cypher1_5_6 = w_halton2_rng < i_cypher1_5_6;
    wire w_s_cypher1_5_7 = w_halton2_rng < i_cypher1_5_7;
    wire w_s_cypher1_5_8 = w_halton2_rng < i_cypher1_5_8;
    wire w_s_cypher1_5_9 = w_halton2_rng < i_cypher1_5_9;
    wire w_s_cypher1_6_0 = w_halton2_rng < i_cypher1_6_0;
    wire w_s_cypher1_6_1 = w_halton2_rng < i_cypher1_6_1;
    wire w_s_cypher1_6_2 = w_halton2_rng < i_cypher1_6_2;
    wire w_s_cypher1_6_3 = w_halton2_rng < i_cypher1_6_3;
    wire w_s_cypher1_6_4 = w_halton2_rng < i_cypher1_6_4;
    wire w_s_cypher1_6_5 = w_halton2_rng < i_cypher1_6_5;
    wire w_s_cypher1_6_6 = w_halton2_rng < i_cypher1_6_6;
    wire w_s_cypher1_6_7 = w_halton2_rng < i_cypher1_6_7;
    wire w_s_cypher1_6_8 = w_halton2_rng < i_cypher1_6_8;
    wire w_s_cypher1_6_9 = w_halton2_rng < i_cypher1_6_9;
    wire w_s_cypher1_7_0 = w_halton2_rng < i_cypher1_7_0;
    wire w_s_cypher1_7_1 = w_halton2_rng < i_cypher1_7_1;
    wire w_s_cypher1_7_2 = w_halton2_rng < i_cypher1_7_2;
    wire w_s_cypher1_7_3 = w_halton2_rng < i_cypher1_7_3;
    wire w_s_cypher1_7_4 = w_halton2_rng < i_cypher1_7_4;
    wire w_s_cypher1_7_5 = w_halton2_rng < i_cypher1_7_5;
    wire w_s_cypher1_7_6 = w_halton2_rng < i_cypher1_7_6;
    wire w_s_cypher1_7_7 = w_halton2_rng < i_cypher1_7_7;
    wire w_s_cypher1_7_8 = w_halton2_rng < i_cypher1_7_8;
    wire w_s_cypher1_7_9 = w_halton2_rng < i_cypher1_7_9;
    wire w_s_cypher1_8_0 = w_halton2_rng < i_cypher1_8_0;
    wire w_s_cypher1_8_1 = w_halton2_rng < i_cypher1_8_1;
    wire w_s_cypher1_8_2 = w_halton2_rng < i_cypher1_8_2;
    wire w_s_cypher1_8_3 = w_halton2_rng < i_cypher1_8_3;
    wire w_s_cypher1_8_4 = w_halton2_rng < i_cypher1_8_4;
    wire w_s_cypher1_8_5 = w_halton2_rng < i_cypher1_8_5;
    wire w_s_cypher1_8_6 = w_halton2_rng < i_cypher1_8_6;
    wire w_s_cypher1_8_7 = w_halton2_rng < i_cypher1_8_7;
    wire w_s_cypher1_8_8 = w_halton2_rng < i_cypher1_8_8;
    wire w_s_cypher1_8_9 = w_halton2_rng < i_cypher1_8_9;
    wire w_s_cypher1_9_0 = w_halton2_rng < i_cypher1_9_0;
    wire w_s_cypher1_9_1 = w_halton2_rng < i_cypher1_9_1;
    wire w_s_cypher1_9_2 = w_halton2_rng < i_cypher1_9_2;
    wire w_s_cypher1_9_3 = w_halton2_rng < i_cypher1_9_3;
    wire w_s_cypher1_9_4 = w_halton2_rng < i_cypher1_9_4;
    wire w_s_cypher1_9_5 = w_halton2_rng < i_cypher1_9_5;
    wire w_s_cypher1_9_6 = w_halton2_rng < i_cypher1_9_6;
    wire w_s_cypher1_9_7 = w_halton2_rng < i_cypher1_9_7;
    wire w_s_cypher1_9_8 = w_halton2_rng < i_cypher1_9_8;
    wire w_s_cypher1_9_9 = w_halton2_rng < i_cypher1_9_9;
    wire w_s_key_0 = w_halton3_rng < i_key_0;
    wire w_s_key_1 = w_halton3_rng < i_key_1;
    wire w_s_key_2 = w_halton3_rng < i_key_2;
    wire w_s_key_3 = w_halton3_rng < i_key_3;
    wire w_s_key_4 = w_halton3_rng < i_key_4;
    wire w_s_key_5 = w_halton3_rng < i_key_5;
    wire w_s_key_6 = w_halton3_rng < i_key_6;
    wire w_s_key_7 = w_halton3_rng < i_key_7;
    wire w_s_key_8 = w_halton3_rng < i_key_8;
    wire w_s_key_9 = w_halton3_rng < i_key_9;
    wire w_s_cypher2_0 = w_halton3_rng < i_cypher2_0;
    wire w_s_cypher2_1 = w_halton3_rng < i_cypher2_1;
    wire w_s_cypher2_2 = w_halton3_rng < i_cypher2_2;
    wire w_s_cypher2_3 = w_halton3_rng < i_cypher2_3;
    wire w_s_cypher2_4 = w_halton3_rng < i_cypher2_4;
    wire w_s_cypher2_5 = w_halton3_rng < i_cypher2_5;
    wire w_s_cypher2_6 = w_halton3_rng < i_cypher2_6;
    wire w_s_cypher2_7 = w_halton3_rng < i_cypher2_7;
    wire w_s_cypher2_8 = w_halton3_rng < i_cypher2_8;
    wire w_s_cypher2_9 = w_halton3_rng < i_cypher2_9;
    wire w_s_post_mult_0_0 = w_s_cypher1_0_0 & w_s_key_0;
    wire w_s_post_mult_0_1 = w_s_cypher1_0_1 & w_s_key_1;
    wire w_s_post_mult_0_2 = w_s_cypher1_0_2 & w_s_key_2;
    wire w_s_post_mult_0_3 = w_s_cypher1_0_3 & w_s_key_3;
    wire w_s_post_mult_0_4 = w_s_cypher1_0_4 & w_s_key_4;
    wire w_s_post_mult_0_5 = w_s_cypher1_0_5 & w_s_key_5;
    wire w_s_post_mult_0_6 = w_s_cypher1_0_6 & w_s_key_6;
    wire w_s_post_mult_0_7 = w_s_cypher1_0_7 & w_s_key_7;
    wire w_s_post_mult_0_8 = w_s_cypher1_0_8 & w_s_key_8;
    wire w_s_post_mult_0_9 = w_s_cypher1_0_9 & w_s_key_9;
    wire w_s_post_mult_1_0 = w_s_cypher1_1_0 & w_s_key_0;
    wire w_s_post_mult_1_1 = w_s_cypher1_1_1 & w_s_key_1;
    wire w_s_post_mult_1_2 = w_s_cypher1_1_2 & w_s_key_2;
    wire w_s_post_mult_1_3 = w_s_cypher1_1_3 & w_s_key_3;
    wire w_s_post_mult_1_4 = w_s_cypher1_1_4 & w_s_key_4;
    wire w_s_post_mult_1_5 = w_s_cypher1_1_5 & w_s_key_5;
    wire w_s_post_mult_1_6 = w_s_cypher1_1_6 & w_s_key_6;
    wire w_s_post_mult_1_7 = w_s_cypher1_1_7 & w_s_key_7;
    wire w_s_post_mult_1_8 = w_s_cypher1_1_8 & w_s_key_8;
    wire w_s_post_mult_1_9 = w_s_cypher1_1_9 & w_s_key_9;
    wire w_s_post_mult_2_0 = w_s_cypher1_2_0 & w_s_key_0;
    wire w_s_post_mult_2_1 = w_s_cypher1_2_1 & w_s_key_1;
    wire w_s_post_mult_2_2 = w_s_cypher1_2_2 & w_s_key_2;
    wire w_s_post_mult_2_3 = w_s_cypher1_2_3 & w_s_key_3;
    wire w_s_post_mult_2_4 = w_s_cypher1_2_4 & w_s_key_4;
    wire w_s_post_mult_2_5 = w_s_cypher1_2_5 & w_s_key_5;
    wire w_s_post_mult_2_6 = w_s_cypher1_2_6 & w_s_key_6;
    wire w_s_post_mult_2_7 = w_s_cypher1_2_7 & w_s_key_7;
    wire w_s_post_mult_2_8 = w_s_cypher1_2_8 & w_s_key_8;
    wire w_s_post_mult_2_9 = w_s_cypher1_2_9 & w_s_key_9;
    wire w_s_post_mult_3_0 = w_s_cypher1_3_0 & w_s_key_0;
    wire w_s_post_mult_3_1 = w_s_cypher1_3_1 & w_s_key_1;
    wire w_s_post_mult_3_2 = w_s_cypher1_3_2 & w_s_key_2;
    wire w_s_post_mult_3_3 = w_s_cypher1_3_3 & w_s_key_3;
    wire w_s_post_mult_3_4 = w_s_cypher1_3_4 & w_s_key_4;
    wire w_s_post_mult_3_5 = w_s_cypher1_3_5 & w_s_key_5;
    wire w_s_post_mult_3_6 = w_s_cypher1_3_6 & w_s_key_6;
    wire w_s_post_mult_3_7 = w_s_cypher1_3_7 & w_s_key_7;
    wire w_s_post_mult_3_8 = w_s_cypher1_3_8 & w_s_key_8;
    wire w_s_post_mult_3_9 = w_s_cypher1_3_9 & w_s_key_9;
    wire w_s_post_mult_4_0 = w_s_cypher1_4_0 & w_s_key_0;
    wire w_s_post_mult_4_1 = w_s_cypher1_4_1 & w_s_key_1;
    wire w_s_post_mult_4_2 = w_s_cypher1_4_2 & w_s_key_2;
    wire w_s_post_mult_4_3 = w_s_cypher1_4_3 & w_s_key_3;
    wire w_s_post_mult_4_4 = w_s_cypher1_4_4 & w_s_key_4;
    wire w_s_post_mult_4_5 = w_s_cypher1_4_5 & w_s_key_5;
    wire w_s_post_mult_4_6 = w_s_cypher1_4_6 & w_s_key_6;
    wire w_s_post_mult_4_7 = w_s_cypher1_4_7 & w_s_key_7;
    wire w_s_post_mult_4_8 = w_s_cypher1_4_8 & w_s_key_8;
    wire w_s_post_mult_4_9 = w_s_cypher1_4_9 & w_s_key_9;
    wire w_s_post_mult_5_0 = w_s_cypher1_5_0 & w_s_key_0;
    wire w_s_post_mult_5_1 = w_s_cypher1_5_1 & w_s_key_1;
    wire w_s_post_mult_5_2 = w_s_cypher1_5_2 & w_s_key_2;
    wire w_s_post_mult_5_3 = w_s_cypher1_5_3 & w_s_key_3;
    wire w_s_post_mult_5_4 = w_s_cypher1_5_4 & w_s_key_4;
    wire w_s_post_mult_5_5 = w_s_cypher1_5_5 & w_s_key_5;
    wire w_s_post_mult_5_6 = w_s_cypher1_5_6 & w_s_key_6;
    wire w_s_post_mult_5_7 = w_s_cypher1_5_7 & w_s_key_7;
    wire w_s_post_mult_5_8 = w_s_cypher1_5_8 & w_s_key_8;
    wire w_s_post_mult_5_9 = w_s_cypher1_5_9 & w_s_key_9;
    wire w_s_post_mult_6_0 = w_s_cypher1_6_0 & w_s_key_0;
    wire w_s_post_mult_6_1 = w_s_cypher1_6_1 & w_s_key_1;
    wire w_s_post_mult_6_2 = w_s_cypher1_6_2 & w_s_key_2;
    wire w_s_post_mult_6_3 = w_s_cypher1_6_3 & w_s_key_3;
    wire w_s_post_mult_6_4 = w_s_cypher1_6_4 & w_s_key_4;
    wire w_s_post_mult_6_5 = w_s_cypher1_6_5 & w_s_key_5;
    wire w_s_post_mult_6_6 = w_s_cypher1_6_6 & w_s_key_6;
    wire w_s_post_mult_6_7 = w_s_cypher1_6_7 & w_s_key_7;
    wire w_s_post_mult_6_8 = w_s_cypher1_6_8 & w_s_key_8;
    wire w_s_post_mult_6_9 = w_s_cypher1_6_9 & w_s_key_9;
    wire w_s_post_mult_7_0 = w_s_cypher1_7_0 & w_s_key_0;
    wire w_s_post_mult_7_1 = w_s_cypher1_7_1 & w_s_key_1;
    wire w_s_post_mult_7_2 = w_s_cypher1_7_2 & w_s_key_2;
    wire w_s_post_mult_7_3 = w_s_cypher1_7_3 & w_s_key_3;
    wire w_s_post_mult_7_4 = w_s_cypher1_7_4 & w_s_key_4;
    wire w_s_post_mult_7_5 = w_s_cypher1_7_5 & w_s_key_5;
    wire w_s_post_mult_7_6 = w_s_cypher1_7_6 & w_s_key_6;
    wire w_s_post_mult_7_7 = w_s_cypher1_7_7 & w_s_key_7;
    wire w_s_post_mult_7_8 = w_s_cypher1_7_8 & w_s_key_8;
    wire w_s_post_mult_7_9 = w_s_cypher1_7_9 & w_s_key_9;
    wire w_s_post_mult_8_0 = w_s_cypher1_8_0 & w_s_key_0;
    wire w_s_post_mult_8_1 = w_s_cypher1_8_1 & w_s_key_1;
    wire w_s_post_mult_8_2 = w_s_cypher1_8_2 & w_s_key_2;
    wire w_s_post_mult_8_3 = w_s_cypher1_8_3 & w_s_key_3;
    wire w_s_post_mult_8_4 = w_s_cypher1_8_4 & w_s_key_4;
    wire w_s_post_mult_8_5 = w_s_cypher1_8_5 & w_s_key_5;
    wire w_s_post_mult_8_6 = w_s_cypher1_8_6 & w_s_key_6;
    wire w_s_post_mult_8_7 = w_s_cypher1_8_7 & w_s_key_7;
    wire w_s_post_mult_8_8 = w_s_cypher1_8_8 & w_s_key_8;
    wire w_s_post_mult_8_9 = w_s_cypher1_8_9 & w_s_key_9;
    wire w_s_post_mult_9_0 = w_s_cypher1_9_0 & w_s_key_0;
    wire w_s_post_mult_9_1 = w_s_cypher1_9_1 & w_s_key_1;
    wire w_s_post_mult_9_2 = w_s_cypher1_9_2 & w_s_key_2;
    wire w_s_post_mult_9_3 = w_s_cypher1_9_3 & w_s_key_3;
    wire w_s_post_mult_9_4 = w_s_cypher1_9_4 & w_s_key_4;
    wire w_s_post_mult_9_5 = w_s_cypher1_9_5 & w_s_key_5;
    wire w_s_post_mult_9_6 = w_s_cypher1_9_6 & w_s_key_6;
    wire w_s_post_mult_9_7 = w_s_cypher1_9_7 & w_s_key_7;
    wire w_s_post_mult_9_8 = w_s_cypher1_9_8 & w_s_key_8;
    wire w_s_post_mult_9_9 = w_s_cypher1_9_9 & w_s_key_9;
    wire w_s_post_mux_0;
    wire w_s_post_mux_1;
    wire w_s_post_mux_2;
    wire w_s_post_mux_3;
    wire w_s_post_mux_4;
    wire w_s_post_mux_5;
    wire w_s_post_mux_6;
    wire w_s_post_mux_7;
    wire w_s_post_mux_8;
    wire w_s_post_mux_9;
wire [3:0] select;
    select_counter select_count (.clk(clk), .reset(reset), .select(select));
    assign w_s_post_mux_0 = (((((((w_s_post_mult_0_0 && ~select[0]) || (w_s_post_mult_0_1 && select[0])) && ~select[1]) || (((w_s_post_mult_0_2 && ~select[0]) || (w_s_post_mult_0_3 && select[0])) && select[1])) && ~select[2]) || (((((w_s_post_mult_0_4 && ~select[0]) || (w_s_post_mult_0_5 && select[0])) && ~select[1]) || (((w_s_post_mult_0_6 && ~select[0]) || (w_s_post_mult_0_7 && select[0])) && select[1])) && select[2])) && ~select[3]) ||(((w_s_post_mult_0_8 && ~select[0]) || (w_s_post_mult_0_9 && select[0])) && select[3]);
    assign w_s_post_mux_1 = (((((((w_s_post_mult_1_0 && ~select[0]) || (w_s_post_mult_1_1 && select[0])) && ~select[1]) || (((w_s_post_mult_1_2 && ~select[0]) || (w_s_post_mult_1_3 && select[0])) && select[1])) && ~select[2]) || (((((w_s_post_mult_1_4 && ~select[0]) || (w_s_post_mult_1_5 && select[0])) && ~select[1]) || (((w_s_post_mult_1_6 && ~select[0]) || (w_s_post_mult_1_7 && select[0])) && select[1])) && select[2])) && ~select[3]) ||(((w_s_post_mult_1_8 && ~select[0]) || (w_s_post_mult_1_9 && select[0])) && select[3]);
    assign w_s_post_mux_2 = (((((((w_s_post_mult_2_0 && ~select[0]) || (w_s_post_mult_2_1 && select[0])) && ~select[1]) || (((w_s_post_mult_2_2 && ~select[0]) || (w_s_post_mult_2_3 && select[0])) && select[1])) && ~select[2]) || (((((w_s_post_mult_2_4 && ~select[0]) || (w_s_post_mult_2_5 && select[0])) && ~select[1]) || (((w_s_post_mult_2_6 && ~select[0]) || (w_s_post_mult_2_7 && select[0])) && select[1])) && select[2])) && ~select[3]) ||(((w_s_post_mult_2_8 && ~select[0]) || (w_s_post_mult_2_9 && select[0])) && select[3]);
    assign w_s_post_mux_3 = (((((((w_s_post_mult_3_0 && ~select[0]) || (w_s_post_mult_3_1 && select[0])) && ~select[1]) || (((w_s_post_mult_3_2 && ~select[0]) || (w_s_post_mult_3_3 && select[0])) && select[1])) && ~select[2]) || (((((w_s_post_mult_3_4 && ~select[0]) || (w_s_post_mult_3_5 && select[0])) && ~select[1]) || (((w_s_post_mult_3_6 && ~select[0]) || (w_s_post_mult_3_7 && select[0])) && select[1])) && select[2])) && ~select[3]) ||(((w_s_post_mult_3_8 && ~select[0]) || (w_s_post_mult_3_9 && select[0])) && select[3]);
    assign w_s_post_mux_4 = (((((((w_s_post_mult_4_0 && ~select[0]) || (w_s_post_mult_4_1 && select[0])) && ~select[1]) || (((w_s_post_mult_4_2 && ~select[0]) || (w_s_post_mult_4_3 && select[0])) && select[1])) && ~select[2]) || (((((w_s_post_mult_4_4 && ~select[0]) || (w_s_post_mult_4_5 && select[0])) && ~select[1]) || (((w_s_post_mult_4_6 && ~select[0]) || (w_s_post_mult_4_7 && select[0])) && select[1])) && select[2])) && ~select[3]) ||(((w_s_post_mult_4_8 && ~select[0]) || (w_s_post_mult_4_9 && select[0])) && select[3]);
    assign w_s_post_mux_5 = (((((((w_s_post_mult_5_0 && ~select[0]) || (w_s_post_mult_5_1 && select[0])) && ~select[1]) || (((w_s_post_mult_5_2 && ~select[0]) || (w_s_post_mult_5_3 && select[0])) && select[1])) && ~select[2]) || (((((w_s_post_mult_5_4 && ~select[0]) || (w_s_post_mult_5_5 && select[0])) && ~select[1]) || (((w_s_post_mult_5_6 && ~select[0]) || (w_s_post_mult_5_7 && select[0])) && select[1])) && select[2])) && ~select[3]) ||(((w_s_post_mult_5_8 && ~select[0]) || (w_s_post_mult_5_9 && select[0])) && select[3]);
    assign w_s_post_mux_6 = (((((((w_s_post_mult_6_0 && ~select[0]) || (w_s_post_mult_6_1 && select[0])) && ~select[1]) || (((w_s_post_mult_6_2 && ~select[0]) || (w_s_post_mult_6_3 && select[0])) && select[1])) && ~select[2]) || (((((w_s_post_mult_6_4 && ~select[0]) || (w_s_post_mult_6_5 && select[0])) && ~select[1]) || (((w_s_post_mult_6_6 && ~select[0]) || (w_s_post_mult_6_7 && select[0])) && select[1])) && select[2])) && ~select[3]) ||(((w_s_post_mult_6_8 && ~select[0]) || (w_s_post_mult_6_9 && select[0])) && select[3]);
    assign w_s_post_mux_7 = (((((((w_s_post_mult_7_0 && ~select[0]) || (w_s_post_mult_7_1 && select[0])) && ~select[1]) || (((w_s_post_mult_7_2 && ~select[0]) || (w_s_post_mult_7_3 && select[0])) && select[1])) && ~select[2]) || (((((w_s_post_mult_7_4 && ~select[0]) || (w_s_post_mult_7_5 && select[0])) && ~select[1]) || (((w_s_post_mult_7_6 && ~select[0]) || (w_s_post_mult_7_7 && select[0])) && select[1])) && select[2])) && ~select[3]) ||(((w_s_post_mult_7_8 && ~select[0]) || (w_s_post_mult_7_9 && select[0])) && select[3]);
    assign w_s_post_mux_8 = (((((((w_s_post_mult_8_0 && ~select[0]) || (w_s_post_mult_8_1 && select[0])) && ~select[1]) || (((w_s_post_mult_8_2 && ~select[0]) || (w_s_post_mult_8_3 && select[0])) && select[1])) && ~select[2]) || (((((w_s_post_mult_8_4 && ~select[0]) || (w_s_post_mult_8_5 && select[0])) && ~select[1]) || (((w_s_post_mult_8_6 && ~select[0]) || (w_s_post_mult_8_7 && select[0])) && select[1])) && select[2])) && ~select[3]) ||(((w_s_post_mult_8_8 && ~select[0]) || (w_s_post_mult_8_9 && select[0])) && select[3]);
    assign w_s_post_mux_9 = (((((((w_s_post_mult_9_0 && ~select[0]) || (w_s_post_mult_9_1 && select[0])) && ~select[1]) || (((w_s_post_mult_9_2 && ~select[0]) || (w_s_post_mult_9_3 && select[0])) && select[1])) && ~select[2]) || (((((w_s_post_mult_9_4 && ~select[0]) || (w_s_post_mult_9_5 && select[0])) && ~select[1]) || (((w_s_post_mult_9_6 && ~select[0]) || (w_s_post_mult_9_7 && select[0])) && select[1])) && select[2])) && ~select[3]) ||(((w_s_post_mult_9_8 && ~select[0]) || (w_s_post_mult_9_9 && select[0])) && select[3]);
always @(posedge clk) if (reset) begin 
    accu_0 <= 0;
    accu_1 <= 0;
    accu_2 <= 0;
    accu_3 <= 0;
    accu_4 <= 0;
    accu_5 <= 0;
    accu_6 <= 0;
    accu_7 <= 0;
    accu_8 <= 0;
    accu_9 <= 0;
end else begin
    if ((accu_0 == 12'b110011111111) & w_s_post_mux_0 & w_s_cypher2_0) begin
    accu_0 <= 0;
    end else if ((accu_0 == 12'b110100000000) & ((w_s_post_mux_0 & !w_s_cypher2_0) | (!w_s_post_mux_0 & w_s_cypher2_0))) begin
    accu_0 <= 0;
    end else if ((accu_0 == 12'b110100000000) & w_s_post_mux_0 & w_s_cypher2_0) begin
    accu_0 <= 12'b0000_0000_0001;
end else begin
    accu_0 <= accu_0 + w_s_post_mux_0 + w_s_cypher2_0;
end
    if ((accu_1 == 12'b110011111111) & w_s_post_mux_1 & w_s_cypher2_1) begin
    accu_1 <= 0;
    end else if ((accu_1 == 12'b110100000000) & ((w_s_post_mux_1 & !w_s_cypher2_1) | (!w_s_post_mux_1 & w_s_cypher2_1))) begin
    accu_1 <= 0;
    end else if ((accu_1 == 12'b110100000000) & w_s_post_mux_1 & w_s_cypher2_1) begin
    accu_1 <= 12'b0000_0000_0001;
end else begin
    accu_1 <= accu_1 + w_s_post_mux_1 + w_s_cypher2_1;
end
    if ((accu_2 == 12'b110011111111) & w_s_post_mux_2 & w_s_cypher2_2) begin
    accu_2 <= 0;
    end else if ((accu_2 == 12'b110100000000) & ((w_s_post_mux_2 & !w_s_cypher2_2) | (!w_s_post_mux_2 & w_s_cypher2_2))) begin
    accu_2 <= 0;
    end else if ((accu_2 == 12'b110100000000) & w_s_post_mux_2 & w_s_cypher2_2) begin
    accu_2 <= 12'b0000_0000_0001;
end else begin
    accu_2 <= accu_2 + w_s_post_mux_2 + w_s_cypher2_2;
end
    if ((accu_3 == 12'b110011111111) & w_s_post_mux_3 & w_s_cypher2_3) begin
    accu_3 <= 0;
    end else if ((accu_3 == 12'b110100000000) & ((w_s_post_mux_3 & !w_s_cypher2_3) | (!w_s_post_mux_3 & w_s_cypher2_3))) begin
    accu_3 <= 0;
    end else if ((accu_3 == 12'b110100000000) & w_s_post_mux_3 & w_s_cypher2_3) begin
    accu_3 <= 12'b0000_0000_0001;
end else begin
    accu_3 <= accu_3 + w_s_post_mux_3 + w_s_cypher2_3;
end
    if ((accu_4 == 12'b110011111111) & w_s_post_mux_4 & w_s_cypher2_4) begin
    accu_4 <= 0;
    end else if ((accu_4 == 12'b110100000000) & ((w_s_post_mux_4 & !w_s_cypher2_4) | (!w_s_post_mux_4 & w_s_cypher2_4))) begin
    accu_4 <= 0;
    end else if ((accu_4 == 12'b110100000000) & w_s_post_mux_4 & w_s_cypher2_4) begin
    accu_4 <= 12'b0000_0000_0001;
end else begin
    accu_4 <= accu_4 + w_s_post_mux_4 + w_s_cypher2_4;
end
    if ((accu_5 == 12'b110011111111) & w_s_post_mux_5 & w_s_cypher2_5) begin
    accu_5 <= 0;
    end else if ((accu_5 == 12'b110100000000) & ((w_s_post_mux_5 & !w_s_cypher2_5) | (!w_s_post_mux_5 & w_s_cypher2_5))) begin
    accu_5 <= 0;
    end else if ((accu_5 == 12'b110100000000) & w_s_post_mux_5 & w_s_cypher2_5) begin
    accu_5 <= 12'b0000_0000_0001;
end else begin
    accu_5 <= accu_5 + w_s_post_mux_5 + w_s_cypher2_5;
end
    if ((accu_6 == 12'b110011111111) & w_s_post_mux_6 & w_s_cypher2_6) begin
    accu_6 <= 0;
    end else if ((accu_6 == 12'b110100000000) & ((w_s_post_mux_6 & !w_s_cypher2_6) | (!w_s_post_mux_6 & w_s_cypher2_6))) begin
    accu_6 <= 0;
    end else if ((accu_6 == 12'b110100000000) & w_s_post_mux_6 & w_s_cypher2_6) begin
    accu_6 <= 12'b0000_0000_0001;
end else begin
    accu_6 <= accu_6 + w_s_post_mux_6 + w_s_cypher2_6;
end
    if ((accu_7 == 12'b110011111111) & w_s_post_mux_7 & w_s_cypher2_7) begin
    accu_7 <= 0;
    end else if ((accu_7 == 12'b110100000000) & ((w_s_post_mux_7 & !w_s_cypher2_7) | (!w_s_post_mux_7 & w_s_cypher2_7))) begin
    accu_7 <= 0;
    end else if ((accu_7 == 12'b110100000000) & w_s_post_mux_7 & w_s_cypher2_7) begin
    accu_7 <= 12'b0000_0000_0001;
end else begin
    accu_7 <= accu_7 + w_s_post_mux_7 + w_s_cypher2_7;
end
    if ((accu_8 == 12'b110011111111) & w_s_post_mux_8 & w_s_cypher2_8) begin
    accu_8 <= 0;
    end else if ((accu_8 == 12'b110100000000) & ((w_s_post_mux_8 & !w_s_cypher2_8) | (!w_s_post_mux_8 & w_s_cypher2_8))) begin
    accu_8 <= 0;
    end else if ((accu_8 == 12'b110100000000) & w_s_post_mux_8 & w_s_cypher2_8) begin
    accu_8 <= 12'b0000_0000_0001;
end else begin
    accu_8 <= accu_8 + w_s_post_mux_8 + w_s_cypher2_8;
end
    if ((accu_9 == 12'b110011111111) & w_s_post_mux_9 & w_s_cypher2_9) begin
    accu_9 <= 0;
    end else if ((accu_9 == 12'b110100000000) & ((w_s_post_mux_9 & !w_s_cypher2_9) | (!w_s_post_mux_9 & w_s_cypher2_9))) begin
    accu_9 <= 0;
    end else if ((accu_9 == 12'b110100000000) & w_s_post_mux_9 & w_s_cypher2_9) begin
    accu_9 <= 12'b0000_0000_0001;
end else begin
    accu_9 <= accu_9 + w_s_post_mux_9 + w_s_cypher2_9;
end
end
    assign o_output_0 = accu_0;
    assign o_output_1 = accu_1;
    assign o_output_2 = accu_2;
    assign o_output_3 = accu_3;
    assign o_output_4 = accu_4;
    assign o_output_5 = accu_5;
    assign o_output_6 = accu_6;
    assign o_output_7 = accu_7;
    assign o_output_8 = accu_8;
    assign o_output_9 = accu_9;
endmodule
