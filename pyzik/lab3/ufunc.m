function [step]=ufunc(n)
for k=1:length(n)
if n(k)>=0
    step(k)=1;
else
    step(k)=0;
end
end
