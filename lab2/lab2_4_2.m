clc;clear;close all

f0=1/16;
A=1.5;
N=16;
n=-N/2:N/2;
yw=A*cos(2*pi*f0*n);

figure
stem(n,yw)

f=-0:1/length(n):1-1/length(n);
Xd=myCTFT(yw,n,f);
figure
stem(f,abs(Xd))

Xf=fft(yw);
hold on
stem(f,abs(Xf),'--')

N=[10,50,100,500,1000,5000];
td=zeros(1,length(N));
tf=zeros(1,length(N));
for ii=1:length(N)
    n=-N(ii)/2:N(ii)/2;
    yw=A*cos(2*pi*f0*n);
    
    tic
    f=-0:1/length(n):1-1/length(n);
    Xd=myCTFT(yw,n,f);
    td(ii)=toc;

    tic
    Xf=fft(yw);
    tf(ii)=toc;   
end

figure
plot(N,td)
hold on
plot(N,tf)

N=[1000,1023,4000,4095];
tf1=zeros(1,length(N));
for ii=1:length(N)
    n=-N(ii)/2:N(ii)/2;
    yw=A*cos(2*pi*f0*n);

    tic
    Xf=fft(yw);
    tf1(ii)=toc;   
end

figure
plot(N,tf1)