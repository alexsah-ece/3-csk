% Mapping for 7 sequences

%% Bit table 
% We want least bit errors so we select gray coding
real_num = 0:2047;
N = 11;
gray_code = dec2gc(real_num,N);

%% Symbol table 
% We want the least errors between neighbooring symbols
symbols = [1;2;3];
combos = permn(symbols,7)

%% 
%{
%Abstraction
    nOfBitsSent = 19;   % Number of bits to be encoded all together
    nOfSymbolsSent = 12; % Number of symbols used to encode the above bits every time
    
    %Gray Code matrix
    real_num = 0:(2^(nOfBitsSent)-1);
    gray_code = dec2gc(real_num,nOfBitsSent);
    
    disp("Gray matrix finished...")
    
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
    M = containers.Map(SUMS, i);
    
    disp("Gray mapping finished...")
    
    %Symbol permutations matrix
    symbols = [1;2;3];
    combos = permn(symbols,nOfSymbolsSent);
    
    disp("Symbol permutations finished...")
    
    %Mapping symbol sequences to positions on combos
    SUMS_dec = zeros(1, length(combos));
    for i=1:1:length(combos)
        sum = 0;
        for j=1:1:nOfSymbolsSent
            sum = sum + combos(i,j)*4^(nOfSymbolsSent-j);
        end
    SUMS_dec(i)= sum;
    end
    i=1:1:length(combos);
    M_symbols = containers.Map(SUMS_dec, i);
    
    save('Maps.mat', 'M', 'M_symbols', 'combos', 'gray_code');
%}