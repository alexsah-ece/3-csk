function [nOfMistakes, centralMistakes] = CSK_Tester (bitsSent, snr)

    bitsReceived = zeros(length(bitsSent), 1);
    centralMistakes = 0;
    
    s1=[0 2/sqrt(5)];
    s2=[0 0];
    s3=[-sqrt(3/5) -sqrt(1/5)];
    s4=[sqrt(3/5) -sqrt(1/5)];
    
    for i=0: 2: length(bitsSent)-2
        bitS0 = bitsSent(i+1);
        bitS1 = bitsSent(i+2);
        [Px, Py] = Sender(bitS0, bitS1);
        s = [Px, Py];
        [px, py] = Channel(Px, Py, snr);
        r = [Px, Py];
        [bitR0, bitR1] = Receiver(px, py);
        bitsReceived(i+1) = bitR0;
        bitsReceived(i+2) = bitR1;
%--------------------------------------------------------------------------       
        if(bitS0==0 && bitS1==1)
            if(bitS0~=bitR0 || bitS1~=bitR1)
                centralMistakes=centralMistakes+1;
            end
        end
        if(bitR0==0 && bitR1==1)
            if(bitS0~=bitR0 || bitS1~=bitR1)
                dmin=min([norm(r-s1) norm(r-s3) norm(r-s4)]);
                if(dmin==norm(r-s))
                    centralMistakes=centralMistakes+1;
                end
            end
        end
%--------------------------------------------------------------------------            
    end
    [nOfMistakes, BER]=biterr(bitsSent, bitsReceived);
    centralMistakes
    nOfMistakes
end
