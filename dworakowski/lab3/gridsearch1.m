function [ResultX,ResultY,BestHistory,CurrentHistory]=gridsearch1(FunctionPlot,dataset)
%[ResultX,ResultY,BestHistory,CurrentHistory]=gridsearch1(FunctionPlot,dataset)
% A simple random optimization algorithm. It tries new locations until it
% runs out of time. Delay serves as a way of slowing FunctionPlot.
% It requires a function for optimization (any function from folder
% "FunctionsForOptimization"
 


 
PointPlot=FunctionPlot;
 
%% Adjustable parameters:
MaxRangeX = [-5 5];  % Range of parameters for optimization
MaxRangeY = [-5 5];
 
MaxSteps = 100;         % How many iterations do we perform?
      % change to 0 If you want to get rid of the underlying function plot 


 
%% Map initialization
InitialRangeX = MaxRangeX;      % This is the range from which we can draw points.
InitialRangeY = MaxRangeY;
 
%% Map visualization (this code is not used for problem solving)
if(FunctionPlot == 1)
    plotCost(dataset);
end
 
%% Storing of a best solution
    CurrentMin = 50000;
    ResultX = 1;
    ResultY = 1;

%% The main optimization loop
   
    iter = 0;
   
    step_x = 0.2;
    
for NewX = MaxRangeX(1):step_x:MaxRangeX(2)
    for NewY = MaxRangeY(1):step_x:MaxRangeY(2)

        iter = iter + 1;
        
%         % Random selection of a candidate for optimum:
%         NewX = InitialRangeX(1) +  rand()*(InitialRangeX(2) - InitialRangeX(1));
%         NewY = InitialRangeY(1) +  rand()*(InitialRangeY(2) - InitialRangeY(1));
%         % Check for constraints (they could be different than the range
%         % from which we draw our solutions)
%         NewX = min(MaxRangeX(2),max(NewX,MaxRangeX(1)));
%         NewY = min(MaxRangeY(2),max(NewY,MaxRangeY(1)));
 
% If you'd like to provide function as a 2D image or use here any other objective function, 
% following line needs to be modified. The 0 passed to the function denotes the fact,
% that the function is constant in time.
        CurrentValue =  fcost(NewX,NewY,dataset);       
        
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
       
        
        BestHistory(iter) = CurrentMin;         % Here we store our historically best result
        CurrentHistory(iter) = CurrentValue;    % Here we store our currently investigated result
        
    end
end
       
   
 
   
