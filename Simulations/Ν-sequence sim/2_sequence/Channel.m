function [px1, py1, px2, py2] = Channel(Px1, Py1, Px2, Py2, SNR) 
    in1 = [Px1 Py1];
    in2 = [Px2 Py2];
    out1 = add_awgn_noise(in1, SNR);
    out2 = add_awgn_noise(in2, SNR);
    px1 = out1(1);
    py1 = out1(2);
    px2 = out2(1);
    py2 = out2(2);
end

