% Steinhart_Hart_Fit.m E72
%
% Angela Zheng
% 2/16/2026
%
% This program
% 1. Fits the Steinhart-Hart equation and extracts the Steinhart-
% hart coefficients for our thermistor
% 2. Plots the data points (T vs. R) as well as the non-linear Steinhart_Hart 
% fit with functional and observational bounds
% 3. Plots the residuals

% The temperatures.
T = [0.2, 9.3, 18.7, 40.4, 52.7, 61.8];
T = T + 273.15;

% The resistances.
R = [152.1, 98.2, 62.2, 24.04, 14.78, 10.57];
R = R .* 1000;

confLev = 0.95; % We set the confidence level for the data fits here.

%% Steinhart-hart Fit
range = max(R) - min(R); % Get range for our xplot data
xplot = min(R):range/30:max(R); % Generate x data for some of our plots.

% First we have to define the function we will fit.
% Things work better if we have starting points for a, b, c, and d. We'll
% use our values from lecture notes and 'fitoptions'
fo = fitoptions('Method','NonlinearLeastSquares',...
    'StartPoint',[-0.002894 0.001339 -9.963e-05 3.053e-06]);
ft = fittype('1/(a+b*log(R)+c*(log(R)^2)+d*(log(R)^3))','independent',...
    'R','options',fo);

% Next, we have to get our data into the correct format for 'fit'.
[Xout,Yout] = prepareCurveData(R, T);

% Now we'll do our fit.
[f4,stat4] = fit(Xout,Yout,ft)  % This line will give us the Steinhart-hart coefficients
p11 = predint(f4,xplot,confLev,'observation','off'); % Gen conf bounds
p21 = predint(f4,xplot,confLev,'functional','off'); % Gen conf bounds
figure(1)
plot(f4,Xout,Yout)  % Plot original data with non-linear steinhart-hart fit
hold on
plot(xplot, p21, '-.b') % Upper and lower functional confidence limits
plot(xplot, p11, '--m') % Upper and lower observational confidence limits
xlabel('Resistance (\Omega)')
ylabel('Temperature (K)')
title('Steinhart-Hart Fit, Temperature Data')
legend('Data Points','Best Fit Line','Upper Func. Bound',...
    'Lower Func. Bound', 'Upper Obs. Bound', 'Lower Obs. Bound',...
    'Location', 'northeast')
hold off

%% Steinhart-hart Residuals
figure(2)
plot(f4,Xout,Yout,'residuals')
xlabel('Resistance (\Omega)')
ylabel('Residuals (K)')
title('Steinhart-Hart Fit Residuals')
