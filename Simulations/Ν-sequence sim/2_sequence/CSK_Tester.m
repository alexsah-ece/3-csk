function [BER] = CSK_Tester (bitsSent, snr)
    bitsReceived = zeros(length(bitsSent), 1);
    for i=0: 3: length(bitsSent)-3
      bitS0 = bitsSent(i+1);
      bitS1 = bitsSent(i+2);
      bitS2 = bitsSent(i+3);
      [Px1, Py1, Px2, Py2] = Sender(bitS0, bitS1, bitS2);
      [px1, py1, px2, py2] = Channel(Px1, Py1, Px2, Py2, snr);
      [bitR0, bitR1, bitR2] = Receiver(px1, py1, px2, py2);
      bitsReceived(i+1) = bitR0;
      bitsReceived(i+2) = bitR1;
      bitsReceived(i+3) = bitR2;
    end
    [nOfMistakes, BER]=biterr(bitsSent, bitsReceived);
end
