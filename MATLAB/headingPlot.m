clf
figure(4)
t1 = (1:0.1:54.4)';
t2 = (1:0.1:67.9)'; % convert to radians
n = load("uncalibrated_heading.mat");
n2 = load("calibrated_heading.mat");
%plot(t1, n.headingIMU)
hold on
plot(t2, n2.headingIMU,'g')