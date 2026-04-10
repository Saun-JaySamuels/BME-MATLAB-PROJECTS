% Fourier transform of alpha and beta EEG signal
% Saun-Jay Samuels, Florida Gulf Coast University 2026

clc;

% Extract Data
EEG_DATA = MDSSAFBOTHExportS3;
Alpha = EEG_DATA.LeftAlphaWaves;
Beta  = EEG_DATA.LeftBetaWaves;

% Set up variables
fs = 200;
dt = 1/fs;
N = length(Beta);
t = (0:N-1)*dt;
x = Beta';

% Plot left beta waves
figure(1);
plot(t,x)
ylabel('Left Beta Wave (V)');
xlabel('Time (seconds)');
title('Beta EEG - Time Domain');

y = fft(x);
y = abs(y);
y = y/fs;
df = fs/N;
f = (0:N-1)*df;

figure(2);
plot(f, y)
ylabel('Amplitude');
xlabel('Frequency (Hz)');
title('Beta EEG - Frequency Domain');
EN_time = trapz(t,(x.^2))
EN_frequency = sum(y.^2) * df

xlim([0,50]);