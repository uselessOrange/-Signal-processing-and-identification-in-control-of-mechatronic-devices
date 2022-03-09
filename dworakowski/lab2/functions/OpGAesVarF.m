n=5;

[bestresult,Results,meanGAesVar,stdGAesVar,BestHistory,CurrentHistory,Step] = ...
    GAesVarF(n,38,21,19,15,2,3);

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