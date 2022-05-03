import sys
import numpy as np

dimension = 10
bit_width = 24


def tobin(x, s):
    temp =  np.flip(np.asarray([(x >> k) & 1 for k in range(0, s)]))
    return ' '.join(map(str, temp)).replace(" ", "")


def cat(read_file, write_file):
    with open(read_file) as f1:
        for l in f1:
            print(l.rstrip(), file=write_file)


f = open('SCdecrypt.txt', mode='a+')

print('`include "Halton_base2.v"', file=f)
print('`include "Halton_base3.v"', file=f)
print('`include "select_counter.v"', file=f)

print(f'module SCdecrypt (', file=f)
print(f'    input wire clk,', file=f)
print(f'    input wire reset,', file=f)
print(f'    input wire reset_rng,', file=f)

print(f'    input wire [23:0] halton_base2_seed,', file=f)
print(f'    input wire [31:0] halton_base3_seed,', file=f)

for x in range(dimension):
    for y in range(dimension):
        print(f'    input wire unsigned [23:0] i_cypher1_{x:01d}_{y:01d},', file=f)

for x in range(dimension):
        print(f'    input wire unsigned [23:0] i_key_{x:01d},', file=f)

for x in range(dimension):
        print(f'    input wire unsigned [23:0] i_cypher2_{x:01d},', file=f)

for x in range(dimension - 1):
    print(f'    output wire unsigned [11:0] o_output_{x:01d},', file=f)
print(f'    output wire unsigned [11:0] o_output_{(dimension - 1):01d}', file=f)

print(');', file=f)

print(f'    wire [{bit_width - 1:01d}:0] w_halton2_rng;', file=f)
print(f'    wire [{bit_width - 1:01d}:0] w_halton3_rng;', file=f)

for rows in range(dimension):
    print(f'    reg [11:0] accu_{rows:01d};', file=f)

print(f'    Halton_base2 halton2 (.clk(clk), .reset(reset_rng), .seed(halton_base2_seed), .out(w_halton2_rng));', file=f)
print(f'    Halton_base3 halton3 (.clk(clk), .reset(reset_rng), .seed(halton_base3_seed), .out(w_halton3_rng));', file=f)

for rows in range(dimension):
    for columns in range(dimension):
        print(f'    wire w_s_cypher1_{rows:01d}_{columns:01d} = w_halton2_rng < i_cypher1_{rows:01d}_{columns:01d};', file=f)

for rows in range(dimension):
    print(f'    wire w_s_key_{rows:01d} = w_halton3_rng < i_key_{rows:01d};', file=f)

for rows in range(dimension):
    print(f'    wire w_s_cypher2_{rows:01d} = w_halton3_rng < i_cypher2_{rows:01d};', file=f)

for rows in range(dimension):
    for columns in range(dimension):
        print(
            f'    wire w_s_post_mult_{rows:01d}_{columns:01d} = w_s_cypher1_{rows:01d}_{columns:01d} & w_s_key_{columns:01d};', file=f)

for rows in range(dimension):
    print(f'    wire w_s_post_mux_{rows:01d};', file=f)

print('wire [3:0] select;', file=f)
print(f'    select_counter select_count (.clk(clk), .reset(reset), .select(select));', file=f)

for rows in range(dimension):
    print(f'    assign w_s_post_mux_{rows:01d} = (((((((w_s_post_mult_{rows:01d}_0 && ~select[0]) || (w_s_post_mult_{rows:01d}_1 && select[0])) && ~select[1]) || '
          f'(((w_s_post_mult_{rows:01d}_2 && ~select[0]) || (w_s_post_mult_{rows:01d}_3 && select[0])) && select[1])) && ~select[2]) || '
          f'(((((w_s_post_mult_{rows:01d}_4 && ~select[0]) || (w_s_post_mult_{rows:01d}_5 && select[0])) && ~select[1]) || '
          f'(((w_s_post_mult_{rows:01d}_6 && ~select[0]) || (w_s_post_mult_{rows:01d}_7 && select[0])) && select[1])) && select[2])) && ~select[3]) ||'
          f'(((w_s_post_mult_{rows:01d}_8 && ~select[0]) || (w_s_post_mult_{rows:01d}_9 && select[0])) && select[3]);', file=f)


'''final addition and accumulation starts here'''

print('always @(posedge clk) if (reset) begin ', file=f)
for rows in range(dimension):
    print(f'    accu_{rows:01d} <= 0;', file=f)
print('end else begin', file=f)
for rows in range(dimension):
    print(f'    if ((accu_{rows:01d} == 12\'b110011111111) & w_s_post_mux_{rows:01d} & w_s_cypher2_{rows:01d}) begin', file=f)
    print(f'    accu_{rows:01d} <= 0;', file=f)
    print(f'    end else if ((accu_{rows:01d} == 12\'b110100000000) & ((w_s_post_mux_{rows:01d} & !w_s_cypher2_{rows:01d}) | (!w_s_post_mux_{rows:01d} & w_s_cypher2_{rows:01d}))) begin', file=f)
    print(f'    accu_{rows:01d} <= 0;', file=f)
    print(f'    end else if ((accu_{rows:01d} == 12\'b110100000000) & w_s_post_mux_{rows:01d} & w_s_cypher2_{rows:01d}) begin', file=f)
    print(f'    accu_{rows:01d} <= 12\'b0000_0000_0001;', file=f)
    print('end else begin', file=f)
    print(f'    accu_{rows:01d} <= accu_{rows:01d} + w_s_post_mux_{rows:01d} + w_s_cypher2_{rows:01d};', file=f)
    print('end', file=f)
print('end', file=f)

for rows in range(dimension):
    print(f'    assign o_output_{rows:01d} = accu_{rows:01d};', file=f)

print('endmodule', file=f)

f.close()

