function plotCostOfHypothesis(x,y,dataset)
% plotCostOfHypothesis(line,x,y,dataset)




Parameters.W1 = x;
Parameters.W2 = y;
Parameters.B = 1;
ErrorsA = 0;
ErrorsB = 0;
for k = 1:length(dataset)
if(FInitialClassifier(dataset(2,k),dataset(3,k),Parameters) == 1)
% Data point classified as A
if(dataset(1,k) == 1)
% Data point classified correctly!
plot(dataset(2,k),dataset(3,k),'ok'); hold on
else
plot(dataset(2,k),dataset(3,k),'or') ; hold on
ErrorsA = ErrorsA + 1;
end
else
% Data point classified as B
if(dataset(1,k) == 0)
% Data point classified correctly!
plot(dataset(2,k),dataset(3,k),'xk'); hold on
else
plot(dataset(2,k),dataset(3,k),'xr') ; hold on
ErrorsB = ErrorsB + 1;
end
end
end
xlabel('x');
ylabel('y');
x=linspace(-10:1:10);
y=
