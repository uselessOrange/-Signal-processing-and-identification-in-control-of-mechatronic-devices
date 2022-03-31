%V gen

% x=[-10 10; -5 5];
% V = nngenc(x, 4, 10, 0.5);
% plot(V(1,:), V(2,:), '+');

%V split
Indices = randperm(length(V));
V_permutated = V(:,Indices);
TR_number = ceil(length(V)*0.9);
VA_number = ceil(length(V)*0);
TE_number = ceil(length(V)*0.1);
TR_V = V_permutated(:,1:TR_number);
VA_V = V_permutated(:,TR_number+1:TR_number+VA_number);
TE_V = V_permutated(:,TR_number+VA_number+1:end);

save TR_V TR_V
save VA_V VA_V
save TE_V TE_V