clc;clear;close all

% N=[20,60];
% fc=0.1;
% wc=fc*2*pi;
% w=-pi:0.01:pi;
% f=w/2/pi;
% H=zeros(1,length(w));
% ind=w>-wc&w<wc;
% H(ind)=1;
% for ii=1:2
%     n=-N(ii):N(ii);
%     h=zeros(1,length(n));
%     for jj=1:length(n)
%         h(jj)=sum(H.*exp(1j*w*n(jj)))/2/pi*0.01;
%     end
%     
%     figure
%     stem(n,real(h))
%     
%     H1=myCTFT(real(h),n,f);
%     figure
%     plot(f,abs(H1))
%     figure
%     plot(f,angle(H1))
%     
%     figure
%     semilogx(f,20*log10(abs(H1)))
%     figure
%     semilogx(f,angle(H1))
% end

N=30;
fc=0.1;
wc=fc*2*pi;
w=-pi:0.01:pi;
f=w/2/pi;
H=zeros(1,length(w));
ind=find(w>-wc&w<wc);
H(ind)=1;

K=zeros(1,length(w));
K(ind)=kaiser(length(ind),2.5)';

    n=-N:N;
    h=zeros(1,length(n));
    k=zeros(1,length(n));
    for jj=1:length(n)
        h(jj)=sum(H.*exp(1j*w*n(jj)))/2/pi*0.01;
        k(jj)=sum(K.*exp(1j*w*n(jj)))/2/pi*0.01;
    end
    
    figure
    hold on
    stem(n,real(h))
    stem(n,real(k))
    
    H1=myCTFT(real(h),n,f);
    K1=myCTFT(real(k),n,f);
    
    figure
    hold on
    plot(f,abs(H1))
    plot(f,abs(K1))
    
    figure
    hold on
    plot(f,angle(H1))
    plot(f,angle(K1))
    
    figure
    hold on
    semilogx(f,20*log10(abs(H1)))
    semilogx(f,20*log10(abs(K1)))
    
    figure
    hold on
    semilogx(f,angle(H1))
    semilogx(f,angle(K1))



    d=-real(h);
    d(n==0)=1+d(n==0);
    figure
    stem(n,d)
    
    D=myCTFT(d,n,f);
    figure
    plot(f,abs(D))