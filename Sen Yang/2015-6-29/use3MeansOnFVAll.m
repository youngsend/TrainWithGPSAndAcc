function [ FAll_Clean, VAll_Clean ] = use3MeansOnFVAll( FAll, VAll )
%USE3MEANSONFVALL Summary of this function goes here
%   Detailed explanation goes here
[idx, C] = kmeans([FAll VAll], 3);
x1 = C(1,1);
y1 = C(1,2);
x2 = C(2,1);
y2 = C(2,2);
x3 = C(3,1);
y3 = C(3,2);

% select 80% closest points to centroids
percentage = 90;

F1 = FAll(idx==1);
V1 = VAll(idx==1);
D1 = (F1-x1).*(F1-x1) + (V1-y1).*(V1-y1);
border = prctile(D1,percentage);
index = find(D1<=border);
F1 = F1(index);
V1 = V1(index);


F2 = FAll(idx==2);
V2 = VAll(idx==2);
D2 = (F2-x2).*(F2-x2) + (V2-y2).*(V2-y2);
border = prctile(D2, percentage);
index = find(D2<=border);
F2 = F2(index);
V2 = V2(index);

F3 = FAll(idx==3);
V3 = VAll(idx==3);
D3 = (F3-x3).*(F3-x3) + (V3-y3).*(V3-y3);
border = prctile(D3, percentage);
index = find(D3<=border);
F3 = F3(index);
V3 = V3(index);

FAll_Clean = [F1; F2; F3];
VAll_Clean = [V1; V2; V3];

end

