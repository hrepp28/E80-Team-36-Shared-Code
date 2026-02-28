%Load in file from data 
load('') %add file name

Xk = ? 
Fs = ?
N = length(Xk);
f= Fs/N; 

v= -N/2:(N/2)-1;
k = f*v;

Y = fft(Xk)/N; 
%fft centered around zero
Y2 = fftshift(Y);
%take absolute value for magnitude
Y2abs = abs(Y2); 
figure(1); stem(k,Y2); xlabel('K'); ylabel('|X[k]|'); title('Magnitude of X[k] vs K')