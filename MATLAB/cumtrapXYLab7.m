dt = 0.1; % The sampling rate
t = 0:dt:40.5; % The time array
t = t';
ax = accelX*(-1)/99;
ay = accelY*(-1)/99;

vx = cumtrapz(t,ax); % Integrate the true acceleration to get the true velocity
rx = cumtrapz(t,vx); % calculated X position

vy = cumtrapz(t, ay);
ry = cumtrapz(t, vy);


clf
figure(2)
plot(rx, ry)
title("X, Y coordinates of board stack")
xlabel('X Position (m)')
ylabel('Y Position (m)')
hold on
constant = (0:0.001:0.5)';
constant2 = constant.*0;
plot(constant, constant2)
legend('Calculated X, Y Position','True Position')