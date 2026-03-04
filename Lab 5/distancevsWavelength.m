% beacon stuff
% 9k 11k 13k hz beacons in the tank
clc
% YOUR DATA HERE (distances in meters, voltages in volts)
% 9khz beacon (the one on the left i think??)
r1 = [0.05, 0.10, 0.15, 0.20, 0.25, 0.30, 0.35, 0.40, 0.45];
v1 = [0.80, 0.45, 0.32, 0.25, 0.20, 0.17, 0.15, 0.13, 0.11];
% 11khz
r2 = [0.05, 0.10, 0.15, 0.20, 0.25, 0.30, 0.35, 0.40, 0.45];
v2 = [0.75, 0.40, 0.29, 0.23, 0.19, 0.16, 0.13, 0.12, 0.10];
% 13khz (highest freq)
r3 = [0.05, 0.10, 0.15, 0.20, 0.25, 0.30, 0.35, 0.40, 0.45];
v3 = [0.70, 0.38, 0.27, 0.21, 0.17, 0.14, 0.12, 0.10, 0.09];
% fit the model (V = A/r)
% A is just mean(V*r), derived this in prelab
A1 = mean(v1 .* r1);
A2 = mean(v2 .* r2);
A3 = mean(v3 .* r3);
r_smooth = 0.01:0.001:0.55; % for plotting the curve
% PLOT 1 - 9 kHz
figure(1)
plot(r_smooth, A1./r_smooth, 'b-', 'LineWidth', 1.5)
hold on
plot(r1, v1, 'bo', 'MarkerFaceColor', 'b', 'MarkerSize', 8)
xlabel('distance (m)')
ylabel('voltage (V)')
title('9 kHz beacon')
legend('A/r fit', 'data')
grid on
% PLOT 2 - 11 kHz
figure(2)
plot(r_smooth, A2./r_smooth, 'r-', 'LineWidth', 1.5)
hold on
plot(r2, v2, 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 8)
xlabel('distance (m)')
ylabel('voltage (V)')
title('11 kHz beacon')
legend('A/r fit', 'data')
grid on
% PLOT 3 - 13 kHz
figure(3)
plot(r_smooth, A3./r_smooth, 'g-', 'LineWidth', 1.5)
hold on
plot(r3, v3, 'go', 'MarkerFaceColor', 'g', 'MarkerSize', 8)
xlabel('distance (m)')
ylabel('voltage (V)')
title('13 kHz beacon')
legend('A/r fit', 'data')
grid on
%%print results
fprintf('9  kHz: A = %.4f\n', A1)
fprintf('11 kHz: A = %.4f\n', A2)
fprintf('13 kHz: A = %.4f\n', A3)
