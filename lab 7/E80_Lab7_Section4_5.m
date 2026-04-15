
% read an image
imr = imread("E80IMG2_Lab7.jpg");

% Scaling X and Y axis in meters
Xmin = 0;
Xmax = 32.53;

Ymin = 0;
Ymax = 25.789128;

% Plotting the image
figure(1)
clf
imshow(imr, 'XData', [Xmin Xmax], 'YData', [Ymin Ymax]);
xlabel('X Measurement [meters]')
ylabel('Y Measurement [meters]')
title('Y Measurement vs. X Measurement')
axis on;

hold on 


% % Setting Time Scale
% snum = length(accelX);
% Tsamp = 0.1;
% t = Tsamp*snum;
% t = 0:Tsamp:snum / 10;
% tt = t';
% 
% % Overlay logged paths of x and y points
% scatter(x,y,'blue', LineWidth= 2)
% 
% % Plot of angle error vs. time. 
% figure(2)
% clf
% plot(t, yawe)
% xlabel('Time [insert]')
% ylabel('Angle Error [insert]')
% title('Time vs. Angle Error')
% 
% % Plot of control effort vs. time 
% figure(3)
% clf
% plot(t, u)
% xlabel('Time [insert]')
% ylabel('Control Effot [insert]')
% title('Time vs. Control Effot')

