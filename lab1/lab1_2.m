clc;clear;close all

fs=8000;
T=1/fs;

%% a
f0=[300,3000,4000,5000];
for ii=1:length(f0)
    Tp=1/f0(ii);
    t=0:0.000001:1;
    n=0:T:1;

    xt=sin(2*pi*f0(ii)*t);
    xn=sin(2*pi*f0(ii)*n);

    figure
    subplot(211)
    plot(t,xt)
    hold on
    plot(n,xn,'*')
    xlim([0,3*Tp])
    ylim([-1,1])


    subplot(212)
    stem(n,xn)
    xlim([0,3*Tp])
    ylim([-1,1])
end


