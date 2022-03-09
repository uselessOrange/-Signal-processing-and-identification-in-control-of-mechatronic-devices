n=50;

[bestresult,Results,meanGAesVarMulti,stdGAesVarMulti,BestHistory,CurrentHistory,Step] = ...
    GAesVarMulti(n,40,25,7,10,2.3,2.9);

figure(1);
xlabel('Iteration number');
    ylabel('Objective function value');
for i=1:n

 plot(BestHistory(i,:),'Color','r'); hold on      
   plot(CurrentHistory(i,:),'Color','r','LineStyle',':'); 
   
    
end

figure(2);
plot(Step(1,:))
xlabel('iteration');
ylabel('mutation step value');