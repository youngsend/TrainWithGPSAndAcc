function distance = computeDistanceWithThetaAndFrequency(theta, F)
% theta must be computed from Cubic model.
FF = F.*F;
FFF = FF.*F;
m = size(F, 1);
if (size(theta, 1) == 4)
	V = [ones(m, 1) F FF FFF] * theta;
elseif (size(theta, 1) == 3)
	V = [ones(m, 1) F FF] * theta;
else
	V = [ones(m, 1) F] * theta;
end

T = 1./F;
distance = V.*T;

end
