% test to see if which is faster
t=linspace(-25,25,1000);
Fs=1/(t(2)-t(1));
window=70;
noverlap= 50;
nfft=1000;

x=sin(t*(2*pi));

%% plot signal

figure(1)
plot(t,x)
title('Time Domain Signal')

%% spectogram methds

% %method 1 spectogram
% tic
% spectrogram(x);
% toc

%%% comments
% method 1 takes about 1-2 ms to execute

%method 2
tic
figure(2)
spectrogram(x,window,noverlap,nfft,Fs);
toc
%display