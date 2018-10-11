function [BER] = CSK_Tester (bitsSent, snr)
	
	bitsReceived  = zeros(1, length(bitsSent));
	for i=1:1:length(bitsSent)
        s = Sender(bitsSent(i));
        r = Channel(s, snr);
		bitsReceived(i)=Receiver(r);
    [nOfMistakes, BER]=biterr(bitsSent, bitsReceived);
end
