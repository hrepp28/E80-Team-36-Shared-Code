clear
clf

%load image 
parsons = imread('GPS_test_2.png'); 
pim = image(parsons);

hold on 

%read files 
filenum = ''; % file number for the data we want to read
infofile = strcat('INF', filenum, '.TXT');
xydata = strcat('LOG', filenum, '.BIN');

%test points 
x = xydata( :,1); 
y = xydata( :,2);

scatter(x,y,'green', LineWidth= 3)

ylabel('Y Position [m]')
xlabel('X Position [m]')
title('X,Y Position Over Map of Path Traveled')



