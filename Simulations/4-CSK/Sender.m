function [Px, Py] = Sender(bit0, bit1)

    s1=[0 2/sqrt(5)];
    s2=[0 0];
    s3=[-sqrt(3/5) -sqrt(1/5)];
    s4=[sqrt(3/5) -sqrt(1/5)];


    if(bit0==0 && bit1==0)
        Px=s1(1);
        Py=s1(2);
    elseif(bit0==0 && bit1==1)
        Px=s2(1);
        Py=s2(2);
    elseif(bit0==1 && bit1==0)
        Px=s3(1);
        Py=s3(2);
    else
        Px=s4(1);
        Py=s4(2);
    end
    
    
end

