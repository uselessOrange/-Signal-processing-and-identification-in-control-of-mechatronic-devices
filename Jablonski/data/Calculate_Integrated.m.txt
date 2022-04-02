function [xInt] = Calculate_Integrated(x,fs)

% COMMENTS
% Earlier HP signal filtering recommended.
% Taking "dt" out of the loop changes result in Matlab of the (e-10) order.

% INPUT
% x  - real time signal <1xN>
% fs - sampling frequency <1x1>

% OUTPUT
% x  - integrated real time signal <1xN>

x = x(:);         % force colums vector
N = length(x);
x = x - mean(x);  % remove DC component before integration

xInt    = x;      % cumulative variable
xInt(1) = 0;

for i = 2:N
    xInt(i) = xInt(i-1)+x(i)/fs; % division by fs is multiplication by dt
end

xInt = xInt - mean(xInt);  % remove DC component after integration
