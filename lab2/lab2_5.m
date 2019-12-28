clc;clear;close all

f=[50,100,150,55];
A=[218,2,0.5,5];
e=0;
L=1;
fs=500;
t=0:1/fs:L-1/fs;
for ii=1:length(f)
    e=e+A(ii)*sin(2*pi*f(ii)*t);
end

E=fft(e);
f1=0:1/length(E):1-1/length(E);
figure
stem(f1*fs,abs(E)/length(t)*2,'*')
xlim([0,fs/2])

L=5;
fs=1000;
t=0:1/fs:L-1/fs;
e=0;
for ii=1:length(f)
    e=e+A(ii)*sin(2*pi*f(ii)*t);
end

w=window(@hamming,length(t));
e=e.*w';
f2=0:1:fs/2;
E1=myCTFT(e,t,f2);
figure
plot(f2,abs(E1)/sum(w/fs)*2)
xlim([0,250])