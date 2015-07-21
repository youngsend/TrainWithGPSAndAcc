% This script is used in a folder including acc folder and gps folder
clear;
% First, enter into acc folder and get all acc data
cd acc;
txtFiles = dir('*.txt');
numfiles = length(txtFiles);
Acc = cell(numfiles, 1);
for i=1:numfiles,
	acc = load(txtFiles(i).name);
	Acc{i} = [acc(:,3) acc(:,6)];
end

cd ..
cd gps;
txtFiles = dir('*.txt');
numfiles = length(txtFiles);
GPS = cell(numfiles, 1);
for i=1:numfiles,
	gps = load(txtFiles(i).name);
	GPS{i} = [gps(:,3) gps(:,4) gps(:,5)];
end
cd ..

CutLoc = cell(numfiles, 1);
GPSTimeStamps = cell(numfiles, 1);
Velocity = cell(numfiles, 1);
AccTimeStamps = cell(numfiles, 1);
Distance = cell(numfiles, 1);

F = cell(numfiles, 1);
V = cell(numfiles, 1);

for i=1:numfiles,
	CutLoc{i} = getCutLocWithMatlabAutocorr(Acc{i}(:,2));
	AccTimeStamps{i} = getTimeStampsOfSteps(Acc{i}(:,1), CutLoc{i});
	[GPSTimeStamps{i}, Distance{i}, Velocity{i}] = getTimeStampsAndGPSDistance(GPS{i});
	[F{i} V{i}] = MergeAccAndGPS(AccTimeStamps{i}, GPSTimeStamps{i}, Velocity{i});
end

FAll = [];
VAll = [];
for i=1:numfiles,
	FAll = [FAll; F{i}];
	VAll = [VAll; V{i}];
end
