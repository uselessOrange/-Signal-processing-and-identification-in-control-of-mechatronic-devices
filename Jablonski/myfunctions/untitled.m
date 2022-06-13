clear
load data\signal_2_hand_rail_pulse_responses.mat

x=Basic_reading_Machine_1_Vibro_1(:,2)';

fs=Basic_reading_Machine_1_Vibro_1_metadata.SamplingRate;

% [dt,n,t,df,f] = params(x,fs);

%% Plotting signal

% plot(t,x);
% xlabel('time');
% ylabel('amplitude');

%% to frequency domain

% X=fft(x);
% X =X(1:n/2);
% %plot(f,abs(X));
% stem(f,abs(X));

%% data splitting

% [x,t]=datasplit(x,fs,5);

%% spectrum
% X=fft(x);
% X =X(1:n/2);

% [x,~]=datasplit(x,fs,5);
% [dt,m,n,t,df,f] = params(x,fs);
% for i=1:m
%     X(i,:)=fft(x(i,:));
% end
%     Xh(:,:) =X(:,1:n/2);
%    
% for i=1:m
%     psdx(i,:) = (1/(fs*n)) * abs(Xh(i,:)).^2;
%    
% end
% psdx(:,2:end-1) = 2*psdx(:,2:end-1);
% for i=1:n
%     psdxav(i)=mean(psdx(:,i));
% end


[xsplit, tsplit] = datasplit(x, fs, 2,0);
[dt,m,n,t,df,f] = params(xsplit,fs);
count=0;

for i=1:m
    
        
    X(i,:)=abs(fft(xsplit(i,:)));
    
   
end

[f,t]=meshgrid(f,t(1:25000));

plot3(t,f,X(:,1:25000))



