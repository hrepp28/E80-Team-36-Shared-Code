%% Lab 5 Interface
samplingFreq = 28000; % Hz [100E3 max]
numSamples = 1000; % the higher this is the longer sampling will take
bytesPerSample = 2; % DO NOT CHANGE
micSignal = zeros(numSamples,1); % DO NOT CHANGE
% close and delete serial ports in case desired port is still open
if ~isempty(instrfind)
   fclose(instrfind);
   delete(instrfind);
end
% Modify first argument of serial to match Teensy port under Tools tab of Arduino IDE.  Second to match baud rate.
% Note that the timeout is set to 60 to accommodate long sampling times.
s = serial('COM10','BaudRate',115200);
set(s,{'InputBufferSize','OutputBufferSize'},{numSamples*bytesPerSample,4});
s.Timeout = 60;
fopen(s);
pause(2);
fwrite(s,[numSamples,samplingFreq/2],'uint16');
dat = fread(s,numSamples,'uint16');
fclose(s);
% Some convenience code to begin converting data for you.
micSignal = dat.*(3.3/1023); % convert from Teensy Units to Volts
samplingPeriod = 1/samplingFreq; % s
totalTime = numSamples*samplingPeriod; % s
t = linspace(0,totalTime,numSamples)'; % time vector of signal
%% Added code:
% Plotting the magnitude of FFTs of the 10 kS/s, 100 kS/s, and 28 kS/s sampled data
figure(13)
clf
[X, f] = fdomain(micSignal, samplingFreq);
plot(f, abs(X))
xlabel('Frequency (Hz)')
ylabel('FFT Magnitude')
title('FFT Magnitude vs. Frequency (Hz)')
% Plotting the first 100 points of the time data
figure(15)
clf
tcut = t(1:100);
vcut = micSignal(1:100);
plot(tcut, vcut)
xlabel('Time (sec)')
ylabel('Voltage (V)')
title('Voltage (V) vs. Time (sec)')
