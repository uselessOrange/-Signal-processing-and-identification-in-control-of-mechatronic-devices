clear
fs=250;
t=0:1/fs:2.5;
x=sin(2*pi*15*t);
X=fft(x);
% for i=1:length(x)
%     X(i)=imag(X(i));
%     Z(i)=norm(X(i),length(x));
%     end
% plot(Z);
% figure(2)
    plot(imag(X));