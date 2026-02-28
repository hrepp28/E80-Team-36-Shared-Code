%Load in file from data 
data = readmatrix(''); %add file name

t = data( :,1); % check to see which row is which and switch if swapped, this is just coppied from the pigeon hw:)
Xk = data( :,2);
Fs = 1/(t(2)-t(1));
N = length(Xk);

w = hann(N); 
Xw = Xk.*w; 

[X, f] = fdomain(Xw, Fs);
%take abs value for magnitude
Xabs = abs(X);

figure(1)
plot(f, Xabs)
xlabel('Frequency [Hz]')
ylabel('|X(f)|')
title('FFT with Hanning Window')
%only show 0-100kHz
xlim([0 100*10^3])
