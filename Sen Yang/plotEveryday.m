load testF.mat;
m = size(Freqs,1);
Truth = [50.3 50.05 50.25]';
DMy = cell(m,1);
DOthers = cell(m,1);
for i = 1:m,
    DMy{i} = [];
    DOthers{i} = [];
end

CombineF = cell(7,1);
CombineV = cell(7,1);
TempF = [];
TempV = [];

% There are 7 days
for j = 7:-1:1,
    load(['day', num2str(j), '.mat']);
    for i = 1:m,
        DMy{i} = [DMy{i}; disA(i)];
        DOthers{i} = [DOthers{i}; disBFLinear(i)];
    end
    TempF = [TempF; FA];
    CombineF{8-j} = TempF;
    TempV = [TempV; VA];
    CombineV{8-j} = TempV;
end

figure
title('Blue: My Method, Red:Others Method');
hold on
for i = 1:m,
    DMy{i} = 1 - (abs(DMy{i} - Truth(i)) / Truth(i)) ;
    DOthers{i} = 1 - (abs(DOthers{i} - Truth(i)) / Truth(i));
    plot(DMy{i});
    plot(DOthers{i},'r');
end

save combine.mat CombineF CombineV;


