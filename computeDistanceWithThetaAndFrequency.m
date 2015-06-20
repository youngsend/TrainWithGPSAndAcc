function distance = computeDistanceWithThetaAndFrequency(theta, F)
% theta must be computed from Cubic model.
FF = F.*F;
FFF = FF.*F;
m = size(F, 1);
V = [ones(m, 1) F FF FFF] * theta;
T = 1./F;
distance = V.*T;
