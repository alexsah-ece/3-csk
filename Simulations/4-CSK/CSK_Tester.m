function [BER] = CSK_Tester (bitsSent, snr)
    bitsReceived = zeros(length(bitsSent), 1);
    for i=0: 2: length(bitsSent)-2
        bitS0 = bitsSent(i+1);
        bitS1 = bitsSent(i+2);
        [Px, Py] = Sender(bitS0, bitS1);
        [px, py] = Channel(Px, Py, snr);
        [bitR0, bitR1] = Receiver(px, py);
        bitsReceived(i+1) = bitR0;
        bitsReceived(i+2) = bitR1;
    end
    [nOfMistakes, BER]=biterr(bitsSent, bitsReceived);
end
