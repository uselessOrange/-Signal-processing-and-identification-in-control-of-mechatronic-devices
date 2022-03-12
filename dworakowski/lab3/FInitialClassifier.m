function [ClassLabel] = FInitialClassifier(x,y,Parameters)



if(Parameters.W1*x + Parameters.W2*y + Parameters.B > 0)
ClassLabel = 1;
else
ClassLabel = 0;
end
end