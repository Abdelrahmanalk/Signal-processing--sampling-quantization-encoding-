This simple MATLAB program converts signals from analog format to digital format (bit stream) through three fundamental processes: Sampling-Quantization-Encoding.

Here is an overview of the program:

Sampling: given a signal x (t) that is band-limited to maximum frequency (fm) according to the sampling theorem to reconstruct the original signal, you must sample it at least twice the maximum frequency of the signal fs>=2fm.


Quantization is to make a certain number of levels according to this equation:

Levels=2^ (number of bits).

To approximate or quantize each sample to the nearest level of that sample, it takes a defined number of levels. Usually, in voice transmission, it is 8 bits, so L=2^8=256 levels; it is a defined number of levels defined memory (8 bits), and it is easier for the receiver to reconstruct the signal since the levels are already defined.

Finally, encoding is to give each level a particular code or number of bits, for example: 000 101 100, etc.
