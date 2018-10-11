function [bit0, bit1, bit2] = Receiver(px1, py1, px2, py2)
    r1 = [px1 py1];
    r2 = [px2 py2];
    
    S1 = [0 2/sqrt(5)];           %Green
    S2 = [-sqrt(3/5) -sqrt(1/5)]; %Blue
    S3 = [sqrt(3/5) -sqrt(1/5)];  %Red
    
    norms1=[norm(r1-S1) norm(r1-S2) norm(r1-S3)];
    norms2=[norm(r2-S1) norm(r2-S2) norm(r2-S3)];
    
    min1 = norms1(1);
    min2 = norms2(1);
    index1 = 1;
    index2 = 1;
    
    for i=2:1:3
        %Define which was the first color sent
        if(norms1(i) < min1)
            min1 = norms1(i);
            index1 = i;
        end
        %Define which was the second color sent
        if(norms2(i) < min2)
            min2 = norms2(i);
            index2 = i;
        end
    end
    
    if(index1==2 && index2==3)
      bit0=0;
      bit1=0;
      bit2=0;
    elseif(index1==2 && index2==1)
      bit0=0;
      bit1=0;
      bit2=1;
    elseif(index1==2 && index2==2)
      bit0=0;
      bit1=1;
      bit2=1; 
    elseif(index1==1 && index2==2)
      bit0=0;
      bit1=1;
      bit2=0;    
    elseif(index1==1 && index2==3)
      bit0=1;
      bit1=1;
      bit2=0;  
    elseif(index1==1 && index2==1)
      bit0=1;
      bit1=1;
      bit2=1;   
    elseif(index1==3 && index2==1)
      bit0=1;
      bit1=0;
      bit2=1; 
    else
      bit0=1;
      bit1=0;
      bit2=0; 
    end

end

