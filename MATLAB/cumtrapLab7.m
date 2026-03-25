% This file simulates a 1-D acceleration measured by an accelerometer with
% noise. It cacluates the true acceleration, velocity and position, and
% then adds gaussian white noise to the true acceleration to generate the
% simulated measured acceleration. It then integrates the measured
% acceleration once to get calculated velocity, and then a second time to
% get calculated position. It calculates the error bounds for the position
% and velocity based on the standard deviation of the sensor and the
% specified confidence level.
dt = 0.1; % The sampling rate
t = 0:dt:40.5; % The time array
t = t';
a = accelY*(-1)/99;

sigma = std(a); % The standard deviation of the noise in the accel.
confLev = 0.95; % The confidence level for bounds
preie = sqrt(2)*erfinv(confLev)*sigma*sqrt(dt); % the prefix to the sqrt(t)
preiie = 2/3*preie; % The prefix to t^3/2a = 1 + sin( pi*t - pi/2);
plusie=preie*t.^0.5; % The positive noise bound for one integration
plusiie = preiie*t.^1.5; % The positive noise bound for double integration
v = cumtrapz(t,a); % Integrate the true acceleration to get the true velocity
r = cumtrapz(t,v); % Integrate the true velocity to get the true position.

rnp = r + plusiie; % Position plus confidence bound
rnm = r - plusiie; % Position minus confidence bound

clf
figure(3)
plot(t(1:70), r(1:70), t(1:70), rnp(1:70),'-.', t(1:70), rnm(1:70),'-.')
xlabel('Time (s)')
ylabel('Position (m)')
title('Calculated Y Position from Measured Acceleration')
legend('Calculated Position','Upper Confidence Bound',...
    'Lower Confidence Bound','location','southeast')