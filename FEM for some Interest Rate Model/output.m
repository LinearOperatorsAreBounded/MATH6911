%% MATH 6911 Assignment 2 
% Hao Ran Li 215125875
%% The scheme
% 	Let $A_{i} = \frac{\delta_{t}k(\theta - i\delta_{r})}{2\delta_{r}}$ and $B_{i} = \frac{\delta_{t}\sigma^{2}i\delta_{r}}{2\delta_{r}^{2}}$. Then the scheme is 
% 	$P_{i, j+1} = (A + B)P_{i+1,j} + (B-A)P_{i-1,j} + (1-\delta_{t}i\delta_{r} - 2\delta_{t}B_{i})P_{i,j}$
%% Time & Space steps
% I used 1,000,000 steps for time and 1000 steps for space. the results are
% very close and you can see from the bottom.
%% T = 0.1; r = 0.01; 
fprintf('the approximate value is %d.\n', approxP(0.1, 0.01, 0.8, 0.05, 0.2, 1000000, 1000));
fprintf('the actual value is %d.\n',P(0.1, 0.01, 0.8, 0.05, 0.2));
fprintf('the difference is %d. \n', abs(approxP(0.1, 0.01, 0.8, 0.05, 0.2, 1000000, 1000) - P(0.1, 0.01, 0.8, 0.05, 0.2)));
%% T = 0.1; r = 0.05;
fprintf('the approximate value is %d.\n', approxP(0.1, 0.05, 0.8, 0.05, 0.2, 1000000, 1000));
fprintf('the actual value is %d.\n',P(0.1, 0.05, 0.8, 0.05, 0.2));
fprintf('the difference is %d. \n', abs(approxP(0.1, 0.05, 0.8, 0.05, 0.2, 1000000, 1000) - P(0.1, 0.05, 0.8, 0.05, 0.2)));
%% T = 0.1; r = 0.1;
fprintf('the approximate value is %d.\n', approxP(0.1, 0.1, 0.8, 0.05, 0.2, 1000000, 1000));
fprintf('the actual value is %d.\n',P(0.1, 0.1, 0.8, 0.05, 0.2));
fprintf('the difference is %d. \n', abs(approxP(0.1, 0.1, 0.8, 0.05, 0.2, 1000000, 1000) - P(0.1, 0.1, 0.8, 0.05, 0.2)));
%% T = 0.5; r = 0.01;
fprintf('the approximate value is %d.\n', approxP(0.5, 0.01, 0.8, 0.05, 0.2, 1000000, 1000));
fprintf('the actual value is %d.\n',P(0.5, 0.01, 0.8, 0.05, 0.2));
fprintf('the difference is %d. \n', abs(approxP(0.5, 0.01, 0.8, 0.05, 0.2, 1000000, 1000) - P(0.5, 0.01, 0.8, 0.05, 0.2)));
%% T = 0.5; r = 0.05;
fprintf('the approximate value is %d.\n', approxP(0.5, 0.05, 0.8, 0.05, 0.2, 1000000, 1000));
fprintf('the actual value is %d.\n',P(0.5, 0.05, 0.8, 0.05, 0.2));
fprintf('the difference is %d. \n', abs(approxP(0.5, 0.05, 0.8, 0.05, 0.2, 1000000, 1000) - P(0.5, 0.05, 0.8, 0.05, 0.2)));
%% T = 0.5; r = 0.1;
fprintf('the approximate value is %d.\n', approxP(0.5, 0.1, 0.8, 0.05, 0.2, 1000000, 1000));
fprintf('the actual value is %d.\n',P(0.5, 0.1, 0.8, 0.05, 0.2));
fprintf('the difference is %d. \n', abs(approxP(0.5, 0.1, 0.8, 0.05, 0.2, 1000000, 1000) - P(0.5, 0.1, 0.8, 0.05, 0.2)));
%% T = 1; r = 0.01;
fprintf('the approximate value is %d.\n', approxP(1, 0.01, 0.8, 0.05, 0.2, 1000000, 1000));
fprintf('the actual value is %d.\n',P(1, 0.01, 0.8, 0.05, 0.2));
fprintf('the difference is %d. \n', abs(approxP(1, 0.01, 0.8, 0.05, 0.2, 1000000, 1000) - P(1, 0.01, 0.8, 0.05, 0.2)));
%% T = 1; r = 0.05;
fprintf('the approximate value is %d.\n', approxP(1, 0.05, 0.8, 0.05, 0.2, 1000000, 1000));
fprintf('the actual value is %d.\n',P(1, 0.05, 0.8, 0.05, 0.2));
fprintf('the difference is %d. \n', abs(approxP(1, 0.05, 0.8, 0.05, 0.2, 1000000, 1000) - P(1, 0.05, 0.8, 0.05, 0.2)));
%% T = 1; r = 0.1;
fprintf('the approximate value is %d.\n', approxP(1, 0.1, 0.8, 0.05, 0.2, 1000000, 1000));
fprintf('the actual value is %d.\n',P(1, 0.1, 0.8, 0.05, 0.2));
fprintf('the difference is %d. \n', abs(approxP(1, 0.1, 0.8, 0.05, 0.2, 1000000, 1000) - P(1, 0.1, 0.8, 0.05, 0.2)));