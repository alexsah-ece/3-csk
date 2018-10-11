function [px, py] = Channel(Px, Py, SNR)
    in = [Px Py];
    [out, noise] = add_awgn_noise(in, SNR);
    px = out(1);
    py = out(2);
end

