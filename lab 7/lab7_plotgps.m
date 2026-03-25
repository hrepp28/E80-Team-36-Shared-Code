clear
clf

%load image 
parsons = imread('GPS_test_2.png'); 
pim = image(parsons);

ylabel('Y Coordinate')
xlabel('X Coordinate')
title('X,Y Position Over Map of Path Traveled')

hold on 

%read files 
filenum = ''; % file number for the data we want to read
infofile = strcat('INF', filenum, '.TXT');
xydata = strcat('LOG', filenum, '.BIN');

%test points 
x = xydata( :,1); 
y = xydata( :,2);

scatter(x,y,'green', LineWidth= 3)




