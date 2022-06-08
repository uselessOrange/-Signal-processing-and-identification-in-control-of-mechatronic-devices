function [Xres,Nrot] = Resample_signal_simplified(x,PM,fs,Nsamp)
% DESCRIPTION
% Function resamples a vibration signal according to a 1-pulse per rotation
% Phase Marker (PM) signal, recorded in parallel 
 
% INPUT
% x     - time signal <1xN>
% PM    - phase marker binary vector <1xN>
% fs    - sampling frequency <1x1>
% Nsamp - new number of samples per rotation (optional) <1x1>
 
% OUTPUT
% Xres  - resampled signal <1xM>
% Nrot  - number of full rotations <1x1>
 
if nargin == 3
    Nsamp = round(2 * mean(diff(find(PM)))); % determine Nsamp auto.
 
    if mod(Nsamp,2)
        Nsamp = Nsamp + 1;
    end
 
end
 
LastPM  = find(PM,1,'last');
FirstPM = find(PM,1);
 
x  = x( 1:LastPM);  x  = x( FirstPM + 1:end);  % trim x  to full rotations
PM = PM(1:LastPM);  PM = PM(FirstPM + 1:end);  % trim PM to full rotations
 
N           = length(x);        % No. of samples in signal "x"
dt          = 1/fs;             % time resolution
t           = dt:dt:N*dt;       % time vector of signal "x"
 
PM          = find(PM);         % indexes of "1" in phase marker (PM)
PMtime      = PM * dt;          % time, when PM are "1"
NoPMrot     = length(PM);       % No. of rotations of referential PM
 
PMrotScale  = 1:1:NoPMrot;                                   % auxiliary
RotScale    = linspace(0, NoPMrot, NoPMrot * Nsamp);         % new base
RotTime     = interp1(PMrotScale, PMtime, RotScale,'pchip'); % interp. #1
Xres        = interp1(t,x,RotTime,'pchip');                  % interp. #2
 
Nrot = floor(length(Xres)/Nsamp);   % new number of full rotations
Xres = Xres(1: Nrot * Nsamp);       % force even length of resampled signal
