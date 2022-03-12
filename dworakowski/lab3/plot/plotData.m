function plotData(dataset)
for k = 1:length(dataset)
if(dataset(1,k) == 1)
plot(dataset(2,k),dataset(3,k),'or'); hold on
else
plot(dataset(2,k),dataset(3,k),'ob'); hold on
end
end
xlabel('x');
ylabel('y');
ylim([-3 4]);