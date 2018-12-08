clear all
i=1;
for x=1:100
    y=log2(3^x);
    %number(x) = y;
    %integ(x) = fix(number(x));
    %frac(x) = mod(abs(number(x)),1);
    
    suntelestis_aksiopoiisis(x)=(2^(floor(y)))/(3^x);
    if suntelestis_aksiopoiisis(x)>0.88
         foundy(i)=y;
          foundx(i)=x;
        found_suntelestis_aksiopoiisis(i)=suntelestis_aksiopoiisis(x);
        i=i+1;
    end
end