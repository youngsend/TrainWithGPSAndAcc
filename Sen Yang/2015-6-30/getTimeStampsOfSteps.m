function TimeStamps = getTimeStampsOfSteps(TimeSequence, CutLoc)
% TimeSequence is a time sequence and each time consists of second and millisecond.
% CutLoc is from the function getCutLocWithMatlabAutocorr.m

m = size(TimeSequence, 1);
n = size(CutLoc, 1);
TimeStamps = [TimeSequence(1)];
count = 1;
for i = 1:n,
	count = count + CutLoc(i);
	TimeStamps = [TimeStamps; TimeSequence(count)];
end

end
