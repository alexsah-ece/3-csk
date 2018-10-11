figure
addpath ./5_sequence;
Tester
rmpath ./5_sequence;
disp('5-sequence finished...');
addpath ./7_sequence;
Tester
rmpath ./7_sequence;
disp('7-sequence finished...');
addpath ./12_sequence;
Tester
rmpath ./12_sequence;
savefig('comp_5_7_12_sequence.fig');