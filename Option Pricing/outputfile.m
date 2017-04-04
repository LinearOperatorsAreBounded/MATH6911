%%MATH 6911 Assignment 1, Hao Ran Li 215125875
%HedgeRatios StockPrices OptionPrices matrices corresponds to Parameter set 1
%HedgeRatios2 StockPrices2 OptionPrices2 matrices corresponds to Parameter
%set 2

%%
u = 1.1; d = 0.8; r = 0.05; S0 = 100; K = 100; N = 3;
[HedgeRatios StockPrices OptionPrices] = price_option(u, d, r , S0, K, N)
%%
u2 = 1.1; d2 = 0.9; r2 = 0.02; S02 = 100; K2 = 105; N2 = 5;
[HedgeRatios2 StockPrices2 OptionPrices2] = price_option(u2, d2, r2 , S02, K2, N2)