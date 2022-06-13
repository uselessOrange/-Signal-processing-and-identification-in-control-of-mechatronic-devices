function  [xsplit,tsplit]=datasplit(x,fs,somewin,overlap)

[dt,~,n,t,~,~] = params(x,fs);

overlap=overlap*fs;

signums=t(end)/somewin;
somewin=somewin*fs;
xsplit=zeros(round(signums+0.4),somewin+overlap);
tsplit=zeros(round(signums+0.4),somewin+overlap);
count=0;
for k=1:signums+1
for i=1:somewin
    if i+count*somewin<=n
    xsplit(k,i)=x(i+count*somewin);
    end
end

tsplit(k,:)=dt*(0:somewin+overlap-1)+(somewin+overlap)*dt*count;
count=count+1;

end
count=0;
if overlap>0
    for k=1:signums
        for i=somewin+1:somewin+overlap
            xsplit(k,i)=x(i+count*somewin);
            tsplit(k,i)=t(i+count*somewin);
        end
        count=count+1;
    end
end
