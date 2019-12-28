clc;clear;close all

fc=10;
f=1:1000;
fs=1000;
[bs,as]=cheby1(4,1,2*pi*fc,'s');
figure
freqs(bs,as,f*2*pi)

[bz,az]=cheby1(4,1,fc/fs*2);
figure
freqz(bz,az,f,fs)

hs=freqs(bs,as,f*2*pi);
hz=freqz(bz,az,f,fs);

figure
plot(f,20*log10(abs(hs)))
hold on
plot(f,20*log10(abs(hz)))

figure
hold on
plot(f,angle(hs))
plot(f,angle(hz))

figure

semilogx(f,20*log10(abs(hs)))
hold on
semilogx(f,20*log10(abs(hz)))

figure
semilogx(f,angle(hs))
hold on
semilogx(f,angle(hz))