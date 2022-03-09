function [bestresult,Results,meanGAmm,stdGAmm,BestHistory,CurrentHistory] = GAmm(reps)
%[bestresult,Results,meanGAmm,stdGAmm,BestHistory,CurrentHistory] = GAmm(reps)
%genetc algorithm, no elite succesion, manyminima_5



FunctionForOptimization = str2func('nof_2D_manyminima_5');
 

MaxRangeX = [-10 10];  % Range of parameters for optimization
MaxRangeY = [-10 10];
 
MaxSteps = 40;         % How many iterations do we perform?

 
    
 
%% Map initialization
InitialRangeX = MaxRangeX;      % This is the range from which we can draw points.
InitialRangeY = MaxRangeY;


    

%% The main optimization loop
    %extraMetaparameters

    P_size=50;
    n = 40;
    Step = 0.5;


    %loop for repetition of algo
for repetition = 1:reps

%intraMetaparameters

    EndingCondition = 0;
    iter = 0;
    tic;


%initializing population
    for k = 1:P_size
        Population(k).OF = 5000;
Population(k).Parameters(1) = InitialRangeX(1) + rand()*(InitialRangeX(2) - InitialRangeX(1));
Population(k).Parameters(2) = InitialRangeY(1) + rand()*(InitialRangeY(2) - InitialRangeY(1));
    end

    while(EndingCondition == 0)
iter = iter + 1;
%assesing fitness
for k = 1:P_size
Population(k).OF = FunctionForOptimization(Population(k).Parameters);
end

%sorting individuals acc to fitness
[~,Indices] = sortrows([Population(:).OF]');
        

%storing best individual
BestHistory(repetition,iter) = Population(Indices(1)).OF;
CurrentHistory(repetition,iter) = Population(Indices(floor(P_size/2))).OF;
BestIndividualGenome(iter) = Population(Indices(1));

NewPopulation(1) = Population(Indices(1));
%cearting new population
for k = 1:1:P_size

%taking random individual from n best
ind1 = randi(n);
ind2 = randi(n);

%makes child the same as 1st parent
NewPopulation(k) = Population(Indices(ind1));

%transfers trait 1 from 2nd parent to child
NewPopulation(k).Parameters(1) = Population(Indices(ind2)).Parameters(1);

%mutate child
NewPopulation(k).Parameters = NewPopulation(k).Parameters + ...
Step*randn(size(NewPopulation(k).Parameters));

%overwriting last value of costfunction
NewPopulation(k).OF = Inf;

%check if child is within range
NewPopulation(k).Parameters = ...
min(MaxRangeX(2),max(NewPopulation(k).Parameters,MaxRangeX(1)));
end

%replaceing parent pop with child pop
Population = NewPopulation;

    if(iter >= MaxSteps)
        EndingCondition = 1;    % To stop the while loop from running
    else 
        
    end
       
        
         Results(repetition) = BestHistory(end);
    end
   meanGAmm=mean(Results);
   stdGAmm=std(Results);
   bestresult(1,repetition)=min(Results);
 
   
end
end