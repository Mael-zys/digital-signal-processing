clc;clear;close all

D=6;
B=0.5;
H=1;
fs=500;
N=3;

[x,t]=mySquare(D,B,H,fs,N);

figure
plot(t,x)

df=0.01;
f=-10:df:10;
X=myCTFT(x,t,f);

figure
plot(2*pi*f,abs(X))

Xt=(-sin(9*pi*f)+sin(3*pi*f)+sin(15*pi*f))/pi./f;

figure
hold on
plot(2*pi*f,abs(X),'Linewidth',2)
plot(2*pi*f,abs(Xt))

Pt=sum(x.^2)*(t(2)-t(1))
Px=sum(abs(X).^2)*df
