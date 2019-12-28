clc;clear;close all

fs=500;
f1=5;
A1=1;
phi1=0;
f2=5.5;
A2=0.1;
phi2=0;
D=[0.5,1,5];
for ii=1:length(D)
    t=0:1/fs:D(ii);

    x=A1*sin(2*pi*f1*t+phi1)+A2*sin(2*pi*f2*t+phi2);

    figure
    plot(t,x)

    f=-10:0.01:10;
    X=myCTFT(x,t,f);

    figure
    plot(f,abs(X)/D(ii))
    
    if ii==3
       wi=window(@rectwin,length(t));
       xw0=x.*wi';
       Xw0=myCTFT(xw0,t,f);
       figure
       plot(t,xw0)
       figure
       plot(f,abs(Xw0)/D(ii))
        
        
       win=window(@hamming,length(t));
       xw=x.*win';
       Xw=myCTFT(xw,t,f);
       figure
       plot(t,xw)
       figure
       plot(f,abs(Xw)/sum(win)*fs)
    end
end

t1=0:1/fs:1/f1-1/fs;
t2=0:1/fs:1/f2-1/fs;
x1=A1*sin(2*pi*f1*t1+phi1);
x2=A2*sin(2*pi*f2*t2+phi2);
k=-10:10;
X1=zeros(1,length(k));
for ii=1:length(X1)
    X1(ii)=sum(x1.*exp(-1j*k(ii)*2*pi*f1*t1))/fs; 
end

X2=zeros(1,length(k));
for ii=1:length(X2)
    X2(ii)=sum(x2.*exp(-1j*k(ii)*2*pi*f2*t2))/fs; 
end

figure
hold on
stem(k*f1,abs(X1))
stem(k*f2,abs(X2))

