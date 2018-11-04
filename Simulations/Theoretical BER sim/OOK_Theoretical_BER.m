y=zeros(0);
for ebnodB = 0:1:17
    ebno = 10^(ebnodB/10);
    y=[y, qfunc(sqrt(ebno))];
end
ebnodB = 0:1:17;
semilogy(ebnodB, y)
hold on