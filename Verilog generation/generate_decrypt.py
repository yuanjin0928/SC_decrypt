import sys
import numpy as np


def tobin(x, s):
    temp =  np.flip(np.asarray([(x >> k) & 1 for k in range(0, s)]))
    return ' '.join(map(str, temp)).replace(" ", "")


f = open('binary_decrypt.txt', mode='a+')

print(f'module binary_decrypt (', file=f)
print('    input wire clk,', file=f)
print('    input wire reset,', file=f)

for x in range(10):
    for y in range(10):
        print(f'    input wire unsigned [11:0] i_cypher1_{x:01d}_{y:01d},', file=f)

for x in range(10):
        print(f'    input wire unsigned [11:0] i_key_{x:01d},', file=f)

for x in range(10):
        print(f'    input wire unsigned [11:0] i_cypher2_{x:01d},', file=f)

for x in range(10):
    print(f'    output wire unsigned [11:0] o_output_{x:01d},', file=f)
print(');', file=f)

for x in range(10):
    print(f'    reg [23:0] w_accu_{x:01d};', file=f)

print('reg [6:0] state_reg;', file=f)

state = 0

print('always @(posedge clk) if (reset) begin state_reg <= 0;', file=f)

for x in range(10):
    print(f'    w_accu_{x:01d} <= 0;', file=f)
print('end else begin', file=f)
print('state <= state + 1;', file=f)
print('case(state)', file=f)

for x in range(10):
    for y in range(10):
        print(f'    2\'b{tobin(x*10 + y, 7)}    : w_accu_{x:01d} <= w_accu_{x:01d} +  i_cypher1_{x:01d}_{y:01d} * i_key_{y:01d};', file=f)

for x in range(10):
    print(f'    2\'b{tobin(100 + x, 7)} :   w_accu_{x:01d} <= (w_accu_{x:01d} + i_cypher2_{x:01d}) % 3329;', file=f)

print('default  : w_accu_0 <= 0;', file=f)
print('endcase', file=f)
print('end', file=f)
print('end', file=f)

for x in range(10):
    print(f'    assign o_output_{x:01d}[11:0] = w_accu_{x:01d}[11:0];', file=f)

print('endmodule', file=f)

f.close()

