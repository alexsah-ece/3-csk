function [Px1, Py1, Px2, Py2] = Sender(bit0, bit1, bit2)

    s1=[0 2/sqrt(5)];           %Green
    s2=[-sqrt(3/5) -sqrt(1/5)]; %Blue
    s3=[sqrt(3/5) -sqrt(1/5)];  %Red

    if(bit0==0 && bit1==0 && bit2==0)
        Px1=s2(1);
        Py1=s2(2);
        Px2=s3(1);
        Py2=s3(2);
    elseif(bit0==0 && bit1==0 && bit2==1)
        Px1=s2(1);
        Py1=s2(2);
        Px2=s1(1);
        Py2=s1(2);
    elseif(bit0==0 && bit1==1 && bit2==1)
        Px1=s2(1);
        Py1=s2(2);
        Px2=s2(1);
        Py2=s2(2);
    elseif(bit0==0 && bit1==1 && bit2==0)
        Px1=s1(1);
        Py1=s1(2);
        Px2=s2(1);
        Py2=s2(2);
    elseif(bit0==1 && bit1==1 && bit2==0)
        Px1=s1(1);
        Py1=s1(2);
        Px2=s3(1);
        Py2=s3(2);
    elseif(bit0==1 && bit1==1 && bit2==1)
        Px1=s1(1);
        Py1=s1(2);
        Px2=s1(1);
        Py2=s1(2);
    elseif(bit0==1 && bit1==0 && bit2==1)
        Px1=s3(1);
        Py1=s3(2);
        Px2=s1(1);
        Py2=s1(2);
    elseif(bit0==1 && bit1==0 && bit2==0)
        Px1=s3(1);
        Py1=s3(2);
        Px2=s2(1);
        Py2=s2(2);
    end  
end

