function [bit0, bit1] = Receiver(px, py)
    r = [px py];
    
    S00=[0 2/sqrt(5)];
    S01=[0 0];
    S10=[-sqrt(3/5) -sqrt(1/5)];
    S11=[sqrt(3/5) -sqrt(1/5)];
    
    norms=[norm(r-S00) norm(r-S01) norm(r-S10) norm(r-S11)];
    
    min = norms(1);
    index = 1;
    for i=2:1:4
        if(norms(i) < min)
            min = norms(i);
            index = i;
        end
    end
    
    switch(index)
        case 1
            bit0 = 0;
            bit1 = 0;  
        case 2
            bit0 = 0;
            bit1 = 1;
        case 3
            bit0 = 1;
            bit1 = 0;
        case 4
            bit0 = 1;
            bit1 = 1;
    end       
         


end

