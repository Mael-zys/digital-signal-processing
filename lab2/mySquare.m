function [x,t]=mySquare(D,B,H,fs,N)
t=-N*D/2:1/fs:N*D/2-1/fs;
x=H*(square(2*pi*1/D*(t+D/4),B*100)/2+0.5);
end