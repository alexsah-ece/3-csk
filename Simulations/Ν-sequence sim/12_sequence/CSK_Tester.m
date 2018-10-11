function [BER] = CSK_Tester (bitsSent, snr)
%% SET UP

    nOfBitsSent = 19;   % Number of bits to be encoded all together
    nOfSymbolsSent = 12; % Number of symbols used to encode the above bits every time
    load('Maps_12.mat');

%% Logic
    bitsReceived = zeros(1, length(bitsSent));
    for i=0:nOfBitsSent:length(bitsSent)-nOfBitsSent
      % Determine the 7 symbol sequence
      sum = 0;
      for j=1:1:nOfBitsSent
        sum = sum + bitsSent(i+j)*2^(nOfBitsSent-j);
      end
      sent_symbols = gray_like_combos(M_bits(sum),:);
      received_symbols = zeros(1, nOfSymbolsSent);
      % Determine the received 7 symbol sequence
      for j=1:1:nOfSymbolsSent
          [Px, Py] = Sender(sent_symbols(j));
          [px, py] = Channel(Px, Py, snr);    
          received_symbols(j) = Receiver(px, py);
      end
      % Find the bit representation of the received sequence
      sum = 0;
      for j=1:1:nOfSymbolsSent
          sum = sum + received_symbols(j)*4^(nOfSymbolsSent-j);
      end
      % If you receive a symbol that couldn't have been sent, interpret it
      % as the last on the table
            pos = M_symbols(sum);
            if (pos > length(gray_code))
                pos = length(gray_code);
            end
      bitsReceived(i+1:1:i+nOfBitsSent) = gray_code(pos, :);
    end
   
    [nOfMistakes, BER]=biterr(bitsSent, bitsReceived);
end
