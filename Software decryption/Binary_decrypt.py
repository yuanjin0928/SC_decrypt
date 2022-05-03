import numpy as np


def decoding(message):
    bitstream = np.full(len(message), False)
    quarter1 = 3228/4
    quarter3 = quarter1*3
    for i in range(len(message)):
        if(message[i] > quarter1 and message[i] < quarter3):
            bitstream[i] = 1
    return bitstream


'''Script for conventional binary format'''


repetitions = 10000

cypher1 = np.asarray([[2633,   1879,    933,   2433,   1029,   2817,   2358,   1260,    840,   1881],
  [1447,   2633,   1879,    933,   2433,   1029,   2817,   2358,   1260,    840],
  [2488,   1447,   2633,   1879,    933,   2433,   1029,   2817,   2358,   1260],
  [2068,   2488,   1447,   2633,   1879,    933,   2433,   1029,   2817,   2358],
   [970,   2068,   2488,   1447,   2633,   1879,    933,   2433,   1029,   2817],
   [511,    970,   2068,   2488,   1447,   2633,   1879,    933,   2433,   1029],
  [2299,    511,    970,   2068,   2488,   1447,   2633,   1879,    933,   2433],
   [895,   2299,    511,    970,   2068,   2488,   1447,   2633,   1879,    933],
  [2395,    895,   2299,    511,    970,   2068,   2488,   1447,   2633,   1879],
  [1449,   2395,    895,   2299,    511,    970,   2068,   2488,   1447,   2633]])

key = np.asarray([3326, 1, 3326, 0, 1, 0, 3327, 0, 0, 4])

cypher2 = np.asarray([3327, 2230, 1710, 3252, 1275, 8, 693, 2339, 1354, 1017])

aux1 = np.zeros(cypher2.shape)
#average_decoded = np.zeros(cypher2.shape)

# for r in range(repetitions):
#     aux1 = np.zeros(cypher2.shape)
#
#     'modulo after every multiplication'
#     #for i in range(cypher1.shape[0]):
#     #    for j in range(cypher1.shape[1]):
#     #        aux1[i] = np.mod(aux1[i] + cypher1[i, j]*key[j] + np.random.normal(0, 100), 3329)
#
#     'split multiplication in parts, modulo after every part'
#     parts = 20
#     for i in range(cypher1.shape[0]):
#         for j in range(cypher1.shape[1]):
#             for k in range(parts):
#                 aux1[i] = np.mod(aux1[i] + cypher1[i, j]*(key[j]/parts) + np.random.normal(0, 32), 3329)

aux1 = cypher1.dot(key)
mes1 = aux1 + cypher2
mes2 = np.mod(mes1, 3329)
decoded = decoding(mes2)

print(decoded)                  # should be 1111111010


