function [dt,m,n,t,df,f] = params(x,fs)
%[dt,m,n,t,df,f] = params(x,fs)
%% Parapeters for time domain
dt=1/fs;

[m,n]=size(x);


t=(0:n-1).*dt;

%% Parameters for freq domain

df=(fs/n);

f=df*(0:n/2-1);
end