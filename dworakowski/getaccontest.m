function [accuracy,YPred,YValidation] = getaccontest(net,imdsTest)
%[accuracy,YPred,YValidation] = getaccontest(net,imdsTest)
YPred = classify(net,imdsTest);
YValidation = imdsTest.Labels;
accuracy = sum(YPred == YValidation)/numel(YValidation);
end

