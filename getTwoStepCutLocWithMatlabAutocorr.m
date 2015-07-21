function [CutLoc] = getTwoStepCutLocWithMatlabAutocorr(Acc)
% I use Matlab Autocorr to get the best lag of a sequence of Acc samples. The window size of the sequence is sequence_time seconds which means we use sample_rate * sequence_time samples. Zee use 2 seconds and I use it at first.
CutLoc = [];
m = size(Acc, 1);
i = 1;
sample_rate = 199; % We only use Nexus 4 for collecting GPS data
sequence_time = 2; % a segment duration 2 seconds
len_sequence = floor(sample_rate * sequence_time);

interval_left = floor((sample_rate) * 0.714);
interval_right = floor(sample_rate * 1.429);

while ((i + len_sequence - 1) <= m)   
    sequence = Acc(i:i+len_sequence-1);
    auto_corr_compute = autocorr(sequence, len_sequence-1);

%%%%%%%% How to eliminate the outliers?? I say it's very hard for a man to walk less than 1Hz or more than 3Hz (steps per second). Which means I only need lag for (sample_rate/3, sample_rate) to see the max auto corr.
	
	[pks, locs] = findpeaks(auto_corr_compute); 

%%%%%%%% Then I only choose one-step frequency rather than two-step frequency!
    
    k = find(locs>=interval_left & locs<=interval_right);
    locs = locs(k);
    pks = pks(k);
	
	[M, MI] = max(pks);
    
    best_lag = locs(MI);
    
    %interval_left = best_lag - 10;
    %interval_right = best_lag + 10;
            

%%%%%%%%
	CutLoc = [CutLoc; best_lag - 1]; % for example, i = 1, Lag = 40, then I cut before i = 41, which means the slots number is 40!!! I use best_lag - 1, because the index of auto_corr_compute starts from 1.
	i = i + best_lag - 1;
end

while (i < m)
    remains = Acc(i:end);
    auto_corr_compute = autocorr(remains, size(remains,1)-1);
    [pks, locs] = findpeaks(auto_corr_compute);
   
    k = find(locs>=interval_left & locs<=interval_right);
    locs = locs(k);
    pks = pks(k);
	
	[M, MI] = max(pks);
    
    best_lag = locs(MI);
    
    interval_left = best_lag - 10;
    interval_right = best_lag + 10;
    CutLoc = [CutLoc; best_lag-1];
    i = i + best_lag - 1;
end

n = size(CutLoc, 1);
F = [];
for j = 1:n,
	f = sample_rate / CutLoc(j);
	F = [F; f];
end

%figure;
%plot(CutLoc, '.');
%str = ['Velocity is ', num2str(v), 'km/h; Window Size is ', num2str(sequence_time), 'seconds.'];
%title(str);
end


