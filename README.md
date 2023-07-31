# Signal-processing--sampling-quantization-encoding.
Simple analog to digital converter

This is a simple MATLAB program, which converts signals from analog format to digital format (bit stream), through
Three main processes: Sampling-Quantization-Encoding.
 
Here is an overview of the program:

Sampling according to sampling theorem to reconstruct the original signal you must sample it at least twice the maximum frequency of the signal 
fs>=2fm.

Quantization is to make certain number of levels according to this equation:

Levels=2^(number of bits).

To approximate or quantize each sample to the nearest level of that sample, therefore, to make it
easier to the receiver to reconstruct the signal.

Finally, Encoding is to give each level a certain code or number of bits, for example: 000 101 100 etc.
