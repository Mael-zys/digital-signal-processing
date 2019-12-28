clc;clear; close all;

n=0:30;
x1=2*cos(pi/6*n);
x2=3*sin(n/6);

figure 
hold on
stem(n,x1)
stem(n,x2)
legend('x1','x2')

figure
subplot(221)
stem(n,x1+x2)

subplot(222)
stem(n,x1.*x2)

subplot(223)
stem(n,x1./x2)

subplot(224)
stem(n,x1.^3)