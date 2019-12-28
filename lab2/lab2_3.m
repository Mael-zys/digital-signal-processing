clc;clear;close all

T=[0.1,0.5,1];

D=6;
B=0.5;
H=1;
N=3;

for ii=1:length(T)
    fs=1/T(ii);
    [x,t]=mySquare(D,B,H,fs,N);
    figure
    stem(t,x)
    
    df=0.01;
    f=-10:df:10;
    Xw=zeros(1,length(f));
    for jj=1:length(f)
        Xw(jj)=sum(x.*exp(-1j*2*pi*f(jj)*t))/fs;
    end
    figure
    plot(f,abs(Xw))
    
    fs1=500;
    [x1,t1]=mySquare(D,B,H,fs1,N);
    Xc=myCTFT(x1,t1,f);
    figure
    hold on
    plot(f,abs(Xw))
    plot(f,abs(Xc))
    
end



