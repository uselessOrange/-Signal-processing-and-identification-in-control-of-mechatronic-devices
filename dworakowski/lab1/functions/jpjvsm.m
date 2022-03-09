function [best,meanjpjvsm,stdjpjvsm,Results,Step]=jpjvsm(reps)
%[best,meanjpjvsm,stdjpjvsm,Results]=jpjvsm()


 
FunctionForOptimization = str2func('nof_2D_manyminima_5');
 

MaxRangeX = [-10 10];  
MaxRangeY = [-10 10];
 
MaxSteps = 800;         

InitialRangeX = MaxRangeX;      
InitialRangeY = MaxRangeY;
 


    CurrentMin = 50000;
    ResultX = 1;
    ResultY = 1;


    EndingCondition = 0;
    iter = 0;
    tic;
 
    
    InitialStep = 10; 
    P1 = 2;
    P2 = 60;

    NewX = InitialRangeX(1) +  rand()*(InitialRangeX(2) - InitialRangeX(1));
    NewY = InitialRangeY(1) +  rand()*(InitialRangeY(2) - InitialRangeY(1));

    for repetition = 1:reps
    
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
            CurrentMin = CurrentValue;  
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
       
        Results(repetition) = BestHistory(end);
    end
    end
    
meanjpjvsm=mean(Results);
stdjpjvsm=std(Results);
best=min(Results);
