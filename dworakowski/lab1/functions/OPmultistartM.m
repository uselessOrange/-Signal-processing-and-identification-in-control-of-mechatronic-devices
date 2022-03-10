n=5;

[best,meanms,stdms,Results,BestHistory,CurrentHistory,Step]=multistartM(n,24,11,10,1.8,1.2);

figure(1);
xlabel('Iteration number');
    ylabel('Objective function value');
for i=1:n

 plot(BestHistory(i,:),'Color','r'); hold on      
   plot(CurrentHistory(i,:),'Color','r','LineStyle',':'); 
   
    
end

figure(2);
plot(Step)
xlabel('iteration');
ylabel('mutation step value');