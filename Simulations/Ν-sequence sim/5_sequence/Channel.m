function [px, py] = Channel(Px, Py, SNR_dB)
    x = [Px Py];
	L=length(x);
    
    %Compute No
	SNR = 10^(SNR_dB/10);   
	Eb=(5 * 243)/(7 * 128 );         
	N0=Eb/(SNR);            
	
	noiseSigma = sqrt(N0/2);            %Standard deviation for AWGN Noise when x is real
	n = normrnd(0, noiseSigma, [1, L]); %computed noise
	y = x + n;                          %received signal
	
	px = y(1);
	py = y(2);
end

%Eb=(7*2187)/(11*2048);
