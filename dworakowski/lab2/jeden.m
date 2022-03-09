% A simple random optimization algorithm. It tries new locations until it
% runs out of time. Delay serves as a way of slowing FunctionPlot.
% It requires a function for optimization (any function from folder
% "FunctionsForOptimization"
 
clear;

 
%% Optimization task:
FunctionForOptimization = str2func('nof_2D_fewminima_5');
 
%% Adjustable parameters:
MaxRangeX = [-10 10];  % Range of parameters for optimization
MaxRangeY = [-10 10];
 
MaxSteps = 71;         % How many iterations do we perform?
FunctionPlot = 0;       % change to 0 If you want to get rid of the underlying function plot 
PointPlot = 0;          % Change to 0 if you want to get rid of the visualization
ConvergenceColor = 'r'; % Change color of the convergence curve here
%close all              % Comment this out if you want to have many convergence curves plotted
 
ViewVect = [0,90];             % Initial viewpoint
Delay = 0.001;                 % Inter-loop delay  - to slow down the visualization
FunctionPlotQuality = 0.05;    % Quality of function interpolation. Lower for a quicker run
 
%% Map initialization
InitialRangeX = MaxRangeX;      % This is the range from which we can draw points.
InitialRangeY = MaxRangeY;
 
%% Map visualization (this code is not used for problem solving)
if(FunctionPlot == 1)
    figure(1);
    clf
        vectX = [MaxRangeX(1):FunctionPlotQuality:MaxRangeX(2)];
        vectY = [MaxRangeY(1):FunctionPlotQuality:MaxRangeY(2)];
        [X,Y] = meshgrid(vectX,vectY);    indx = 1;  indy = 1;
        for x = vectX
            indy = 1;
            for y = vectY
                Val(indx,indy) = FunctionForOptimization([x,y]);
                indy = indy + 1;
            end
            indx = indx + 1;
        end
        mesh(X,Y,Val);    surf(X,Y,Val,'LineStyle','none');
        view(ViewVect);   colormap(bone);    hold on
else 
end
 
%% Storing of a best solution
    CurrentMin = 50000;
    ResultX = 1;
    ResultY = 1;

%% The main optimization loop
    %Metaparameters

    P_size=28;
   % n = 24;
   n=15;
    Step = 1;

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
        
%plotting population
if(FunctionPlot == 1)
figure(1);
clf
surf(X,Y,Val,'LineStyle','none');
view(ViewVect)
colormap(bone)
hold on
else
end

if(PointPlot == 1)
for k = 1:1:P_size
plot3([Population(k).Parameters(1)],[Population(k).Parameters(2)],[Population(k).OF],'.r');
hold on
end
end

%storing best individual
BestHistory(iter) = Population(Indices(1)).OF;
CurrentHistory(iter) = Population(Indices(floor(P_size/2))).OF;
BestIndividualGenome(iter) = Population(Indices(1));

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

%ending loop
SimTime = toc;
clc
fprintf('\nCurrent best: %f',BestHistory(end));
fprintf('\nIteration: %d',iter);
fprintf('\nTime: %d',SimTime);

    if(iter >= MaxSteps)
        EndingCondition = 1;    % To stop the while loop from running
    else 
        
    end
        % If we'd like to slow down the simulation - this line is where it
        % is done:
        pause(Delay);
    end
 
    figure(2);
    plot(BestHistory,'Color',ConvergenceColor); hold on      
    plot(CurrentHistory,'Color',ConvergenceColor,'LineStyle',':'); hold on
    xlabel('Iteration number');
    ylabel('Objective function value');
    
    %works
