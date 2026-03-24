% 1.) Code to find the mean of a dataset in Matlab.
data1 = accelX;
data2 = accelY;
confLev = 0.95;
N1 = length(data1);
N2 = length(data2);
% Code for Estimated Standard Error

mean_value = mean(data2);
disp(mean_value)
% 2.)Code to find the st.dev of a dataset in Matlab.
std_deviation = std(data2);
disp(std_deviation)

ESE = std_deviation/sqrt(N2);
% 3.)Code for T-test for two datasets in MatLab
% StdT = tinv((1-0.5*(1-confLev)), N1-1);
% [h,p,ci,stats] = ttest2(data1, data2);

plot