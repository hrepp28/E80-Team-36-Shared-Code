% beacon stuff
% 9k 11k 13k hz beacons in the tank
clc
% YOUR DATA HERE (distances in meters, voltages in volts)
% 13khz (highest freq)
temp = [0.5, 1, 2, 3, 4, 5, 6, 7, 8];
r3 = temp.*0.028;
v3 = [0.244, 0.210, 0.153, 0.145, 0.123, 0.112, 0.068, 0.063, 0.048];
% fit the model (V = A/r)
% A is just mean(V*r), derived this in prelab
clf
xavier = 0.005./r3;
plot(r3, xavier)
% A3 = 0.05*(v3 .* r3);
% r_smooth = 0.00:0.01:23; % for plotting the curve
% PLOT 3 - 13 kHz
figure(1)
%plot(r_smooth, A3./r_smooth, 'b-', 'LineWidth', 1.5)
hold on
plot(r3, v3, 'go', 'MarkerFaceColor', 'b', 'MarkerSize', 4)
xlabel('distance (m)')
ylabel('voltage (V)')
title('13 kHz beacon')
legend('A/r fit', 'data')
grid on
%%print results
fprintf('13 kHz: A = %.4f\n', A3)
