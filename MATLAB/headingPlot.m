clf
figure(4)
t1 = (0:0.1:7.9)';
n = load("uncalibrated_heading.mat");
n2 = load("calibrated_heading.mat");
uncaliheading = n.headingIMU/180*3.1415;
caliheading = n2.headingIMU/180*3.1415;
trimed3 = trimdata(uncaliheading, 80, Side = "both");
trimed4 = trimdata(caliheading, 80, Side = "both");
% trimed3 = trimdata(trimed2, 300, Side="trailing");
% trimed4 = trimdata(trimed3, 300, Side="trailing");
plot(t1, trimed4)
hold on
plot(t1, trimed3)
xlabel("Time (s)")
ylabel("Heading (rad)")
title("Uncalibrated and Calibrated Heading vs. Time")
legend("Uncalibrated", "Calibrated")