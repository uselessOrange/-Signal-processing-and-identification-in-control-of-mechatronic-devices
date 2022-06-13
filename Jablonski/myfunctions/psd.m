function [psdxav,f] = psd(x,fs,somwin,overlap,arg)
%[psdxav,f] = psd(x,fs,somwin,overlap,arg)
%for plot arg =1 ,for plot un 10*log10 arg =2, else no plot
[x,~]=datasplit(x,fs,somwin,overlap);
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
    stem(f,psdxav)
elseif arg == 2
    plot(f,10*log10(psdxav))
end