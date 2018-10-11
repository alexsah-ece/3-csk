function y = Channel(x, SNR_dB)
 
    %Compute No
	SNR = 10^(SNR_dB/10);   
	Eb=2;
	N0=Eb/(SNR);            
	
	noiseSigma = sqrt(N0/2);            %Standard deviation for AWGN Noise when x is real
	n = normrnd(0, noiseSigma); 		%computed noise
	y = x + n;                          %received signal
end

%Eb=(7*2187)/(11*2048);
