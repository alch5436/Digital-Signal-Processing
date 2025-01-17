function Yout = FFTcompression(signal,percentRetained)
% function Yout = FFTcompression(signal,percentRetained)
% This function takes in a signal and a percent of the signal to retain,
% computes the fourier transform and removes the undesired components, and
% returns the FFT of only the percent you want to keep.
% If the percent retained is 90, then the top 90% of the signal will be
% kept.

% Take the Fourier transform
n = 2^nextpow2(length(signal));
S = fft(signal,n);

% Zero out the weaker frequency components and return the signal
dummy = sort(abs(S));
index = round((1-percentRetained/100)*length(dummy))+1;
q = dummy(index);
S(abs(S)<=q) = 0;
Yout = S;

return