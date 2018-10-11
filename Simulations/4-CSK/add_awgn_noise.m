function [y,n] = add_awgn_noise(x,SNR_dB)
L=length(x);
SNR = 10^(SNR_dB/10);   %SNR to linear scale
Eb = 1/2;                 %Calculate actual symbol energy
N0=Eb/(SNR);            %Find the noise spectral density
if(isreal(x))
    noiseSigma = sqrt(N0/2);            %Standard deviation for AWGN Noise when x is real
    n = normrnd(0, noiseSigma, [1, L]); %computed noise
else
    noiseSigma=sqrt(N0/2);              %Standard deviation for AWGN Noise when x is complex
    n = normrnd(0, noiseSigma, [1, L]); %computed noise
end
y = x + n;                              %received signal
end
