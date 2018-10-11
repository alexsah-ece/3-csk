function [Px, Py] = Sender(s)

    s1=[0 2/sqrt(5)];           %Green
    s2=[-sqrt(3/5) -sqrt(1/5)]; %Blue
    s3=[sqrt(3/5) -sqrt(1/5)];  %Red

    switch s
        case 1
            Px = s1(1);
            Py = s1(2);
        case 2
            Px = s2(1);
            Py = s2(2);
        otherwise
            Px = s3(1);
            Py = s3(2);
    end
end

