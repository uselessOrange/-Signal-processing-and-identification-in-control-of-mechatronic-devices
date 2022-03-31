x=-10:2:10;
% x=[x;x;x;x];

% N = size(x,2);
% X = perms(1:21);
% for i=1:size(x,1)
%     for k=1:N
% C(k,i) = x(X(i,k),i);
%     end
% end

x1=zeros(4,(length(x)^4));
b=1;
for i=1:length(x)
for k=1:length(x)
for d=1:length(x)
for n=1:length(x)
x1(:,b)=[x(1,i);x(1,k);x(1,d);x(1,n)];
b=b+1;
end
end
end
end