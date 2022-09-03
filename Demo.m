clc
clear
close all
%% Demo
QueryDates=load('QueryDates.mat');%Load Query Dates Table
QueryDates=QueryDates.QueryDates;
LearningDates=load('LearningDates.mat');%Load Learning Dates Table
LearningDates=LearningDates.LearningDates;
Weights=load('BayesResultXAtMinObjective.mat');%Load Weights Table (Optional)
Weights=Weights.BayesResultXAtMinObjective;
%%
[ResultIndAll]=KNNSnowGeneration(QueryDates,LearningDates);%Generate Ranked Learning Dates per Each Query Dates

save('ResultIndAll.mat','ResultIndAll');%Save Ranked Learning Dates per Each Query Dates
%% Generation Images
Landsat=load('Landsat.mat');%Load Landsat images
Landsat=Landsat.Landsat;
Dates=load('Dates.mat');%Load Landsat Dates 
Dates=Dates.Dates;
R=load('R.mat');%Load spatial referencing object 
R=R.R;
info=load('info.mat');%Load Information about GeoTIFF file 
info=info.info;
ResultIndAll=load('ResultIndAll.mat');%Load Ranked Learning Dates per Each Query Dates
ResultIndAll=ResultIndAll.ResultIndAll;
destinationFolder = './OutputAll';
GeneratingImages(Landsat,Dates,R,info,ResultIndAll,destinationFolder,12,1);