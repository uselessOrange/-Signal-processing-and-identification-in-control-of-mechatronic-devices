function [cost]=fcost(x,y,b,dataset)
% [cost]=fcost(x,y,dataset)



Parameters.W1 = x;
Parameters.W2 = y;
Parameters.B = b;
ErrorsA = 0;
ErrorsB = 0;
for k = 1:length(dataset)
if(FInitialClassifier(dataset(2,k),dataset(3,k),Parameters) == 1)
% Data point classified as A
if(dataset(1,k) == 1)
% Data point classified correctly!

else

ErrorsA = ErrorsA + 1;
end
else
% Data point classified as B
if(dataset(1,k) == 0)
% Data point classified correctly!

else

ErrorsB = ErrorsB + 1;
end
end
end

cost=ErrorsA+ErrorsB;