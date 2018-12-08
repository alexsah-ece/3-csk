% Mapping for 7 sequences
clear

%% Abstraction

nOfBitsSent = 3;   % Number of bits to be encoded all together
nOfSymbolsSent = 2; % Number of symbols used to encode the above bits every time

%% Bit table 

% We want least bit errors so we select gray coding
real_num = 0:(2^(nOfBitsSent)-1);
gray_code = dec2gc(real_num,nOfBitsSent);

%% Symbol table 

% We want the least errors between neighbooring symbols
M = nOfSymbolsSent;
symbols = [1;2;3];

% We create a simple table 'combos' with all the available permutations in
% ascending order
combos = permn(symbols,M);

% We want to create a gray-like mapping. Starting from the most significant
% bit we list all the possible combinations.
gray_like_combos=zeros(length(symbols)^M,M);
for m=1:(M-2)
    % Create a temporary column 
    temp_col = zeros(3*length(symbols)^(M-m),1);
    step = (length(symbols)^(M-m));
    for j=1:(3*length(symbols)^(M-m))
        if (j<=step)
            temp_col(j)=1;
        elseif (j>step && j<=(2*step))
            temp_col(j)=2;
        else
            temp_col(j)=3;
        end
    end
    % Populate the 'gray_like_combos' 
    gray_like_combos(1:3*length(symbols)^(M-m),m) = temp_col;
    for i=1:(length(symbols)^M)/(3*length(symbols)^(M-m))-1
        j=(3*length(symbols)^(M-m))*i+1;
        if (mod(i,2)==0)
            gray_like_combos(j:j+3*length(symbols)^(M-m)-1,m) = temp_col;
        else
            gray_like_combos(j:j+3*length(symbols)^(M-m)-1,m) = flipud(temp_col);
        end
    end
end

% On the last two columns we add the hardcoded gray-like sequence of the
% 2-bit system.
last_mapping = [2 3;2 1;2 2;1 2;1 3;1 1;3 1;3 2;3 3];
gray_like_combos(1:9,[M-1,M]) = last_mapping;
for i=1:(length(symbols)^M)/9-1
    j=9*i+1;
    if (mod(i,2)==0)
        gray_like_combos(j:j+8,[M-1,M]) = last_mapping;
    else
        gray_like_combos(j:j+8,[M-1,M]) = flipud(last_mapping);
    end
end

%% Proof of correctness

isRight=true;
for i=1:(length(gray_like_combos)-1)
    count=0;
    for j=1:M
        if gray_like_combos(i,j)~=gray_like_combos(i+1,j)
            count=count+1;
        end
    end
    if count>1
        isRight=false;
        break;
    end
end
isRight

%% Maping

 %Mapping bits sequences to positions on gray_code
    SUMS = zeros(1, length(gray_code));
    for i=1:1:length(gray_code)
        sum = 0;
        for j=1:1:nOfBitsSent
            sum = sum + gray_code(i,j)*2^(nOfBitsSent-j);
        end
    SUMS(i)= sum;
    end
    i=1:1:length(gray_code);
    M_bits = containers.Map(SUMS, i);
    
    disp("Gray mapping finished...")
    
    %Mapping symbol sequences to positions on combos
    SUMS_dec = zeros(1, length(gray_like_combos));
    for i=1:1:length(gray_like_combos)
        sum = 0;
        for j=1:1:nOfSymbolsSent
            sum = sum + gray_like_combos(i,j)*4^(nOfSymbolsSent-j);
        end
    SUMS_dec(i)= sum;
    end
    i=1:1:length(combos);
    M_symbols = containers.Map(SUMS_dec, i);
    
    save('Maps_2.mat', 'M_bits', 'M_symbols', 'gray_like_combos', 'gray_code');
 