function [bestindv,bestresult,Results,meanGAesVar,stdGAesVar,BestHistory,CurrentHistory,Step]...
    = fGAmultiLineE(dimms,reps,MaxSteps,P_size,n,InitialStep,P1,P2,dataset)


load VA_DATA;
MaxRangeX = [-10 10];  
MaxRangeY = [-10 10];
InitialRangeX = MaxRangeX;      % This is the range from which we can draw points.
InitialRangeY = MaxRangeY;

VAcost=5000;

for repetition = 1:reps

    EndingCondition = 0;
    iter = 0;


    for k = 1:P_size
        Population(k).OF = 5000;
        for i =1:dimms
            Population(k).Parameters(i) = InitialRangeX(1) + rand()*(InitialRangeX(2) - InitialRangeX(1));
        end
    end

    while(EndingCondition == 0)
iter = iter + 1;

Step(iter) = InitialStep * (1/(1+exp((iter-(MaxSteps/P1))/P2)));

for k = 1:P_size
Population(k).OF = fcost(Population(k).Parameters(1,1),Population(k).Parameters(1,2),dataset);
end

[~,Indices] = sortrows([Population(:).OF]');

BestHistory(repetition,iter) = Population(Indices(1)).OF;
CurrentHistory(repetition,iter) = Population(Indices(floor(P_size/2))).OF;

NewPopulation(1) = Population(Indices(1));

for k = 2:1:P_size
ind1 = randi(n);
ind2 = randi(n);

NewPopulation(k) = Population(Indices(ind1));

NewPopulation(k).Parameters(1) = Population(Indices(ind2)).Parameters(1);

NewPopulation(k).Parameters = NewPopulation(k).Parameters + ...
Step(iter)*randn(size(NewPopulation(k).Parameters));

NewPopulation(k).OF = Inf;

NewPopulation(k).Parameters = ...
min(MaxRangeX(2),max(NewPopulation(k).Parameters,MaxRangeX(1)));
end

Population = NewPopulation;



if(iter >= MaxSteps)
        EndingCondition = 1;    
    else 
        
end

       
        
         Results(repetition) = BestHistory(end);
    end
   meanGAesVar=mean(Results);
   stdGAesVar=std(Results);
   bestresult=min(Results);
   bestindv(repetition)=Population(Indices(1));
   vparcost=fcost(Population(1),bestindv(repetition).Parameters(2),VA_DATA);

 if VAcost<vparcost
     EndingCondition =1;
 else
 end
VAcost=fcost(bestindv(repetition).Parameters(1),bestindv(repetition).Parameters(2),VA_DATA);

   
end
end







