import numpy as np
from SC_functions import *
import Halton


def decoding(message):
    bitstream = np.full(len(message), False)
    quarter1 = 3228/4
    quarter3 = quarter1*3
    for i in range(len(message)):
        if(message[i] > quarter1 and message[i] < quarter3):
            bitstream[i] = 1
    return bitstream


'''Script for SC based decoding'''


#scaling = 10**4
scaling = 4096
key_size = 16   #change from 10 to 16
'''SN length determined by maximum values in the computation and final scaling factor'''
SN_length = ((scaling**2)*key_size)//2
#SN_length = scaling**2
test_cases = 100
correct_decryption = 0

halton_sequences = Halton.halton(2, SN_length)

np.save('halton_sequences', halton_sequences)

print('halton sequences saved')

max_recompute = 3

#halton_sequences = np.load('halton_sequences.npy')

for i in range(test_cases):
    print('test case:', i)
    cypher1 = np.round(np.random.rand(key_size, key_size)*3328).astype(int)

    # uniform key distribution
    #key = np.round(np.random.rand(key_size)*3328).astype(int)

    # normal key distribution
    key = np.mod(np.round(np.random.normal(0, np.sqrt(2), key_size)).astype(int) + 3329, 3329)

    cypher2 = np.round(np.random.rand(key_size)*3328).astype(int)

    aux1 = cypher1.dot(key)
    mes1 = aux1 + cypher2

    mes2 = np.mod(mes1, 3329)
    decoded_binary = decoding(mes2)

    cypher1 = cypher1 / scaling

    key = key / scaling

    '''cypher2 scaled differently to be consistent with scaling after multiplication and MUX addition'''
    cypher2 = cypher2 / ((scaling ** 2) * key_size)
    # cypher2 = cypher2 / (scaling ** 2)

    recompute_count = 0

    while recompute_count < max_recompute:

        print('recompute_count:', recompute_count)

        # SNG with Halton sequences.
        halton_sequences_rotated = np.roll(halton_sequences, recompute_count*np.random.randint(1, 500000), axis=0)
        #halton_sequences = np.load('halton_sequences_pc.npy')
        #print(halton_sequences.shape)

        cypher1_SC = usn_lfsr(cypher1, halton_sequences_rotated[:, 0], n=SN_length)
        print('cipher matrix generated')
        key_SC = usn_lfsr(key, halton_sequences_rotated[:, 1], n=SN_length)
        print('cipher key generated')
        cypher2_SC = usn_lfsr(cypher2, halton_sequences_rotated[:, 1], n=SN_length)
        print('cipher part 2 generated')

        # SC matrix-vector multiplication
        mat_vec_out = np.full_like(cypher2_SC, False)
        #mat_vec_out_binary = np.empty_like(cypher2_SC, dtype='int')
        pre_sum_line = np.full_like(key_SC, False)
        pre_sum_line_binary_mod = np.zeros(cypher1_SC.shape[0])
        pre_sum_line_after_mod_SC = np.full_like(pre_sum_line, False)

        # Deterministic SC addition without modulo

        #select_array = np.asarray([np.roll(np.tile(np.arange(10) >= 9, SN_length//10), a) for a in range(10)])

        for k in range(cypher1_SC.shape[0]):
            #correlation_test = np.full(SN_length, False)
            '''multiplications of matrix/vector elements'''
            pre_sum_line = np.logical_and(cypher1_SC[k], key_SC)
            binary_pre_sum_line = cypher1[k]*key
            #print('MAC difference:', binary_pre_sum_line - np.sum(pre_sum_line, axis=-1)/SN_length)
            '''addition of multiplication results, every multiplication result contributes 10% of the result's bits (in hardware done with MUX)'''
            # old version with chunks
            for s in range(key_SC.shape[0]):
                mat_vec_out[k, s*(SN_length//key_SC.shape[0]):(s + 1)*(SN_length//key_SC.shape[0])] = pre_sum_line[s, s*(SN_length//key_SC.shape[0]):(s + 1)*(SN_length//key_SC.shape[0])]
            #mat_vec_out_binary[k] = np.sum(pre_sum_line, axis=0)
            # new CeMux version with counter
            #mat_vec_out[k] = np.sum(np.logical_and(pre_sum_line, select_array), axis=0)
            #for s in range(SN_length):
            #    mat_vec_out[k, s] = pre_sum_line[np.mod(s+2, 10), s]

            # for r in range(pre_sum_line.shape[0]):
            #     correlation_test = np.logical_or(correlation_test, pre_sum_line[r])
            # correlation_sum = np.sum(correlation_test)
            # max_sum = np.max(np.sum(pre_sum_line, axis=-1))
            # print(correlation_sum)
            # print(max_sum)

        pre_final_sum = np.full((2, key_size, SN_length), False)
        #pre_final_sum = np.empty((2, key_size, SN_length), dtype='int')
        pre_final_sum[0] = mat_vec_out
        #pre_final_sum[0] = mat_vec_out_binary
        pre_final_sum[1] = cypher2_SC

        '''final addition of vectors is done with a parallel bit counter'''
        final_sum_binary = np.sum(pre_final_sum, axis=-1)
        final_sum_binary = np.sum(final_sum_binary, axis=0)

        #print(mes1)
        #print(final_sum_binary)
        final_sum_binary = np.mod(final_sum_binary*2, 3329)
        #print(final_sum_binary)
        message = decoding(final_sum_binary)
        print('binary:', decoded_binary)
        print('decrypted:', message)

        cypher1_SC = None
        cypher2_SC = None
        key_SC = None
        mat_vec_out = None

        if np.array_equal(message, decoded_binary):
            correct_decryption = correct_decryption + 1
            recompute_count = max_recompute
        else:
            recompute_count = recompute_count + 1


print('success rate:', correct_decryption/test_cases)