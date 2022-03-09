function [best,meanjpjvsm,stdjpjvsm,Results,Step]=jpjvsf(reps)
%function [best,meanjpjvsm,stdjpjvsm,Results]=jpjvsf()

 
FunctionForOptimization = str2func('nof_2D_fewminima_5');
 

MaxRangeX = [-10 10]; 
MaxRangeY = [-10 10];
 
MaxSteps = 400;         



InitialRangeX = MaxRangeX;      
InitialRangeY = MaxRangeY;
 



    CurrentMin = 50000;
    ResultX = 1;
    ResultY = 1;


    EndingCondition = 0;
    iter = 0;
    tic;
 
    
    InitialStep = 10; 
    P1 = 1.5;
    P2 = 30;

    NewX = InitialRangeX(1) +  rand()*(InitialRangeX(2) - InitialRangeX(1));
    NewY = InitialRangeY(1) +  rand()*(InitialRangeY(2) - InitialRangeY(1));

    for repetition =1:reps
     
CurrentMin = 50000;
ResultX = 1;
ResultY = 1;
EndingCondition = 0;
iter = 0;

    while(EndingCondition == 0)
        iter = iter + 1;
        Step(iter) = InitialStep * (1/(1+exp((iter-(MaxSteps/P1))/P2)));
        NewX = ResultX+Step(iter)*randn();
        NewY = ResultY+Step(iter)*randn();
        
        NewX = min(MaxRangeX(2),max(NewX,MaxRangeX(1)));
        NewY = min(MaxRangeY(2),max(NewY,MaxRangeY(1)));

 

        CurrentValue =  FunctionForOptimization([NewX,NewY]);       
        
        if(CurrentValue < CurrentMin)
            CurrentMin = CurrentValue;  % Storing of a historically best result
            ResultX = NewX;
            ResultY = NewY;
            % FunctionPlot (green, if we have a new minimum):
            
        else
            
        end
          

        
        
      
        
        BestHistory(iter) = CurrentMin;         
        CurrentHistory(iter) = CurrentValue;    
        
    if(iter >= MaxSteps)
        EndingCondition = 1;    
    else 
        
    end
        % If we'd like to slow down the simulation - this line is where it
        % is done:
        
        Results(repetition) = BestHistory(end);
    end
    end
 
    
meanjpjvsm=mean(Results);
stdjpjvsm=std(Results);
best=min(Results);

%works
