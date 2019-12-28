function X=myCTFT(x,t,f)
X=zeros(1,length(f));
dt=t(2)-t(1);
for ii=1:length(f)
    X(ii)=sum(x.*exp(-1j*2*pi*f(ii)*t))*dt;
end