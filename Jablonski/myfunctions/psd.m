function [psdxav,f] = psd(x,fs,somwin,arg)
%[psdxav,f] = psd(x,fs,somwin)
[x,~]=datasplit(x,fs,somwin);
[~,m,n,~,~,f] = params(x,fs);

for i=1:m
    X(i,:)=fft(x(i,:));
end
    Xh(:,:) =X(:,1:n/2);
   
for i=1:m
    psdx(i,:) = (1/(fs*n)) * abs(Xh(i,:)).^2;
   
end
psdx(:,2:end-1) = 2*psdx(:,2:end-1);
for i=1:n/2
    psdxav(i)=mean(psdx(:,i));
end
if arg == 1
    plot(f,psdxav)
elseif arg == 2
    plot(f,10*log10(psdxav))
end