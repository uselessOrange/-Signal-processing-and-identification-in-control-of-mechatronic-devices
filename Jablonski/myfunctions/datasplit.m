function  [xsplit,tsplit]=datasplit(x,fs,somewin)

[~,~,n,t,~,~] = params(x,fs);


signums=t(end)/somewin;
xsplit=zeros(round(signums+0.4),somewin*fs);
tsplit=zeros(round(signums+0.4),somewin*fs);
count=0;
for k=1:signums+1
for i=1:somewin*fs
    if i+count*somewin*fs<=n
    xsplit(k,i)=x(i+count*somewin*fs);
    tsplit(k,i)=t(i+count*somewin*fs);
    end

end
count=count+1;
end