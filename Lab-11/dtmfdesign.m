function hh = dtmfdesign(fcent, L, fs)
    numFilters = length(fcent);
    hh = zeros(L, numFilters); % Initialize matrix
    n = 0:L-1; % Time index

    for k = 1:numFilters 
        fb = fcent(k); % Center frequency
        h = cos(2 * pi * fb * n / fs); % Impulse response
        beta = maxbeta(L, fb, fs);
        hh(:, k) = beta * h; % store
    end 
end