function [best,meanms,stdms,Results,Step]=multistartF(reps)
%[best,meanms,stdms,Results,Step]=multistartF(reps)





FunctionForOptimization = str2func('nof_2D_fewminima_5');
 
MaxRangeX = [-10 10];  
MaxRangeY = [-10 10];
 
MaxSteps = 19;         


InitialRangeX = MaxRangeX;      
InitialRangeY = MaxRangeY;

g_step = 0.01;
Step=1;
Starts = 7;
iter = 0;

    InitialStep = 2; % Exploration/exploitation balance parameters:
    P1 = 5;
    P2 = 3;

    for repetition = 1:reps
        CurrentMin = 50000;

EndingCondition = 0;
iter = 0;
    for starts =1:Starts
    EndingCondition = 0;
    
    iter1=0;
    
    NewX = InitialRangeX(1) + rand()*(InitialRangeX(2) - InitialRangeX(1));
    NewY = InitialRangeY(1) + rand()*(InitialRangeY(2) - InitialRangeY(1));
    
    
    
    
    while(EndingCondition == 0)
        iter = iter + 1;
        iter1=iter1+1;
        Step(iter1) = InitialStep * (1/(1+exp((iter1-(MaxSteps/P1))/P2)));
         
        CurrentValue = FunctionForOptimization([NewX,NewY]);
        CV_dx = FunctionForOptimization([NewX+g_step,NewY]);
        CV_dy = FunctionForOptimization([NewX,NewY+g_step]);

        CV = CurrentValue; % So we'd fit on one page of the instruction ;)
        NewX = NewX + Step(iter1)*(CV-CV_dx)/sqrt((CV-CV_dx)^2 + (CV-CV_dy)^2);
        NewY = NewY + Step(iter1)*(CV-CV_dy)/sqrt((CV-CV_dx)^2 + (CV-CV_dy)^2);

%         % Random selection of a candidate for optimum:
%         NewX = InitialRangeX(1) +  rand()*(InitialRangeX(2) - InitialRangeX(1));
%         NewY = InitialRangeY(1) +  rand()*(InitialRangeY(2) - InitialRangeY(1));
        % Check for constraints (they could be different than the range
        % from which we draw our solutions)
        NewX = min(MaxRangeX(2),max(NewX,MaxRangeX(1)));
        NewY = min(MaxRangeY(2),max(NewY,MaxRangeY(1)));
 
% If you'd like to provide function as a 2D image or use here any other objective function, 
% following line needs to be modified. The 0 passed to the function denotes the fact,
% that the function is constant in time.
        CurrentValue =  FunctionForOptimization([NewX,NewY]);       
        
        if(CurrentValue < CurrentMin)
            CurrentMin = CurrentValue;  
            
        else
           
           
       end    
        
        
      
        
        
        BestHistory(iter) = CurrentMin;         % Here we store our historically best result
        CurrentHistory(iter) = CurrentValue;    % Here we store our currently investigated result
        
    if(iter1 >= MaxSteps)
        EndingCondition = 1;    % To stop the while loop from running
    else 
        
    end
        % If we'd like to slow down the simulation - this line is where it
        % is done:
        

    end
    Results(repetition) = BestHistory(end);
    end
    end
 
    
best=min(Results);
meanms=mean(Results);
stdms=std(Results);

%done

