clear
clf

% logreader.m
% Use this script to read data from your micro SD card

clear;
%clf;

filenum = '013'; % file number for the data you want to read
infofile = strcat('INF', filenum, '.TXT');
datafile = strcat('LOG', filenum, '.BIN');

%% map from datatype to length in bytes
dataSizes.('float') = 4;
dataSizes.('ulong') = 4;
dataSizes.('int') = 4;
dataSizes.('int32') = 4;
dataSizes.('uint8') = 1;
dataSizes.('uint16') = 2;
dataSizes.('char') = 1;
dataSizes.('bool') = 1;

%% read from info file to get log file structure
fileID = fopen(infofile);
items = textscan(fileID,'%s','Delimiter',',','EndOfLine','\r\n');
fclose(fileID);
[ncols,~] = size(items{1});
ncols = ncols/2;
varNames = items{1}(1:ncols)';
varTypes = items{1}(ncols+1:end)';
varLengths = zeros(size(varTypes));
colLength = 256;
for i = 1:numel(varTypes)
    varLengths(i) = dataSizes.(varTypes{i});
end
R = cell(1,numel(varNames));

%% read column-by-column from datafile
fid = fopen(datafile,'rb');
for i=1:numel(varTypes)
    %# seek to the first field of the first record
    fseek(fid, sum(varLengths(1:i-1)), 'bof');
    
    %# % read column with specified format, skipping required number of bytes
    R{i} = fread(fid, Inf, ['*' varTypes{i}], colLength-varLengths(i));
    eval(strcat(varNames{i},'=','R{',num2str(i),'};'));
end
fclose(fid);


%load image 
parsons = imread('GPS_test_2.png'); 
pim = imshow(parsons);

spatialExtentIm= [pim.XData; pim.YData]; 

RI = imref2d(size(parsons)); 
RI.XWorldLimits = [-47 224];
RI.YWorldLimits = [-55 67];

href = imshow(parsons, RI);

ylabel('Y Position [m]')
xlabel('X Position [m]')
title('X,Y Position Over Map of Path Traveled')

hold on 
xnew = x-10
ynew= y-17
scatter(xnew, ynew,'green', LineWidth= 3)




