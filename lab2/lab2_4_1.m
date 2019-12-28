clc;clear;close all

n=-15:15;
x=zeros(1,length(n));
ind=find(n>=-5 & n<=5);
x(ind)=5-abs(n(ind));

figure
stem(n,x)


f=-0.5:0.001:0.5;
X1=myCTFT(x,n,f);


N=length(n);
f1=-0.5:1/N:0.5-1/N;
X2=myCTFT(x,n,f1);
figure
hold on
plot(f,abs(X1))
stem(f1,abs(X2))