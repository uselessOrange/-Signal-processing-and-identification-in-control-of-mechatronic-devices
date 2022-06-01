clear config
counter=0;
for i=1:10
    for k=1:10
        for n=1:10
            if i+k+n==12
            counter=counter+1;
            config(counter,:)=[i,k,n];
            end
        end
    end
end
