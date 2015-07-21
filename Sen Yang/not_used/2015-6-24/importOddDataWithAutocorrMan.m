% In this method, I don't use FFT any more. Instead, I use Auto Correlation to get samples from every two steps.
clear;
% Different type of smartphones have different sample rate. Nexus 4: 199Hz, Nexus 5: 200Hz or 128Hz, Galaxy Nexus: 100Hz. One man would better use the same type of smartphone during his trials.
sample_rate = 199;
sequence_time = 2;
clean_percent = 3;
txtFiles = dir('*.txt');
numfiles = length(txtFiles);
if numfiles ~= 21
	error('There are %d files. Error! You must have 21 files!', numfiles);	
else
	disp('There are 21 files. Correct!');
	accZ3_5 = importOneData(txtFiles(1).name, sample_rate);
	accZ5_7 = importOneData(txtFiles(2).name, sample_rate);
	accZ3_7 = importOneData(txtFiles(3).name, sample_rate);
	accZ5_9 = importOneData(txtFiles(4).name, sample_rate);
	accZ3_9 = importOneData(txtFiles(5).name, sample_rate);
	accZ6_1 = importOneData(txtFiles(6).name, sample_rate);
	accZ4_1 = importOneData(txtFiles(7).name, sample_rate);
	accZ6_3 = importOneData(txtFiles(8).name, sample_rate);
	accZ4_3 = importOneData(txtFiles(9).name, sample_rate);
	accZ6_5 = importOneData(txtFiles(10).name, sample_rate);
	accZ4_5 = importOneData(txtFiles(11).name, sample_rate);
	accZ6_7 = importOneData(txtFiles(12).name, sample_rate);
	accZ4_7 = importOneData(txtFiles(13).name, sample_rate);
	accZ6_9 = importOneData(txtFiles(14).name, sample_rate);
	accZ4_9 = importOneData(txtFiles(15).name, sample_rate);
	accZ7_1 = importOneData(txtFiles(16).name, sample_rate);
	accZ5_1 = importOneData(txtFiles(17).name, sample_rate);
	accZ7_3 = importOneData(txtFiles(18).name, sample_rate);
	accZ5_3 = importOneData(txtFiles(19).name, sample_rate);
	accZ7_5 = importOneData(txtFiles(20).name, sample_rate);
	accZ5_5 = importOneData(txtFiles(21).name, sample_rate);

	[CutLocZ3_5, FZ3_5] = getCutLocWithMatlabAutocorr(accZ3_5, sample_rate, 3.5, sequence_time);
	[CutLocZ3_7, FZ3_7] = getCutLocWithMatlabAutocorr(accZ3_7, sample_rate, 3.7, sequence_time);
	[CutLocZ3_9, FZ3_9] = getCutLocWithMatlabAutocorr(accZ3_9, sample_rate, 3.9, sequence_time);
	[CutLocZ4_1, FZ4_1] = getCutLocWithMatlabAutocorr(accZ4_1, sample_rate, 4.1, sequence_time);
	[CutLocZ4_3, FZ4_3] = getCutLocWithMatlabAutocorr(accZ4_3, sample_rate, 4.3, sequence_time);
	[CutLocZ4_5, FZ4_5] = getCutLocWithMatlabAutocorr(accZ4_5, sample_rate, 4.5, sequence_time);
	[CutLocZ4_7, FZ4_7] = getCutLocWithMatlabAutocorr(accZ4_7, sample_rate, 4.7, sequence_time);
	[CutLocZ4_9, FZ4_9] = getCutLocWithMatlabAutocorr(accZ4_9, sample_rate, 4.9, sequence_time);
	[CutLocZ5_1, FZ5_1] = getCutLocWithMatlabAutocorr(accZ5_1, sample_rate, 5.1, sequence_time);
	[CutLocZ5_3, FZ5_3] = getCutLocWithMatlabAutocorr(accZ5_3, sample_rate, 5.3, sequence_time);
	[CutLocZ5_5, FZ5_5] = getCutLocWithMatlabAutocorr(accZ5_5, sample_rate, 5.5, sequence_time);
	[CutLocZ5_7, FZ5_7] = getCutLocWithMatlabAutocorr(accZ5_7, sample_rate, 5.7, sequence_time);
	[CutLocZ5_9, FZ5_9] = getCutLocWithMatlabAutocorr(accZ5_9, sample_rate, 5.9, sequence_time);
	[CutLocZ6_1, FZ6_1] = getCutLocWithMatlabAutocorr(accZ6_1, sample_rate, 6.1, sequence_time);
	[CutLocZ6_3, FZ6_3] = getCutLocWithMatlabAutocorr(accZ6_3, sample_rate, 6.3, sequence_time);
	[CutLocZ6_5, FZ6_5] = getCutLocWithMatlabAutocorr(accZ6_5, sample_rate, 6.5, sequence_time);
	[CutLocZ6_7, FZ6_7] = getCutLocWithMatlabAutocorr(accZ6_7, sample_rate, 6.7, sequence_time);
	[CutLocZ6_9, FZ6_9] = getCutLocWithMatlabAutocorr(accZ6_9, sample_rate, 6.9, sequence_time);
	[CutLocZ7_1, FZ7_1] = getCutLocWithMatlabAutocorr(accZ7_1, sample_rate, 7.1, sequence_time);
	[CutLocZ7_3, FZ7_3] = getCutLocWithMatlabAutocorr(accZ7_3, sample_rate, 7.3, sequence_time);
	[CutLocZ7_5, FZ7_5] = getCutLocWithMatlabAutocorr(accZ7_5, sample_rate, 7.5, sequence_time);
	
	FZClean3_5 = eliminateOutlierBaseOnValuePercent(FZ3_5, clean_percent);
	FZClean3_7 = eliminateOutlierBaseOnValuePercent(FZ3_7, clean_percent);
	FZClean3_9 = eliminateOutlierBaseOnValuePercent(FZ3_9, clean_percent);
	FZClean4_1 = eliminateOutlierBaseOnValuePercent(FZ4_1, clean_percent);
	FZClean4_3 = eliminateOutlierBaseOnValuePercent(FZ4_3, clean_percent);
	FZClean4_5 = eliminateOutlierBaseOnValuePercent(FZ4_5, clean_percent);
	FZClean4_7 = eliminateOutlierBaseOnValuePercent(FZ4_7, clean_percent);
	FZClean4_9 = eliminateOutlierBaseOnValuePercent(FZ4_9, clean_percent);
	FZClean5_1 = eliminateOutlierBaseOnValuePercent(FZ5_1, clean_percent);
	FZClean5_3 = eliminateOutlierBaseOnValuePercent(FZ5_3, clean_percent);
	FZClean5_5 = eliminateOutlierBaseOnValuePercent(FZ5_5, clean_percent);
	FZClean5_7 = eliminateOutlierBaseOnValuePercent(FZ5_7, clean_percent);
	FZClean5_9 = eliminateOutlierBaseOnValuePercent(FZ5_9, clean_percent);
	FZClean6_1 = eliminateOutlierBaseOnValuePercent(FZ6_1, clean_percent);
	FZClean6_3 = eliminateOutlierBaseOnValuePercent(FZ6_3, clean_percent);
	FZClean6_5 = eliminateOutlierBaseOnValuePercent(FZ6_5, clean_percent);
	FZClean6_7 = eliminateOutlierBaseOnValuePercent(FZ6_7, clean_percent);
	FZClean6_9 = eliminateOutlierBaseOnValuePercent(FZ6_9, clean_percent);
	FZClean7_1 = eliminateOutlierBaseOnValuePercent(FZ7_1, clean_percent);
	FZClean7_3 = eliminateOutlierBaseOnValuePercent(FZ7_3, clean_percent);
	FZClean7_5 = eliminateOutlierBaseOnValuePercent(FZ7_5, clean_percent);
	
	FVClean = [FZClean3_5 ones(size(FZClean3_5,1),1)*3.5];
	FVClean = [FVClean; FZClean3_7 ones(size(FZClean3_7,1),1)*3.7];
	FVClean = [FVClean; FZClean3_9 ones(size(FZClean3_9,1),1)*3.9];
	FVClean = [FVClean; FZClean4_1 ones(size(FZClean4_1,1),1)*4.1];
	FVClean = [FVClean; FZClean4_3 ones(size(FZClean4_3,1),1)*4.3];
	FVClean = [FVClean; FZClean4_5 ones(size(FZClean4_5,1),1)*4.5];
	FVClean = [FVClean; FZClean4_7 ones(size(FZClean4_7,1),1)*4.7];
	FVClean = [FVClean; FZClean4_9 ones(size(FZClean4_9,1),1)*4.9];
	FVClean = [FVClean; FZClean5_1 ones(size(FZClean5_1,1),1)*5.1];
	FVClean = [FVClean; FZClean5_3 ones(size(FZClean5_3,1),1)*5.3];
	FVClean = [FVClean; FZClean5_5 ones(size(FZClean5_5,1),1)*5.5];
	FVClean = [FVClean; FZClean5_7 ones(size(FZClean5_7,1),1)*5.7];
	FVClean = [FVClean; FZClean5_9 ones(size(FZClean5_9,1),1)*5.9];
	FVClean = [FVClean; FZClean6_1 ones(size(FZClean6_1,1),1)*6.1];
	FVClean = [FVClean; FZClean6_3 ones(size(FZClean6_3,1),1)*6.3];
	FVClean = [FVClean; FZClean6_5 ones(size(FZClean6_5,1),1)*6.5];
	FVClean = [FVClean; FZClean6_7 ones(size(FZClean6_7,1),1)*6.7];
	FVClean = [FVClean; FZClean6_9 ones(size(FZClean6_9,1),1)*6.9];
	FVClean = [FVClean; FZClean7_1 ones(size(FZClean7_1,1),1)*7.1];
	FVClean = [FVClean; FZClean7_3 ones(size(FZClean7_3,1),1)*7.3];
	FVClean = [FVClean; FZClean7_5 ones(size(FZClean7_5,1),1)*7.5];
	
	FV = [FZ3_5 ones(size(FZ3_5,1),1)*3.5];
	FV = [FV; FZ3_7 ones(size(FZ3_7,1),1)*3.7];
	FV = [FV; FZ3_9 ones(size(FZ3_9,1),1)*3.9];
	FV = [FV; FZ4_1 ones(size(FZ4_1,1),1)*4.1];
	FV = [FV; FZ4_3 ones(size(FZ4_3,1),1)*4.3];
	FV = [FV; FZ4_5 ones(size(FZ4_5,1),1)*4.5];
	FV = [FV; FZ4_7 ones(size(FZ4_7,1),1)*4.7];
	FV = [FV; FZ4_9 ones(size(FZ4_9,1),1)*4.9];
	FV = [FV; FZ5_1 ones(size(FZ5_1,1),1)*5.1];
	FV = [FV; FZ5_3 ones(size(FZ5_3,1),1)*5.3];
	FV = [FV; FZ5_5 ones(size(FZ5_5,1),1)*5.5];
	FV = [FV; FZ5_7 ones(size(FZ5_7,1),1)*5.7];
	FV = [FV; FZ5_9 ones(size(FZ5_9,1),1)*5.9];
	FV = [FV; FZ6_1 ones(size(FZ6_1,1),1)*6.1];
	FV = [FV; FZ6_3 ones(size(FZ6_3,1),1)*6.3];
	FV = [FV; FZ6_5 ones(size(FZ6_5,1),1)*6.5];
	FV = [FV; FZ6_7 ones(size(FZ6_7,1),1)*6.7];
	FV = [FV; FZ6_9 ones(size(FZ6_9,1),1)*6.9];
	FV = [FV; FZ7_1 ones(size(FZ7_1,1),1)*7.1];
	FV = [FV; FZ7_3 ones(size(FZ7_3,1),1)*7.3];
	FV = [FV; FZ7_5 ones(size(FZ7_5,1),1)*7.5];
	
	figure;
	plot(FVClean(:,1), FVClean(:,2), '.');

end
	
