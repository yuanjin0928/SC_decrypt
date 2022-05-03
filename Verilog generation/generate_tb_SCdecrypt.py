import sys
import numpy as np


def tobin(x, s):
    temp =  np.flip(np.asarray([(x >> k) & 1 for k in range(0, s)]))
    return ' '.join(map(str, temp)).replace(" ", "")


cypher1 = ((np.asarray([[2633,   1879,    933,   2433,   1029,   2817,   2358,   1260,    840,   1881],
  [1447,   2633,   1879,    933,   2433,   1029,   2817,   2358,   1260,    840],
  [2488,   1447,   2633,   1879,    933,   2433,   1029,   2817,   2358,   1260],
  [2068,   2488,   1447,   2633,   1879,    933,   2433,   1029,   2817,   2358],
   [970,   2068,   2488,   1447,   2633,   1879,    933,   2433,   1029,   2817],
   [511,    970,   2068,   2488,   1447,   2633,   1879,    933,   2433,   1029],
  [2299,    511,    970,   2068,   2488,   1447,   2633,   1879,    933,   2433],
   [895,   2299,    511,    970,   2068,   2488,   1447,   2633,   1879,    933],
  [2395,    895,   2299,    511,    970,   2068,   2488,   1447,   2633,   1879],
  [1449,   2395,    895,   2299,    511,    970,   2068,   2488,   1447,   2633]]))/4096)*(2**24)

key = ((np.asarray([3326, 1, 3326, 0, 1, 0, 3327, 0, 0, 4]))/4096)*(2**24)

cypher2 = ((np.asarray([3327, 2230, 1710, 3252, 1275, 8, 693, 2339, 1354, 1017]))/(4096**2*16))*(2**24)


f = open('SCdecrypt_tb.txt', mode='a+')

print(f'module SCdecrypt_tb(', file=f)
print(f');', file=f)

print(f'    reg clk = 0;', file=f)
print(f'    always #5 clk = ~clk;', file=f)
print(f'    reg reset = 1;', file=f)
print(f'    reg reset_rng = 1;', file=f)
print(f'    reg [23:0] halton_base2_seed = 0;', file=f)
print(f'    reg [31:0] halton_base3_seed = 0000_0000_0000_0000_0000_0000_0000_0001;', file=f)

for x in range(10):
    print(f'    wire [11:0] o_output_{x:01d};', file=f)

for x in range(10):
    for y in range(10):
        print(f'    reg unsigned [23:0] i_cypher1_{x:01d}_{y:01d} = 24\'b{tobin(int(np.round(cypher1[x, y])), 24)};', file=f)

for x in range(10):
    print(f'    reg unsigned [23:0] i_key_{x:01d} = 24\'b{tobin(int(np.round(key[x])), 24)};', file=f)

for x in range(10):
    print(f'    reg unsigned [23:0] i_cypher2_{x:01d} = 24\'b{tobin(int(np.round(cypher2[x])), 24)};', file=f)

print(f'    SCdecrypt test_decrypt (.clk(clk), .reset(reset), .reset_rng(reset_rng), .halton_base2_seed(halton_base2_seed), .halton_base3_seed(halton_base3_seed),', file=f)
for x in range(10):
    for y in range(10):
        print(f'.i_cypher1_{x:01d}_{y:01d}(i_cypher1_{x:01d}_{y:01d}),', file=f)
for x in range(10):
    print(f'.i_key_{x:01d}(i_key_{x:01d}),', file=f)
for x in range(10):
    print(f'.i_cypher2_{x:01d}(i_cypher2_{x:01d}),', file=f)
for x in range(9):
    print(f'.o_output_{x:01d}(o_output_{x:01d}),', file=f)
print(f'.o_output_9(o_output_9));', file=f)

print(f'    initial begin', file=f)
print(f'    #10 reset_rng = 0;', file=f)
print(f'    #10 reset = 0;', file=f)
print(f'    #156250000 $finish;', file=f)
print(f'    end', file=f)

print(f'    endmodule', file=f)
