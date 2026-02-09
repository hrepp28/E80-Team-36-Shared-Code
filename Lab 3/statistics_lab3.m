x = [7.5 4 6 5 8]; % Uncomment and add your own data
y = [3.70 3.10 3.32 2.98 3.68]; % Uncomment and add your own data
confLev = 0.8;
N = length(y);
xbar = mean(x);
ybar = mean(y);
Sxx = (x-xbar)*transpose(x-xbar);
beta1 = ((x-xbar)*transpose(x-xbar))/Sxx; %line of best fit
beta0= ybar-beta1*xbar;
yfit = beta0 + beta1*x;
SSE = (y-yfit)*transpose(y-yfit);
Se = sqrt(SSE/(N-2));
Sbeta0 = (Se*sqrt(1/N+xbar^2/Sxx));
Sbeta1 = Se/sqrt(Sxx);
StdT = tinv((1-0.5*(1-confLev)),N-2);
lambdaBeta1 = StdT*Sbeta1
lambdaBeta0 = StdT*Sbeta0
range = max(x)-min(x); 
xplot = min(x):range/20:max(x); 
yplot = beta0 + beta1*xplot; 
Syhat = Se*sqrt(1/N + (xplot - xbar).*(xplot - xbar)/Sxx);
lambdayhat = StdT*Syhat;
Sy = Se*sqrt(1+1/N + (xplot - xbar).*(xplot - xbar)/Sxx);
lambday = StdT*Sy
figure(1)
plot(x,y,'x')
hold on
plot(xplot,yplot)
plot(xplot,yplot+lambdayhat,'-.b',xplot,yplot-lambdayhat,'-.b')
plot(xplot,yplot+lambday,'--m',xplot,yplot-lambday,'--m')
xlabel('Independent Variable')
ylabel('Dependent Variable')
if beta1 > 0 % Fix this
    location = 'northwest';
else
    location = 'northeast';
end
legend('Data Points','Best Fit Line','Upper Func. Bound',...
    'Lower Func. Bound', 'Upper Obs. Bound', 'Lower Obs. Bound',...
    'Location', location)
hold off


