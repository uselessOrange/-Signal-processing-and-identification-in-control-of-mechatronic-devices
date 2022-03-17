function [bestindv,bestresult,Results,meanGAesVar,stdGAesVar,BestHistory,CurrentHistory,Step]...
    = fGA(plot,reps,MaxSteps,P_size,n,InitialStep,P1,P2,dataset)
%[bestindv,bestresult,Results,meanGAesVar,stdGAesVar,BestHistory,CurrentHistory,Step] = GAes(reps,MaxSteps,P_size,n,InitialStep,P1,P2,dataset)
%genetc algorithm, elite succesion, manyminima_5


 
ViewVect = [0,90];
MaxRangeX = [-5 5];  % Range of parameters for optimization
MaxRangeY = [-5 5];
FunctionPlotQuality = 0.05;

InitialRangeX = MaxRangeX;      % This is the range from which we can draw points.
InitialRangeY = MaxRangeY;

 if(plot == 1)
    figure(1);
   
        vectX = [MaxRangeX(1):FunctionPlotQuality:MaxRangeX(2)];
        vectY = [MaxRangeY(1):FunctionPlotQuality:MaxRangeY(2)];
        [X,Y] = meshgrid(vectX,vectY);    indx = 1;  indy = 1;
        for x = vectX
            indy = 1;
            for y = vectY
                Val(indx,indy) = fcost(x,y,dataset);
                indy = indy + 1;
            end
            indx = indx + 1;
        end
        mesh(X,Y,Val);    surf(X,Y,Val,'LineStyle','none');
        view(ViewVect);   colormap(bone);    hold on
else 
end





 
%MaxSteps = 40;         % How many iterations do we perform?

 
    
 
%% Map initialization



    

%% The main optimization loop
    %extraMetaparameters

  %  P_size=50;
  %  n = 40;
   


    %loop for repetition of algo
for repetition = 1:reps

%intraMetaparameters

    EndingCondition = 0;
    iter = 0;
    tic;

   % InitialStep = 2; % Exploration/exploitation balance parameters:
%P1 = 2;
% P2 = 10;


%initializing population
    for k = 1:P_size
        Population(k).OF = 5000;
Population(k).Parameters(1) = InitialRangeX(1) + rand()*(InitialRangeX(2) - InitialRangeX(1));
Population(k).Parameters(2) = InitialRangeY(1) + rand()*(InitialRangeY(2) - InitialRangeY(1));
    end

    while(EndingCondition == 0)
iter = iter + 1;

%calculating value of mutation step
Step(iter) = InitialStep * (1/(1+exp((iter-(MaxSteps/P1))/P2)));

%assesing fitness
for k = 1:P_size
Population(k).OF = fcost(Population(k).Parameters(1,1),Population(k).Parameters(1,2),1,dataset);
end

%sorting individuals acc to fitness
[~,Indices] = sortrows([Population(:).OF]');
        
if(plot == 1)
figure(1);
clf
surf(X,Y,Val,'LineStyle','none');
view(ViewVect)
colormap(bone)
hold on

for k = 1:1:P_size
plot3([Population(k).Parameters(1)],[Population(k).Parameters(2)],[Population(k).OF],'.r');
hold on
end
else
end



%storing best individual
BestHistory(repetition,iter) = Population(Indices(1)).OF;
CurrentHistory(repetition,iter) = Population(Indices(floor(P_size/2))).OF;


%Keep best performer unchanged
NewPopulation(1) = Population(Indices(1));

%cearting new population
for k = 2:1:P_size

%taking random individual from n best
ind1 = randi(n);
ind2 = randi(n);

%makes child the same as 1st parent
NewPopulation(k) = Population(Indices(ind1));

%transfers trait 1 from 2nd parent to child
NewPopulation(k).Parameters(1) = Population(Indices(ind2)).Parameters(1);

%mutate child
NewPopulation(k).Parameters = NewPopulation(k).Parameters + ...
Step(iter)*randn(size(NewPopulation(k).Parameters));

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
   meanGAesVar=mean(Results);
   stdGAesVar=std(Results);
   bestresult=min(Results);
   bestindv(repetition)=Population(Indices(1));

 
   
end
end