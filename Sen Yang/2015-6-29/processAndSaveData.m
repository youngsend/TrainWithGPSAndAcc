% Get FAll and VAll
importAccAndGPS;
% Freqs are Test Data, Remember the name "Freqs"...
[disAll, thetaAll] = computeDistanceWithThetaAndFrequency(FAll, VAll, Freqs);
% Select 90% data using 3-means method
[FA VA] = use3MeansOnFVAll(FAll, VAll);
[disA, thetaA] = computeDistanceWithThetaAndFrequency(FA, VA, Freqs);
disBFLinear = disByFDLinear(FA, VA, Freqs);