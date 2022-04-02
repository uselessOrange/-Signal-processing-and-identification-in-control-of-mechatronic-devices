function [bestindv,bestresult,Results,meanGAesVar,stdGAesVar,BestHistory,CurrentHistory,Step]...
    = fGAmultiLineParMin(dimms,reps,MaxSteps,P_size,n,InitialStep,P1,P2,dataset)

tic;

MaxRangeX = [-5 5];  
MaxRangeY = [-5 5];
InitialRangeX = MaxRangeX;      % This is the range from which we can draw points.
InitialRangeY = MaxRangeY;



for repetition = 1:reps

    EndingCondition = 0;
    iter = 0;


    parfor k = 1:P_size
        Population(k).OF = 5000;
        for i =1:dimms
            Population(k).Parameters.W1(i) = InitialRangeX(1) + rand()*(InitialRangeX(2) - InitialRangeX(1));
            Population(k).Parameters.W2(i) = InitialRangeX(1) + rand()*(InitialRangeX(2) - InitialRangeX(1));
            Population(k).Parameters.B(i) = InitialRangeX(1) + rand()*(InitialRangeX(2) - InitialRangeX(1));
        end
    end

    while(EndingCondition == 0)
iter = iter + 1;

Step(iter) = InitialStep * (1/(1+exp((iter-(MaxSteps/P1))/P2)));

parfor k = 1:P_size

   Population(k).OF = fcost(Population(k).Parameters.W1,Population(k).Parameters.W2,Population(k).Parameters.B,dataset);
end

[~,Indices] = sortrows([Population(:).OF]');

BestHistory(repetition,iter) = Population(Indices(1)).OF;
CurrentHistory(repetition,iter) = Population(Indices(floor(P_size/2))).OF;

NewPopulation(1) = Population(Indices(1));

parfor k = 2:1:P_size
ind1 = randi(n);
ind2 = randi(n);

NewPopulation(k) = Population(Indices(ind1));

NewPopulation(k).Parameters.W1 = Population(Indices(ind1)).Parameters.W1+randn(1,dimms)*Step(iter);
NewPopulation(k).Parameters.W2 = Population(Indices(ind1)).Parameters.W2+randn(1,dimms)*Step(iter);
NewPopulation(k).Parameters.B = Population(Indices(ind1)).Parameters.B+randn(1,dimms)*Step(iter);



NewPopulation(k).OF = Inf;

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

 
   
end
toc;
end







