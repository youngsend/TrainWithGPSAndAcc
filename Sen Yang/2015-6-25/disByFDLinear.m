function [ dis ] = disByFDLinear( FAll, VAll, Freqs )
%DISBYFDLINEAR Summary of this function goes here
%   Detailed explanation goes here
DAll = VAll./FAll;
theta = normalEqn2(FAll, DAll);
n = size(Freqs, 1);
dis = zeros(n, 1);
for i = 1:n,
    m = size(Freqs{i}, 1);
    Dis = [ones(m,1) Freqs{i}] * theta;
    dis(i) = sum(Dis);
end

end

