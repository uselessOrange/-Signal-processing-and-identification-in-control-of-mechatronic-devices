n=1000;
tic;
[best1,mean1,std1,results1,~]=jpjvsm(n);
[best2,mean2,std2,results2,~]=jpjvsf(n);
[best3,mean3,std3,results3,~]=multistartF(n);
toc;

Table={[1.8;1.7;1.6],[best1;best2;best3],[mean1;mean2;mean3],[std1;std2;std3],{results1;results2;results3}};
disp(Table);
