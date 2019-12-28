clc;clear;close all

% fs=250;
% f1=50/fs;
% f2=100/fs;
% w1=f1*2*pi;
% w2=f2*pi*2;
% rp=1-pi/25;
% rz=1;
% 
% z1=rz*exp(1j*w1);
% z2=rz*exp(1j*w2);
% p1=rp*exp(1j*w1);
% p2=rp*exp(1j*w2);
% 
% Z=[z1,z2,conj(z1),conj(z2)];
% P=[p1,p2,conj(p1),conj(p2)];
% 
% [b,a]=zp2tf(Z',P,1);
% 
% figure
% zplane(b,a)
% 
% w=0:0.001:pi;
% z=exp(1j*w);
% H=(z-z1).*(z-conj(z1)).*(z-z2).*(z-conj(z2))./((z-p1).*(z-conj(p1)).*(z-p2).*(z-conj(p2)));
% 
% figure
% plot(w/2/pi*fs,20*log10(abs(H)))
% 
% figure
% plot(w/2/pi*fs,angle(H))

fs=250;
fn=50/fs;
wn=fn*2*pi;
rp=1-20/250*pi;
rz=1-27/250*pi;

z=rz*exp(1j*wn);
p=rp*exp(1j*wn);

Z=[z,conj(z)];
P=[p,conj(p)];

[b,a]=zp2tf(Z',P,1);

figure
zplane(b,a)

w=0:0.001:pi;
zz=exp(1j*w);
H=(zz-z).*(zz-conj(z))./((zz-p).*(zz-conj(p)));

figure
plot(w/2/pi*fs,20*log10(abs(H)))

figure
plot(w/2/pi*fs,angle(H))