function [PM] = Get_phase_markers(x)
% DESCRIPTION
% Function returns a set of Phase Markers for a vibration signal x. Note:
% the signal must be a single sinusoidal components.
 
% INPUT
% x  - raw vibration signal <1xN>
 
% OUTPUT
% PM - a binary vector with "1" and approximated PM-pulses and zeros
%      otherwise <1xN>
 
N  = length(x);     % No. of samples in the signal
PM = zeros(1,N);    % initial PM signal
 
for i = 1:N-1
    if x(i+1) < x(i)                % CONDITION #1
        if x(i+1) < 0 && x(i) > 0   % CONDITION #2 and CONDITION #3
            PM(i+1) = 1;            %  falling edge passes through zero
        end
    end
end
