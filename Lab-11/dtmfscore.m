function sc = dtmfscore(xx, hh)
    % Normalize the input signal
    xx = xx * (2 / max(abs(xx)));
    
    % Convolve input with filter
    yn = conv(xx, hh);
    
    % Check if maximum absolute value meets threshold
    if max(abs(yn)) >= 0.59
        sc = 1;
    else
        sc = 0;
    end
end