function [dis, theta] = computeDistanceWithThetaAndFrequency(FAll, VAll, Freqs)
% theta must be computed from Cubic model.
% Freqs is a cell
FAllAll = FAll.*FAll;
FAllAllAll = FAllAll.*FAll;
theta = normalEqn2([FAll FAllAll FAllAllAll], VAll);
dis = zeros(size(Freqs,1),1);
for i = 1:size(Freqs,1),
    F = Freqs{i};
    FF = F.*F;
    FFF = FF.*F;
    m = size(F, 1);
    V = [ones(m, 1) F FF FFF] * theta;
    T = 1./F;
    distance = V.*T;
    dis(i) = sum(distance);
end
end
