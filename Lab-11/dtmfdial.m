function xx = dtmfdial(keyNames, fs)
    % Define the DTMF keypad layout
    dtmf.keys = [
        '1','2','3','A';
        '4','5','6','B';
        '7','8','9','C';
        '*','0','#','D'
    ];
    
    dtmf.colTones = [1209, 1336, 1477, 1633];
    dtmf.rowTones = [697; 770; 852; 941];

    dur = 0.20;
    t = 0:1/fs:dur;
    silenceLength = 400;
    numKeys = length(keyNames);
    toneLength = length(t);
    totalLength = numKeys * (toneLength + silenceLength);
   
    xx = zeros(1, totalLength);
    
    index = 1;
    for key = keyNames
        [ii, jj] = find(key == dtmf.keys);
        tone = cos(2 * pi * dtmf.rowTones(ii) * t) + cos(2 * pi * dtmf.colTones(jj) * t);
        xx(index:index+toneLength-1) = tone;
        index = index + toneLength + silenceLength;
    end
end
