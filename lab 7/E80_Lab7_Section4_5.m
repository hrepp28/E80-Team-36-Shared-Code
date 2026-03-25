
% read an image
imr = imread("E80IMG2_Lab7.jpg");

% Scaling X and Y axis in meters
Xmin = 107.00004;
Xmax = 170;

Ymin = -90;
Ymax = -25;

% Plotting the image
figure(1)
clf
imshow(imr, 'XData', [Xmin Xmax], 'YData', [Ymin Ymax]);
xlabel('X Measurement [meters]')
ylabel('Y Measurement [meters]')
title('Y Measurement vs. X Measurement')
axis on;
set(gca, 'YDir', 'normal')

hold on 

%% Log Reader
% read files from micro SD Card
filenum = '003'; % file number for the data you want to read
infofile = strcat('INF', filenum, '.TXT');
datafile = strcat('LOG', filenum, '.BIN');

% Extracting Data from datafile 
x = datafile( :,1); 
y = datafile( :,2);
yawe = datafile( :,3);
u = datafile( :,4);


% Setting Time Scale
snum = length(datafile)
Tsamp = #;
t = Tsamp*snum;

% Overlay logged paths of x and y points
scatter(x,y,'blue', LineWidth= 2)

% Plot of angle error vs. time. 
figure(2)
clf
plot(t, yawe)
xlabel('Time [insert]')
ylabel('Angle Error [insert]')
title('Time vs. Angle Error')

% Plot of control effort vs. time 
figure(3)
clf
plot(t, u)
xlabel('Time [insert]')
ylabel('Control Effot [insert]')
title('Time vs. Control Effot')





