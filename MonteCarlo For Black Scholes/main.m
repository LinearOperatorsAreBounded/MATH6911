%% MATH 6911 Assignment 2 
% Hao Ran Li 215125875
%% Determining probability of winning based on switching
D = [1 2 3];
win= 0;
lose =0;
car = randi([1,3],1,1000000);
door = randi([1,3],1,1000000);
for i =1:1:1000 
    if door(i) == car(i)
        lose = lose+1;
    end
    if door(i) ~= car(i)
        win = win +1;
    end
end
fprintf('the probability of winning based on switching strategy is %.4f', round(win/(win+lose), 5));
%% Monte Carlo Method for European Call
%Suppose we have $S_{0} = 100, T = 1,K = 100, r = 0.05, \sigma = 0.2$
tic;
[a b] = MC_european_call(100, 1, 100, 0.05, 0.2, 100000,10000);
toc;
% fprintf('The Monte Carlo gives price to be %.4f', a);
% fprintf('\n');
% fprintf('with standard deviation %.4f', b);
% fprintf('\n');
% fprintf('with 95%% confidence interval (%.4f, %.4f)', a - (1.96*b)/sqrt(100000),a + (1.96*b)/sqrt(100000) );
% fprintf('\n');
% fprintf('The actual Black Scholes formula gives price to be %.4f', Black_Scholes_call_price(100, 1, 100, 0.05, 0.2));
%%
 logS=0.5+0.2*sqrt(0.001)*cumsum(randn(1,1000));