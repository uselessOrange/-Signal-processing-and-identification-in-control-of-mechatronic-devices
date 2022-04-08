function [y,coef,freq] = costam(A,t,w,i)
n=0;
for k=1:2:i 
n=n+1;
y(n,:)=((4*A)/(k*pi))*sin(k*w*t); %nxm
coef(n)=(4*A)/(k*pi);
freq(n)=(k*w)/(2*pi);
end
y=ones(1,n)*y; %nxm>1xm
plot(t,y);
end