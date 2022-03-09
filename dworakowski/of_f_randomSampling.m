% A simple random optimization algorithm. It tries new locations until it
% runs out of time. Delay serves as a way of slowing FunctionPlot.
% It requires a function for optimization (any function from folder
% "FunctionsForOptimization"
 
clear all
addpath FunctionsForOptimization
 
%% Optimization task:
FunctionForOptimization = str2func('nof_2D_oneminimum_2');
 
%% Adjustable parameters:
MaxRangeX = [-10 10];  % Range of parameters for optimization
MaxRangeY = [-10 10];
 
MaxSteps = 100;         % How many iterations do we perform?
FunctionPlot = 1;       % change to 0 If you want to get rid of the underlying function plot 
PointPlot = 1;          % Change to 0 if you want to get rid of the visualization
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
else end
 
%% Storing of a best solution
    CurrentMin = 50000;
    ResultX = 1;
    ResultY = 1;

%% The main optimization loop
    EndingCondition = 0;
    iter = 0;
    tic;
    
    while(EndingCondition == 0);
        iter = iter + 1;
        
        % Random selection of a candidate for optimum:
        NewX = InitialRangeX(1) +  rand()*(InitialRangeX(2) - InitialRangeX(1));
        NewY = InitialRangeY(1) +  rand()*(InitialRangeY(2) - InitialRangeY(1));
        % Check for constraints (they could be different than the range
        % from which we draw our solutions)
        NewX = min(MaxRangeX(2),max(NewX,MaxRangeX(1)));
        NewY = min(MaxRangeY(2),max(NewY,MaxRangeY(1)));
 
% If you'd like to provide function as a 2D image or use here any other objective function, 
% following line needs to be modified. The 0 passed to the function denotes the fact,
% that the function is constant in time.
        CurrentValue =  FunctionForOptimization([NewX,NewY]);       
        
        if(CurrentValue < CurrentMin)
            CurrentMin = CurrentValue;  % Storing of a historically best result
            ResultX = NewX;
            ResultY = NewY;
            % FunctionPlot (green, if we have a new minimum):
            if(PointPlot == 1)
                figure(1);   plot3(NewY, NewX, CurrentValue,'.g'); hold on
            end
        else
            % FunctionPlot (red, if we don't have a new minimum):
            if(PointPlot == 1)
                figure(1);   plot3(NewY, NewX, CurrentValue,'.r'); hold on
            end
        end    
        
        % Command-window stuff for monitoring of algorithm's progress:
        SimTime = toc;
        clc
        fprintf('\nCurrent best:  %f',CurrentMin);
        fprintf('\nCurrent:       %f',CurrentValue);
        fprintf('\n\n\n');
        fprintf('\nIteration:     %d',iter);
        fprintf('\nTime:          %d',SimTime);
        
        BestHistory(iter) = CurrentMin;         % Here we store our historically best result
        CurrentHistory(iter) = CurrentValue;    % Here we store our currently investigated result
        
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
