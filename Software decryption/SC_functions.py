import numpy as np
import lfsr


Nbits = 4096
Nbytes = Nbits//8


def usn(p, n=Nbits):
    """Construct a random uint8 array with n bits and probability p of a bit being 1."""
    if isinstance(p, list):
        return usn(np.array(p), n)
    if isinstance(p, np.ndarray):
        return np.array([usn(v, n) for v in p.flat]).reshape(p.shape + (n,))
    return np.random.rand(n) < p

def bsn(v, n=Nbits):
    """Construct a bipolar stochastic number of length n."""
    if isinstance(v, list):
        return bsn(np.array(v), n)
    return usn((v + 1) / 2, n)


def usn_fixedpoint(p, n=Nbits):
    """Construct a random uint8 array with n bits and probability p of a bit being 1."""
    if isinstance(p, list):
        return usn_fixedpoint(np.array(p), n)
    if isinstance(p, np.ndarray):
        return np.array([usn_fixedpoint(v, n) for v in p.flat]).reshape(p.shape + (n,))
    return np.floor(np.random.rand(n)*n)/n < p


def bsn_fixedpoint(v, n=Nbits):
    """Construct a bipolar stochastic number of length n."""
    if isinstance(v, list):
        return bsn_fixedpoint(np.array(v), n)
    return usn_fixedpoint((v + 1) / 2, n)


def lfsr_lut(polynomial, starting_state):
    '''
    Create a lookup table for an LFSR with given polynomial

    :param polynomial: polynomial of the lfsr in array form, starting with largest tap.
    :param starting_state: starting state of polynomial in array form
    :return: lookup table of all states in one sequence (max length sequence is assumed)
    '''
    L = lfsr.LFSR(fpoly=polynomial, initstate=starting_state, verbose=False)
    lut = np.full((L.period(), len(starting_state)), False)
    for i in range(L.period()):
        lut[i] = L.next()
    return lut


def create_lfsr_rand(polynomial, starting_state, n=Nbits):
    '''

    :param polynomial: polynomial of the lfsr in array form, starting with largest tap.
    :param starting_state: starting state of polynomial in array form
    :param n: SN length in bit
    :return: lfsr sequence of length n converted to binary
    '''
    lut = lfsr_lut(polynomial, starting_state)
    vector = np.zeros(n)
    for i in range(n):
        vector[i] = binaryToDecimal((lut[np.mod(i, len(lut))]))
    return vector


def usn_lfsr(p, rand, n=Nbits):
    """Construct a random uint8 array with n bits and probability p of a bit being 1."""
    if isinstance(p, list):
        return usn_lfsr(np.array(p), rand, n)
    if isinstance(p, np.ndarray):
        return np.array([usn_lfsr(v, rand, n) for v in p.flat]).reshape(p.shape + (n,))
        # sc_array = []
        # cnt = 0
        # for v in p.flat:
        #     cnt += 1
        #     print(cnt)
        #     if cnt == 90:
        #         print('hello')
        #     single_sc = usn_lfsr(v, rand, n)
        #     print(single_sc)
        #     sc_array.append(single_sc)
        # return sc_array.reshape(p.shape + (n,))
    return rand < p


def bsn_lfsr(v, rand, n=Nbits):
    """Construct a bipolar stochastic number of length n."""
    if isinstance(v, list):
        return bsn_lfsr(np.array(v), n)
    return usn_lfsr((v + 1) / 2, rand, n)


def binaryToDecimal(binary):
    '''
    convert binary fixed point <0 number to decimal

    :param binary: binary number to be converted, given as array.
    :return: decimal value of binary input
    '''
    result = 0
    for i in range(len(binary)):
        result = result + binary[i]*(2**(-i - 1))
    return result


# lookup table for stochastic values of all uint8 (0..255)
_usn_value = np.asarray([bin(x).count('1') / 8 for x in range(256)])
_bsn_value = _usn_value * 2 - 1


def usn_value(us):
    return np.average(_usn_value[us], axis=-1)


def bsn_value(bs):
    return np.average(_bsn_value[bs], axis=-1)


#MUX addition
def random_choice(choices=2, n=Nbits):
    r = np.random.randint(0, choices, n)
    return np.array([r == i for i in range(choices)])


def sn_sum(a):
    """calculates stochastic sum along first axis."""
    s = random_choice(choices=a.shape[0], n=a.shape[-1])
    sum = np.full(a.shape[1:], False)
    for i in range(a.shape[0]):
        sum |= a[i] & s[i]
    return sum


def usn_permutated(value, n=Nbits):
    ones = np.ones(int(np.ceil(value*n)), dtype='bool')
    zero_length = n - len(ones)
    zeros = np.zeros(zero_length, dtype='bool')
    vector = np.concatenate((ones, zeros), axis=None)
    SN = np.random.permutation(vector)
    return SN


def halton_sequence(base, length):
    '''
    halton sequence generator for SNG
    :param base: Halton base
    :param length: sequence length
    :return: sequence of given length with halton sequence values of given base
    '''
    output = np.zeros(length)
    for i in range(length):
        output[i] = halton_generator(base, i + 1)
    return output


def halton_generator(base, index, length):
    '''
    Generates one value for halton sequence
    :param base: sequence base
    :param index: index of value in sequence
    :return: Halton sequence value at given index
    '''
    f = 1
    r = 0
    sequence = np.zeros(length)
    while index > 0:
        f = f/base
        r = r + f * (index % base)
        index = np.floor(index/base)
    return r


def tobin(x, s):
    return np.flip(np.asarray([(x >> k) & 1 for k in range(0, s)]))


