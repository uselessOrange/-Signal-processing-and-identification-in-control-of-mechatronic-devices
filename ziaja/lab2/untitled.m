fs=  200; 
T=1/fs;
t=0:T:2    % time vector
N=length(t);      % number of samples
fr=10;
x=  sin(2*pi*fr*t);    % signal

y=fft(x)
Imag_x_dft= imag(y);        % imaginary part of the spectrum (amplitude normalized by the number of samples)

% stepInFreqency=     % step in the frequency domain 
freq=fs*(0:length(t)-1);               % freqency vector
f_Nq=  max(freq)/2;             % Nyquist frequency

figure (1)
plot(freq,Imag_x_dft);
ylabel('imaginary part of the spectrum ')
xlabel('frequency [Hz]')