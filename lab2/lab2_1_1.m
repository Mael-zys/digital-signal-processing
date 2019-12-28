clc;clear;close all

fs=1000;
f0=5;
A=1.5;
phi=pi/6;
t=0:1/fs:1/f0-1/fs;
x=mySin(f0,t,A,phi);

figure
plot(t,x)

k=-10:10;
Xk=zeros(1,length(k));
for ii=1:length(Xk)
   Xk(ii)=sum(x.*exp(-1j*k(ii)*2*pi*f0*t))*1/fs; 
end

figure
subplot(221)
stem(k,abs(Xk)*f0)
subplot(222)
stem(k,real(Xk)*f0)
subplot(223)
stem(k,imag(Xk)*f0)
subplot(224)
stem(k,angle(Xk))

Xt=zeros(1,length(k));
ind=find(k==1);
Xt(ind)=-1j*A/2*exp(1j*phi);
ind1=find(k==-1);
Xt(ind1)=1j*A/2*exp(-1j*phi);

figure
subplot(221)
hold on
stem(k,abs(Xk)*f0,'Linewidth',2)
stem(k,abs(Xt),'--')
subplot(222)
hold on
stem(k,real(Xk)*f0,'Linewidth',2)
stem(k,real(Xt),'--')
subplot(223)
hold on
stem(k,imag(Xk)*f0,'Linewidth',2)
stem(k,imag(Xt),'--')
subplot(224)
hold on
stem(k,angle(Xk),'Linewidth',2)
stem(k,angle(Xt),'--')

Pt=sum(x.^2)*f0/fs
Pk=sum(abs(Xk*f0).^2)
