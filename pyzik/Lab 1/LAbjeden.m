%Task 1

%%
%a
clear;
A=[2 3;4 -6];
%X=[x;y];
b=[4;7];

% since AX=b => X=A^-1b

%A(2x2), b(2x1) multip is valid


if det(A)==0
    disp('invalid matrix equation');
else
X=inv(A)*b;
disp(X);
end

%%
%b


figure(1);
x=linspace(-10,10);
y1=(-2/3)*x+4/3;
plot(x,y1,'r');
hold on;
plot(X(1,1),X(2,1),'b--o');
y2=(4/6)*x-7/6;
plot(x,y2,'k');

%%
%c
xlabel('X');
ylabel('Y');
title('Solutions of system equations');
dim1 = [.3 .5 .3 .3];
dim2 = [.7 .5 .3 .3];
dim3 = [.55 .35 .3 .3];
str1 = '2x+3y=4';
str2 = '4x-6y=7';
str3 = 'x=1.9 y=0.1';
annotation('textbox',dim1,'String',str1,'FitBoxToText','on');
annotation('textbox',dim2,'String',str2,'FitBoxToText','on');
annotation('textbox',dim3,'String',str3,'FitBoxToText','on');
hold off;
save figure(1).png 

%%
%task2 a
clear;

%i=[1:5]; %i(1x5)
y=0; %y(1x5)
t=[0:1/500:4];
for i=1:5
    y=y+(1/i)*sin(2*pi*i*t);
  
end
figure(2);
plot(t,y,'g'); %t(1x2001) , y(1x2001)
hold on;

%%
%b
xlabel('time [s]');
ylabel('y(t)');
title('Solutions of system equations');


%%
% task 3
% a
clear;

x=[-2:0.1:2]; %(1x41)

y=[-5:0.1:5]; %(1x101)

[x,y]=meshgrid(x,y); %both (101x41)

z=40*x.^4+x-x-y.^4+20*y-3; %(101x41)
figure(3);
plot3(x,y,z);

%%
%b

xlabel('X');
ylabel('Y');
zlabel('Z');
title('plot of function z=40*x^4+x-x-y^4+20*y-3');

%%
%c
figure(4);
surf(x,y,z);
colorbar;

%%
%task 4
%a

t=out.bout.Time;
x=out.bout.Data(:,1);
y=out.bout.Data(:,2);

figure(5);
subplot(2,2,1);
plot(x,t);
subplot(2,2,2);
plot(y,t);
subplot(2,2,3);
plot(y,x);

%%
%b














