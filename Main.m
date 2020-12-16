clear;clc;close all
submit = 0;
%% Load the data
census = ImportFindDonor("D:\ML\courses\MachineLearningWithTF\codes\projects\p1_charityml\census_M.csv", [2, Inf]);
census.income =[];
testcensus = ImportFindDonorTest("D:\ML\courses\MachineLearningWithTF\codes\projects\p1_charityml\test_census.csv", [2, Inf]);
testcensus.Properties.VariableNames{1} = ' id'; 
%% Gaussian Naive Byes classifier
[trainedGNB, validationAccuracyGNB] = trainGNB(census);
ytestGNB = trainedGNB.predictFcn(testcensus);
%% Write to file to submit

Tsubmission = table(testcensus.id, ytestGNB, ...
        'VariableNames', {'id', 'income'});
 if submit
    writetable(Tsubmission, 'Latestsubmission_M.csv');
 end
