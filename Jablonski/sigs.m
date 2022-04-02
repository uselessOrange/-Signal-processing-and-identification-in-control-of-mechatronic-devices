clear
clc
load('signal_1_wood_saw_decaying_pulse.mat');
x=Basic_reading_Machine_1_Vibro_1(:,2);
fs=Basic_reading_Machine_1_Vibro_1_metadata.SamplingRate;
figure;
subplot(2,1,1);
dt=1/fs;
n=length(x);
T=n*dt;
t=dt:dt:T;
plot(t,x);
xlabel('Time');

y1=fft(x);
y1=abs(y1);
y1=y1(1:(n/2)+1);
y1=y1/(n/2);
f=0:1/(n*dt):fs/2;
subplot(2,1,2);
plot(f,y1);
xlim([0 100])