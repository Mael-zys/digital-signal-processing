clc;clear;close all
% load b
% 
N=2000;
A=[16,5,8];
w=[2*pi/8,2*pi/7,2*pi/4];
phi=[pi/8,pi/2,0];
p=0;
n=0:N-1;
for ii=1:length(A)
    p=p+A(ii)*sin(w(ii)*n+phi(ii));
end
% 
% figure
% plot(n,p)
% 
% h=zeros(1,length(n));
% h(1:length(b))=b;
% figure
% plot(n,h)
% 
% figure
% freqz(b,1)
% 
% y=filter(b,1,p);
% figure
% plot(n,p)
% hold on
% plot(n,y)
% 
% Y=fft(y);
% P=fft(p);
% f=0:1/N:1-1/N;
% 
% figure
% hold on
% stem(f,abs(P)/N)
% stem(f,abs(Y)/N)

load IIR

x=zeros(1,length(n));
x(n>=1000)=1;
y=filter(bz,az,x);

figure
plot(n,y);

figure
freqz(bz,az)

y1=filter(bz,az,p);
figure
hold on
plot(n,p)
plot(n,y1)
xlim([0,600])


P=fft(p);
Y=fft(y1);
f=0:1/N:1-1/N;
figure
hold on
stem(f,abs(P)/N)
stem(f,abs(Y)/N)