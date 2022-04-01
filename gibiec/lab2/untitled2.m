clear T
clear i
clear n
r=1;
m=10;
for i=1:0.5:10
    for n=1:0.5:10

T(r,:)=[i;n];
r=r+1;
    end
end

T=T';
out=sim("smoczek.slx");
t=(out.simout.Time)';
x=(out.simout.Data);