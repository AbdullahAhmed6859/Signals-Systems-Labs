function B = maxbeta(L, fb, fs)
    n = 0:L-1;
    h = cos(2 * pi * fb * n / fs);
    
    % frequency response
    H = abs(fft(h, 1024));
    maxH = max(H);

    B = 1 / maxH;
end