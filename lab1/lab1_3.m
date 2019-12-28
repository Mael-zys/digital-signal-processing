clc;clear;close all

ws=2*pi*8000;
fs=ws/2/pi;
%% a
w0=500*pi*2;
T0=1/w0;

n=0:1/fs:99/fs;

figure
stem(n,sin(w0*n))
xlim([0,99/fs])