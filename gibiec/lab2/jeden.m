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

TR_number = ceil(length(V)*0.9);
VA_number = ceil(length(V)*0);
TE_number = ceil(length(V)*0.1);

TR_Vs = V(3,1:TR_number);
VA_Vs = V(3,TR_number+1:TR_number+VA_number);
TE_Vs = V(3,TR_number+VA_number+1:end);
TR_Vu = V(1:2,1:TR_number);
VA_Vu = V(1:2,TR_number+1:TR_number+VA_number);
TE_Vu = V(1:2,TR_number+VA_number+1:end);



save TR_Vu TR_Vu
save VA_Vu VA_Vu
save TE_Vu TE_Vu
save TR_Vs TR_Vs
save VA_Vs VA_Vs
save TE_Vs TE_Vs
save V