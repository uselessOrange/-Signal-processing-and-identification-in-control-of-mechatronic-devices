n=5;

[bestresult,Results,meanGAesVarMulti,stdGAesVarMulti,BestHistory,CurrentHistory,Step] = ...
    GAesVarMulti(n,31,32,11,1.8,2.8,1.8);

figure(3);
xlabel('Iteration number');
    ylabel('Objective function value');
for i=1:n

 plot(BestHistory(i,:),'Color','r'); hold on      
   plot(CurrentHistory(i,:),'Color','r','LineStyle',':'); 
   
    
end

figure(4);
plot(Step(1,:))
xlabel('iteration');
ylabel('mutation step value');