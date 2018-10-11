function s = Receiver(r)
   
    S1 = 0;
    S2 = 2;
    
    norms=[norm(r-S1) norm(r-S2)];
    
    min = norms(1);
    index = 1;
    
    for i=2:1:2
        %Define which was the symbol sent
        if(norms(i) < min)
            min = norms(i);
            index = i;
        end
    end
    
    s = index-1;
    
end

