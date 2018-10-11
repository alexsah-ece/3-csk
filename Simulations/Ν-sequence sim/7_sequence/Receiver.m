function s = Receiver(px, py)
    r = [px py];
   
    S1 = [0 2/sqrt(5)];           %Green
    S2 = [-sqrt(3/5) -sqrt(1/5)]; %Blue
    S3 = [sqrt(3/5) -sqrt(1/5)];  %Red
    
    norms=[norm(r-S1) norm(r-S2) norm(r-S3)];
    
    min = norms(1);
    index = 1;
    
    for i=2:1:3
        %Define which was the symbol sent
        if(norms(i) < min)
            min = norms(i);
            index = i;
        end
    end
    
    s = index;
    
end

