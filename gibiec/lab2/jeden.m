%V gen

x=[-10 10; -5 5];
V = nngenc(x, 4, 100, 0.5);
plot(V(1,:), V(2,:), '+');

%label
l=length(V);
i=1;
while i<=l
V(3,i)=1;
V(3,i+1)=2;
V(3,i+2)=3;
V(3,i+3)=4;
i=i+4;
end

%V split
% Indices = randperm(length(V));
% V_permutated = V(:,Indices);
TR_number = ceil(length(V)*0.9);
VA_number = ceil(length(V)*0);
TE_number = ceil(length(V)*0.1);
% TR_Vu = V_permutated(1:2,1:TR_number);
% VA_Vu = V_permutated(1:2,TR_number+1:TR_number+VA_number);
% TE_Vu = V_permutated(1:2,TR_number+VA_number+1:end);
TR_Vs = V(3,1:TR_number);
VA_Vs = V(3,TR_number+1:TR_number+VA_number);
TE_Vs = V(3,TR_number+VA_number+1:end);
TR_Vu = V(1:2,1:TR_number);
VA_Vu = V(1:2,TR_number+1:TR_number+VA_number);
TE_Vu = V(1:2,TR_number+VA_number+1:end);


save TR_V TR_V
save VA_V VA_V
save TE_V TE_V
save V