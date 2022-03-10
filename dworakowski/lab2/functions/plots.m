n=10;

[best4,~,meanGAesVar1,stdGAesVar1,BestHistory1,CurrentHistory1,Step4]...
    = GAesVarF(n,40,20,19,10,2,3);
[bestresult,Results,meanGAesVar,stdGAesVar,BestHistory,CurrentHistory,Step5] = ...
    GAesVarM(n,38,21,19,15,2,3);

figure(1);
xlabel('Iteration number');
    ylabel('Objective function value');
for i=1:n

 plot(BestHistory1(i,:),'Color','r'); hold on      
   plot(CurrentHistory1(i,:),'Color','r','LineStyle',':'); 
   
    
end

figure(2);
plot(Step4)
xlabel('iteration');
ylabel('mutation step value');

figure(3);
xlabel('Iteration number');
    ylabel('Objective function value');
for i=1:n

 plot(BestHistory(i,:),'Color','r'); hold on      
   plot(CurrentHistory(i,:),'Color','r','LineStyle',':'); 
   
    
end

figure(4);
plot(Step5)
xlabel('iteration');
ylabel('mutation step value');


