function keys = dtmfrun(xx, L, fs)
    %DTMFRUN    keys = dtmfrun(xx,L,fs)
    %    returns the list of key names found in xx.
    %   keys = array of characters, i.e., the decoded key names
    %     xx = DTMF waveform
    %      L = filter length
    %     fs = sampling freq

    % Define center frequencies (DTMF standard frequencies)
    row_freqs = [697, 770, 852, 941];
    col_freqs = [1209, 1336, 1477, 1633];
    center_freqs = [row_freqs, col_freqs];  % Total 8 frequencies

    % Create filter bank
    hh = dtmfdesign(center_freqs, L, fs);  % L x 8 matrix

    % Find tone bursts
    [nstart, nstop] = dtmfcut(xx, fs);

    % DTMF keypad
    dtmf_keys = [
        '1','2','3','A';
        '4','5','6','B';
        '7','8','9','C';
        '*','0','#','D'
    ];

    keys = [];  % Output keys
    for kk = 1:length(nstart)
        x_seg = xx(nstart(kk):nstop(kk));  % Extract tone segment

        score = zeros(1, 8);
        for ii = 1:8
            score(ii) = dtmfscore(x_seg, hh(:, ii));  % Score for each filter
        end

        row_index = find(score(1:4));  % Only row filters
        col_index = find(score(5:8));  % Only column filters

        if length(row_index) == 1 && length(col_index) == 1
            keys(end+1) = dtmf_keys(row_index, col_index);  % Map to keypad
        end
        % Else do nothing (skip unrecognized tones)
    end
end
